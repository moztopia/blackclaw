# CharacterProfile


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**class_id** | **int** |  | [optional] 
**class_name** | **str** |  | [optional] 
**race_id** | **int** |  | [optional] 
**race_name** | **str** |  | [optional] 
**level** | **int** |  | [optional] 
**gender** | **str** |  | [optional] 
**deity** | **str** |  | [optional] 
**alignment** | **int** |  | [optional] 

## Example

```python
from darkclaw_census_api_client.models.character_profile import CharacterProfile

# TODO update the JSON string below
json = "{}"
# create an instance of CharacterProfile from a JSON string
character_profile_instance = CharacterProfile.from_json(json)
# print the JSON string representation of the object
print(CharacterProfile.to_json())

# convert the object into a dict
character_profile_dict = character_profile_instance.to_dict()
# create an instance of CharacterProfile from a dict
character_profile_from_dict = CharacterProfile.from_dict(character_profile_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


