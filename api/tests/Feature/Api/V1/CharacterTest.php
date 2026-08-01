<?php

use Illuminate\Http\Client\Request;
use Illuminate\Support\Facades\Http;

it('normalizes an upstream character page', function (): void {
    Http::fake([
        '*' => Http::response([
            'character_list' => [[
                'id' => 463858770551,
                'ts' => 1700000000,
                'displayname' => 'Zarenda (Butcherblock)',
                'name' => ['first' => 'Zarenda', 'last' => 'Moon'],
                'type' => [
                    'classid' => 6,
                    'class' => 'Wizard',
                    'raceid' => 3,
                    'race' => 'Erudite',
                    'level' => 125,
                    'gender' => 'Female',
                ],
                'locationdata' => [
                    'worldid' => 108,
                    'world' => 'Butcherblock',
                    'zonename' => 'Freeport',
                    'coords' => '1,2,3',
                ],
            ]],
            'returned' => 1,
        ]),
    ]);

    $response = $this->getJson(
        '/api/v1/games/eq2/characters?pageSize=1&name=Zarenda&sort=-level',
    );

    $response->assertOk()->assertJsonPath('data.0.id', '463858770551')
        ->assertJsonPath('data.0.name.first', 'Zarenda')
        ->assertJsonPath('data.0.profile.className', 'Wizard')
        ->assertJsonPath('data.0.location.serverName', 'Butcherblock')
        ->assertJsonPath('page.pageSize', 1)
        ->assertJsonPath('page.returned', 1);

    Http::assertSent(function (Request $request): bool {
        parse_str($request->url(), $query);

        return str_contains($request->url(), '/s:example/get/eq2/character')
            && $request['c:limit'] === 1
            && $request['c:sort'] === 'type.level:-1'
            && $request['name.first'] === 'Zarenda';
    });
});

it('returns problem details when a character does not exist', function (): void {
    Http::fake(['*' => Http::response(['character_list' => [], 'returned' => 0])]);

    $this->getJson('/api/v1/games/eq2/characters/999')
        ->assertNotFound()
        ->assertHeader('content-type', 'application/problem+json')
        ->assertExactJson([
            'type' => 'https://darkclaw.mozrin.com/problems/not-found',
            'title' => 'Resource not found',
            'status' => 404,
            'detail' => 'The requested character does not exist.',
        ]);
});
