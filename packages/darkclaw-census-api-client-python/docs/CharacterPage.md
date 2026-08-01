# CharacterPage


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**data** | [**List[Character]**](Character.md) |  | 
**page** | [**PageMetadata**](PageMetadata.md) |  | 

## Example

```python
from darkclaw_census_api_client.models.character_page import CharacterPage

# TODO update the JSON string below
json = "{}"
# create an instance of CharacterPage from a JSON string
character_page_instance = CharacterPage.from_json(json)
# print the JSON string representation of the object
print(CharacterPage.to_json())

# convert the object into a dict
character_page_dict = character_page_instance.to_dict()
# create an instance of CharacterPage from a dict
character_page_from_dict = CharacterPage.from_dict(character_page_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


