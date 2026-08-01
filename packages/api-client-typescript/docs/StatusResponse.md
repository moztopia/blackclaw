
# StatusResponse


## Properties

Name | Type
------------ | -------------
`status` | string
`service` | string
`timestamp` | Date

## Example

```typescript
import type { StatusResponse } from '@monorepo/api-client'

// TODO: Update the object below with actual values
const example = {
  "status": ok,
  "service": monorepo-api,
  "timestamp": 2026-07-12T10:30Z,
} satisfies StatusResponse

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as StatusResponse
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


