<?php

use Illuminate\Support\Carbon;

it('returns the api status contract', function (): void {
    $this->freezeSecond(function (Carbon $now): void {
        $response = $this->getJson('/api/v1/status');

        $response
            ->assertOk()
            ->assertHeader('content-type', 'application/json')
            ->assertExactJson([
                'status' => 'ok',
                'service' => strtolower(config('app.name')),
                'timestamp' => $now->toRfc3339String(),
            ]);
    });
});
