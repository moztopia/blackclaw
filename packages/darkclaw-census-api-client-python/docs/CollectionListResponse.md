# CollectionListResponse


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**data** | [**List[Collection]**](Collection.md) |  | 

## Example

```python
from darkclaw_census_api_client.models.collection_list_response import CollectionListResponse

# TODO update the JSON string below
json = "{}"
# create an instance of CollectionListResponse from a JSON string
collection_list_response_instance = CollectionListResponse.from_json(json)
# print the JSON string representation of the object
print(CollectionListResponse.to_json())

# convert the object into a dict
collection_list_response_dict = collection_list_response_instance.to_dict()
# create an instance of CollectionListResponse from a dict
collection_list_response_from_dict = CollectionListResponse.from_dict(collection_list_response_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


