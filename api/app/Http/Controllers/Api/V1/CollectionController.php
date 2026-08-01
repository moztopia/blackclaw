<?php

namespace App\Http\Controllers\Api\V1;

use App\Exceptions\CensusGatewayException;
use App\Http\Controllers\Controller;
use App\Services\CensusClient;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use InvalidArgumentException;

final class CollectionController extends Controller
{
    public function __construct(private readonly CensusClient $census) {}

    public function index(string $gameId): JsonResponse
    {
        try {
            $payload = $this->census->collections($gameId);
        } catch (InvalidArgumentException $exception) {
            return $this->problem(404, 'Game not found', $exception->getMessage(), 'game-not-found');
        } catch (CensusGatewayException $exception) {
            return $this->upstreamProblem($exception);
        }

        $data = collect($payload['datatype_list'] ?? [])->map(fn (array $item): array => [
            'id' => (string) $item['name'],
            'recordCount' => (int) ($item['count'] ?? 0),
            'hidden' => (bool) ($item['hidden'] ?? false),
            'indexes' => array_values($item['indexes'] ?? []),
            'resolvers' => array_values($item['resolve_list'] ?? []),
        ])->values();

        return response()->json(['data' => $data]);
    }

    public function records(Request $request, string $gameId, string $collectionId): JsonResponse
    {
        $options = $this->options($request);
        try {
            $payload = $this->census->records($gameId, $collectionId, $options);
        } catch (InvalidArgumentException $exception) {
            return $this->problem(400, 'Invalid request', $exception->getMessage(), 'invalid-request');
        } catch (CensusGatewayException $exception) {
            return $this->upstreamProblem($exception);
        }

        return response()->json($this->page($payload, $collectionId, $options));
    }

    public function show(
        Request $request,
        string $gameId,
        string $collectionId,
        string $recordId,
    ): JsonResponse {
        try {
            $payload = $this->census->record(
                $gameId,
                $collectionId,
                $recordId,
                $this->options($request, false),
            );
        } catch (InvalidArgumentException $exception) {
            return $this->problem(400, 'Invalid request', $exception->getMessage(), 'invalid-request');
        } catch (CensusGatewayException $exception) {
            return $this->upstreamProblem($exception);
        }

        $record = ($payload[$collectionId.'_list'] ?? [])[0] ?? null;
        if (! is_array($record)) {
            return $this->problem(404, 'Resource not found', 'The requested record does not exist.', 'not-found');
        }

        return response()->json(['data' => $record]);
    }

    /** @return array<string, int|string> */
    private function options(Request $request, bool $paged = true): array
    {
        $validated = $request->validate([
            'pageSize' => ['sometimes', 'integer', 'min:1', 'max:100'],
            'cursor' => ['sometimes', 'string'],
            'fields' => ['sometimes', 'string'],
            'sort' => ['sometimes', 'string'],
            'language' => ['sometimes', 'in:en,de,es,fr,it,ja'],
        ]);
        $options = array_filter([
            'pageSize' => $paged ? (int) ($validated['pageSize'] ?? 20) : null,
            'offset' => $paged ? $this->census->offset($validated['cursor'] ?? null) : null,
            'fields' => $validated['fields'] ?? null,
            'sort' => $validated['sort'] ?? null,
            'language' => $validated['language'] ?? null,
        ], fn (mixed $value): bool => $value !== null);

        return $options;
    }

    /**
     * @param  array<string, mixed>  $payload
     * @param  array<string, int|string>  $options
     * @return array<string, mixed>
     */
    private function page(array $payload, string $collectionId, array $options): array
    {
        $data = array_values($payload[$collectionId.'_list'] ?? []);
        $pageSize = (int) $options['pageSize'];
        $offset = (int) $options['offset'];

        return [
            'data' => $data,
            'page' => [
                'pageSize' => $pageSize,
                'returned' => count($data),
                'nextCursor' => count($data) === $pageSize
                    ? $this->census->cursor($offset + count($data))
                    : null,
            ],
        ];
    }

    private function upstreamProblem(CensusGatewayException $exception): JsonResponse
    {
        return $this->problem(502, 'Upstream service failure', $exception->getMessage(), 'upstream-failure');
    }
}
