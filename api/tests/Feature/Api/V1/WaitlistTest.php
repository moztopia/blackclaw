<?php

use App\Models\WaitlistEntry;
use Illuminate\Foundation\Testing\RefreshDatabase;

uses(RefreshDatabase::class);

it('records a website update signup and its interest', function (): void {
    $response = $this->postJson('/api/v1/waitlist', [
        'name' => 'Alyssa',
        'email' => 'alyssa@example.com',
        'what_for' => 'using-the-api',
    ]);

    $response->assertCreated()->assertExactJson(['message' => 'You\'re on the list!']);

    $this->assertDatabaseHas('waitlist', [
        'name' => 'Alyssa',
        'email' => 'alyssa@example.com',
        'what_for' => 'using-the-api',
    ]);
});

it('treats a repeated signup as successful without duplicating it', function (): void {
    WaitlistEntry::create([
        'name' => 'Alyssa',
        'email' => 'alyssa@example.com',
        'what_for' => 'project-updates',
    ]);

    $this->postJson('/api/v1/waitlist', [
        'name' => 'Alyssa',
        'email' => 'alyssa@example.com',
        'what_for' => 'project-updates',
    ])->assertOk();

    expect(WaitlistEntry::count())->toBe(1);
    $this->getJson('/api/v1/waitlist/count')->assertOk()->assertExactJson(['count' => 1]);
});

it('rejects an unknown signup interest', function (): void {
    $this->postJson('/api/v1/waitlist', [
        'name' => 'Alyssa',
        'email' => 'alyssa@example.com',
        'what_for' => 'anything-goes',
    ])->assertUnprocessable()->assertJsonValidationErrors('what_for');
});
