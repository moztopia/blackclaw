# CharacterLocation


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**server_id** | **int** |  | [optional] 
**server_name** | **str** |  | [optional] 
**zone_name** | **str** |  | [optional] 
**coordinates** | **str** |  | [optional] 

## Example

```python
from darkclaw_census_api_client.models.character_location import CharacterLocation

# TODO update the JSON string below
json = "{}"
# create an instance of CharacterLocation from a JSON string
character_location_instance = CharacterLocation.from_json(json)
# print the JSON string representation of the object
print(CharacterLocation.to_json())

# convert the object into a dict
character_location_dict = character_location_instance.to_dict()
# create an instance of CharacterLocation from a dict
character_location_from_dict = CharacterLocation.from_dict(character_location_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


