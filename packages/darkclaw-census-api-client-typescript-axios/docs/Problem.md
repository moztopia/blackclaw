# Problem

RFC 9457 problem details.

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**type** | **string** |  | [default to undefined]
**title** | **string** |  | [default to undefined]
**status** | **number** |  | [default to undefined]
**detail** | **string** |  | [optional] [default to undefined]
**instance** | **string** |  | [optional] [default to undefined]

## Example

```typescript
import { Problem } from '@darkclaw/census-api-client';

const instance: Problem = {
    type,
    title,
    status,
    detail,
    instance,
};
```

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
