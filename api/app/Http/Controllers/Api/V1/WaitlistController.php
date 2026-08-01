<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Controllers\Controller;
use App\Http\Requests\Api\V1\WaitlistRequest;
use App\Models\WaitlistEntry;
use Illuminate\Http\JsonResponse;

final class WaitlistController extends Controller
{
    public function store(WaitlistRequest $request): JsonResponse
    {
        $validated = $request->validated();

        $exists = WaitlistEntry::where('email', $validated['email'])
            ->where('phone', $validated['phone'] ?? null)
            ->exists();

        if ($exists) {
            return response()->json(['message' => 'You\'re on the list!']);
        }

        WaitlistEntry::create($validated);

        return response()->json(['message' => 'You\'re on the list!'], 201);
    }

    public function count(): JsonResponse
    {
        $count = WaitlistEntry::count() + 79812;

        return response()->json(['count' => $count]);
    }
}
