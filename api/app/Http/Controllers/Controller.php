<?php

namespace App\Http\Controllers;

use Illuminate\Http\JsonResponse;

abstract class Controller
{
    protected function problem(
        int $status,
        string $title,
        string $detail,
        string $type,
    ): JsonResponse {
        return response()
            ->json([
                'type' => 'https://darkclaw.mozrin.com/problems/'.$type,
                'title' => $title,
                'status' => $status,
                'detail' => $detail,
            ], $status)
            ->header('Content-Type', 'application/problem+json');
    }
}
