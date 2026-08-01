<?php

namespace App\Http\Resources\Api\V1;

use Carbon\CarbonInterface;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

final class StatusResource extends JsonResource
{
    /**
     * Return the contract object directly instead of Laravel's default
     * top-level `data` wrapper.
     *
     * @var null
     */
    public static $wrap = null;

    /**
     * @return array{status: string, service: string, timestamp: string}
     */
    public function toArray(Request $request): array
    {
        /** @var CarbonInterface $generatedAt */
        $generatedAt = $this->resource;

        return [
            'status' => 'ok',
            'service' => strtolower(config('app.name')),
            'timestamp' => $generatedAt->toRfc3339String(),
        ];
    }
}
