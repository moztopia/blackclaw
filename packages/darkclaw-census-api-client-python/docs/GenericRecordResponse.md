# GenericRecordResponse


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**data** | **Dict[str, object]** | Untyped upstream record retained as an advanced escape hatch. | 

## Example

```python
from darkclaw_census_api_client.models.generic_record_response import GenericRecordResponse

# TODO update the JSON string below
json = "{}"
# create an instance of GenericRecordResponse from a JSON string
generic_record_response_instance = GenericRecordResponse.from_json(json)
# print the JSON string representation of the object
print(GenericRecordResponse.to_json())

# convert the object into a dict
generic_record_response_dict = generic_record_response_instance.to_dict()
# create an instance of GenericRecordResponse from a dict
generic_record_response_from_dict = GenericRecordResponse.from_dict(generic_record_response_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


