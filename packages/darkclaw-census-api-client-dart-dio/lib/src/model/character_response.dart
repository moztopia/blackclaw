//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:darkclaw_census_api_client/src/model/character.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'character_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CharacterResponse {
  /// Returns a new [CharacterResponse] instance.
  CharacterResponse({

    required  this.data,
  });

  @JsonKey(
    
    name: r'data',
    required: true,
    includeIfNull: false,
  )


  final Character data;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CharacterResponse &&
      other.data == data;

    @override
    int get hashCode =>
        data.hashCode;

  factory CharacterResponse.fromJson(Map<String, dynamic> json) => _$CharacterResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

