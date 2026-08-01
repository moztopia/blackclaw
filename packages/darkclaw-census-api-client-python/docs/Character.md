# Character


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **str** |  | 
**name** | [**CharacterName**](CharacterName.md) |  | 
**display_name** | **str** |  | [optional] 
**profile** | [**CharacterProfile**](CharacterProfile.md) |  | [optional] 
**location** | [**CharacterLocation**](CharacterLocation.md) |  | [optional] 
**updated_at** | **datetime** |  | [optional] 

## Example

```python
from darkclaw_census_api_client.models.character import Character

# TODO update the JSON string below
json = "{}"
# create an instance of Character from a JSON string
character_instance = Character.from_json(json)
# print the JSON string representation of the object
print(Character.to_json())

# convert the object into a dict
character_dict = character_instance.to_dict()
# create an instance of Character from a dict
character_from_dict = Character.from_dict(character_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


