<?php

namespace App\Services;

use App\Exceptions\CensusGatewayException;
use Illuminate\Http\Client\ConnectionException;
use Illuminate\Support\Facades\Http;
use InvalidArgumentException;
use Throwable;

final class CensusClient
{
    /** @var array<string, string> */
    private const NAMESPACES = [
        'eq' => 'eq',
        'eq2' => 'eq2',
        'mtg' => 'mtgo:v1',
        'dcu' => 'dcuo:v1',
        'ps' => 'ps',
        'ps2' => 'ps2:v2',
        'ps2ps4us' => 'ps2ps4us:v2',
        'ps2ps4eu' => 'ps2ps4eu:v2',
    ];

    /**
     * @return array<string, mixed>
     */
    public function collections(string $gameId): array
    {
        return $this->get('/get/'.$this->namespace($gameId).'/');
    }

    /**
     * @param  array<string, scalar|null>  $options
     * @param  array<string, scalar>  $filters
     * @return array<string, mixed>
     */
    public function records(
        string $gameId,
        string $collectionId,
        array $options = [],
        array $filters = [],
    ): array {
        $query = $this->query($options) + $filters;

        return $this->get(
            '/get/'.$this->namespace($gameId).'/'.$collectionId,
            $query,
        );
    }

    /**
     * @param  array<string, scalar|null>  $options
     * @return array<string, mixed>
     */
    public function record(
        string $gameId,
        string $collectionId,
        string $recordId,
        array $options = [],
    ): array {
        return $this->get(
            '/get/'.$this->namespace($gameId).'/'.$collectionId.'/'.$recordId,
            $this->query($options),
        );
    }

    public function offset(?string $cursor): int
    {
        if ($cursor === null) {
            return 0;
        }

        $decoded = base64_decode(strtr($cursor, '-_', '+/'), true);
        if ($decoded === false || preg_match('/^offset:([0-9]+)$/', $decoded, $matches) !== 1) {
            throw new InvalidArgumentException('The pagination cursor is invalid.');
        }

        return (int) $matches[1];
    }

    public function cursor(int $offset): string
    {
        return rtrim(strtr(base64_encode('offset:'.$offset), '+/', '-_'), '=');
    }

    private function namespace(string $gameId): string
    {
        return self::NAMESPACES[$gameId]
            ?? throw new InvalidArgumentException('The requested game is not supported.');
    }

    /**
     * @param  array<string, scalar|null>  $options
     * @return array<string, scalar>
     */
    private function query(array $options): array
    {
        $query = [];
        $mapping = [
            'pageSize' => 'c:limit',
            'offset' => 'c:start',
            'fields' => 'c:show',
            'language' => 'c:lang',
        ];
        foreach ($mapping as $modern => $upstream) {
            if (isset($options[$modern])) {
                $query[$upstream] = $options[$modern];
            }
        }
        if (isset($options['sort'])) {
            $query['c:sort'] = collect(explode(',', (string) $options['sort']))
                ->map(fn (string $field): string => str_starts_with($field, '-')
                    ? substr($field, 1).':-1'
                    : $field.':1')
                ->implode(',');
        }

        return $query;
    }

    /**
     * @param  array<string, scalar>  $query
     * @return array<string, mixed>
     */
    private function get(string $path, array $query = []): array
    {
        $baseUrl = rtrim((string) config('services.census.base_url'), '/');
        $serviceId = (string) config('services.census.service_id');

        try {
            $response = Http::acceptJson()
                ->timeout((int) config('services.census.timeout'))
                ->get($baseUrl.'/s:'.$serviceId.$path, $query)
                ->throw();
            $payload = $response->json();
        } catch (ConnectionException $exception) {
            throw new CensusGatewayException(
                'Census did not respond before the request timed out.',
                previous: $exception,
            );
        } catch (Throwable $exception) {
            throw new CensusGatewayException(
                'Census could not complete the request.',
                previous: $exception,
            );
        }

        if (! is_array($payload)) {
            throw new CensusGatewayException('Census returned an invalid response.');
        }
        if (isset($payload['error'])) {
            throw new CensusGatewayException((string) $payload['error']);
        }

        return $payload;
    }
}
