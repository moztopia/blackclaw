//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:darkclaw_census_api_client/src/model/collection.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'collection_list_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CollectionListResponse {
  /// Returns a new [CollectionListResponse] instance.
  CollectionListResponse({

    required  this.data,
  });

  @JsonKey(
    
    name: r'data',
    required: true,
    includeIfNull: false,
  )


  final List<Collection> data;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CollectionListResponse &&
      other.data == data;

    @override
    int get hashCode =>
        data.hashCode;

  factory CollectionListResponse.fromJson(Map<String, dynamic> json) => _$CollectionListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CollectionListResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

