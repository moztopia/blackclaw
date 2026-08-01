# CharacterResponse


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**data** | [**Character**](Character.md) |  | 

## Example

```python
from darkclaw_census_api_client.models.character_response import CharacterResponse

# TODO update the JSON string below
json = "{}"
# create an instance of CharacterResponse from a JSON string
character_response_instance = CharacterResponse.from_json(json)
# print the JSON string representation of the object
print(CharacterResponse.to_json())

# convert the object into a dict
character_response_dict = character_response_instance.to_dict()
# create an instance of CharacterResponse from a dict
character_response_from_dict = CharacterResponse.from_dict(character_response_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


