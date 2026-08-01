# GenericRecordPage


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**data** | **List[Dict[str, object]]** |  | 
**page** | [**PageMetadata**](PageMetadata.md) |  | 

## Example

```python
from darkclaw_census_api_client.models.generic_record_page import GenericRecordPage

# TODO update the JSON string below
json = "{}"
# create an instance of GenericRecordPage from a JSON string
generic_record_page_instance = GenericRecordPage.from_json(json)
# print the JSON string representation of the object
print(GenericRecordPage.to_json())

# convert the object into a dict
generic_record_page_dict = generic_record_page_instance.to_dict()
# create an instance of GenericRecordPage from a dict
generic_record_page_from_dict = GenericRecordPage.from_dict(generic_record_page_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


