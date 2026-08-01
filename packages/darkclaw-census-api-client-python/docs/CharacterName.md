# CharacterName


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**first** | **str** |  | 
**last** | **str** |  | [optional] 

## Example

```python
from darkclaw_census_api_client.models.character_name import CharacterName

# TODO update the JSON string below
json = "{}"
# create an instance of CharacterName from a JSON string
character_name_instance = CharacterName.from_json(json)
# print the JSON string representation of the object
print(CharacterName.to_json())

# convert the object into a dict
character_name_dict = character_name_instance.to_dict()
# create an instance of CharacterName from a dict
character_name_from_dict = CharacterName.from_dict(character_name_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


