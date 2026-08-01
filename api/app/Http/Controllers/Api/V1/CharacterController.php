<?php

namespace App\Http\Controllers\Api\V1;

use App\Exceptions\CensusGatewayException;
use App\Http\Controllers\Controller;
use App\Services\CensusClient;
use Carbon\CarbonImmutable;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use InvalidArgumentException;

final class CharacterController extends Controller
{
    public function __construct(private readonly CensusClient $census) {}

    public function index(Request $request): JsonResponse
    {
        $validated = $request->validate([
            'pageSize' => ['sometimes', 'integer', 'min:1', 'max:100'],
            'cursor' => ['sometimes', 'string'],
            'fields' => ['sometimes', 'string'],
            'name' => ['sometimes', 'string', 'min:1'],
            'server' => ['sometimes', 'string', 'min:1'],
            'className' => ['sometimes', 'string', 'min:1'],
            'minimumLevel' => ['sometimes', 'integer', 'min:1'],
            'maximumLevel' => ['sometimes', 'integer', 'min:1', 'gte:minimumLevel'],
            'sort' => ['sometimes', 'in:name,-name,level,-level,updatedAt,-updatedAt'],
            'language' => ['sometimes', 'in:en,de,es,fr,it,ja'],
        ]);
        $pageSize = (int) ($validated['pageSize'] ?? 20);

        try {
            $offset = $this->census->offset($validated['cursor'] ?? null);
            $payload = $this->census->records('eq2', 'character', [
                'pageSize' => $pageSize,
                'offset' => $offset,
                'fields' => $this->upstreamFields($validated['fields'] ?? null),
                'sort' => $this->upstreamSort($validated['sort'] ?? 'name'),
                'language' => $validated['language'] ?? 'en',
            ], array_filter([
                'name.first' => $validated['name'] ?? null,
                'locationdata.world' => $validated['server'] ?? null,
                'type.class' => $validated['className'] ?? null,
                'type.level' => isset($validated['minimumLevel'], $validated['maximumLevel'])
                    ? $validated['minimumLevel'].'^'.$validated['maximumLevel']
                    : ($validated['minimumLevel'] ?? null),
            ], fn (mixed $value): bool => $value !== null));
        } catch (InvalidArgumentException $exception) {
            return $this->problem(400, 'Invalid request', $exception->getMessage(), 'invalid-request');
        } catch (CensusGatewayException $exception) {
            return $this->problem(502, 'Upstream service failure', $exception->getMessage(), 'upstream-failure');
        }

        $data = collect($payload['character_list'] ?? [])->map($this->normalize(...))->values();

        return response()->json([
            'data' => $data,
            'page' => [
                'pageSize' => $pageSize,
                'returned' => $data->count(),
                'nextCursor' => $data->count() === $pageSize
                    ? $this->census->cursor($offset + $data->count())
                    : null,
            ],
        ]);
    }

    public function show(Request $request, string $characterId): JsonResponse
    {
        $validated = $request->validate([
            'fields' => ['sometimes', 'string'],
            'language' => ['sometimes', 'in:en,de,es,fr,it,ja'],
        ]);
        try {
            $payload = $this->census->record('eq2', 'character', $characterId, [
                'fields' => $this->upstreamFields($validated['fields'] ?? null),
                'language' => $validated['language'] ?? 'en',
            ]);
        } catch (CensusGatewayException $exception) {
            return $this->problem(502, 'Upstream service failure', $exception->getMessage(), 'upstream-failure');
        }
        $character = ($payload['character_list'] ?? [])[0] ?? null;
        if (! is_array($character)) {
            return $this->problem(404, 'Resource not found', 'The requested character does not exist.', 'not-found');
        }

        return response()->json(['data' => $this->normalize($character)]);
    }

    /** @param array<string, mixed> $character @return array<string, mixed> */
    private function normalize(array $character): array
    {
        $name = $character['name'] ?? [];
        $type = $character['type'] ?? [];
        $location = $character['locationdata'] ?? [];

        return [
            'id' => (string) $character['id'],
            'name' => ['first' => (string) ($name['first'] ?? ''), 'last' => $name['last'] ?? null],
            'displayName' => $character['displayname'] ?? null,
            'profile' => [
                'classId' => $type['classid'] ?? null,
                'className' => $type['class'] ?? null,
                'raceId' => $type['raceid'] ?? null,
                'raceName' => $type['race'] ?? null,
                'level' => $type['level'] ?? null,
                'gender' => $type['gender'] ?? null,
                'deity' => $type['deity'] ?? null,
                'alignment' => $type['alignment'] ?? null,
            ],
            'location' => [
                'serverId' => $location['worldid'] ?? null,
                'serverName' => $location['world'] ?? null,
                'zoneName' => $location['zonename'] ?? null,
                'coordinates' => $location['coords'] ?? null,
            ],
            'updatedAt' => isset($character['ts'])
                ? CarbonImmutable::createFromTimestampUTC((int) $character['ts'])->toRfc3339String()
                : null,
        ];
    }

    private function upstreamSort(string $sort): string
    {
        $descending = str_starts_with($sort, '-');
        $field = ltrim($sort, '-');
        $mapped = ['name' => 'name.first', 'level' => 'type.level', 'updatedAt' => 'ts'][$field];

        return ($descending ? '-' : '').$mapped;
    }

    private function upstreamFields(?string $fields): ?string
    {
        if ($fields === null) {
            return null;
        }
        $mapping = [
            'displayName' => 'displayname',
            'profile' => 'type',
            'location' => 'locationdata',
            'updatedAt' => 'ts',
        ];

        return collect(explode(',', $fields))
            ->map(fn (string $field): string => $mapping[$field] ?? $field)
            ->push('id')
            ->unique()
            ->implode(',');
    }
}
