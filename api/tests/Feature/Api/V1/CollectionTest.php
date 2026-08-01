<?php

use Illuminate\Support\Facades\Http;

it('normalizes collection discovery', function (): void {
    Http::fake(['*' => Http::response([
        'datatype_list' => [[
            'name' => 'character',
            'count' => 2400000,
            'hidden' => false,
            'indexes' => [['id'], ['name.first']],
            'resolve_list' => ['statistics'],
        ]],
        'returned' => 1,
    ])]);

    $this->getJson('/api/v1/games/eq2/collections')
        ->assertOk()
        ->assertExactJson(['data' => [[
            'id' => 'character',
            'recordCount' => 2400000,
            'hidden' => false,
            'indexes' => [['id'], ['name.first']],
            'resolvers' => ['statistics'],
        ]]]);
});

it('provides cursor pagination for advanced collection records', function (): void {
    Http::fake(['*' => Http::response([
        'item_list' => [['id' => 1], ['id' => 2]],
        'returned' => 2,
    ])]);

    $response = $this->getJson(
        '/api/v1/games/eq2/collections/item/records?pageSize=2',
    );

    $response->assertOk()
        ->assertJsonPath('data.1.id', 2)
        ->assertJsonPath('page.returned', 2);
    expect($response->json('page.nextCursor'))->toBeString()->not->toBeEmpty();
});
