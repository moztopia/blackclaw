//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:darkclaw_census_api_client/src/model/character_location.dart';
import 'package:darkclaw_census_api_client/src/model/character_profile.dart';
import 'package:darkclaw_census_api_client/src/model/character_name.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'character.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Character {
  /// Returns a new [Character] instance.
  Character({

    required  this.id,

    required  this.name,

     this.displayName,

     this.profile,

     this.location,

     this.updatedAt,
  });

  @JsonKey(
    
    name: r'id',
    required: true,
    includeIfNull: false,
  )


  final String id;



  @JsonKey(
    
    name: r'name',
    required: true,
    includeIfNull: false,
  )


  final CharacterName name;



  @JsonKey(
    
    name: r'displayName',
    required: false,
    includeIfNull: false,
  )


  final String? displayName;



  @JsonKey(
    
    name: r'profile',
    required: false,
    includeIfNull: false,
  )


  final CharacterProfile? profile;



  @JsonKey(
    
    name: r'location',
    required: false,
    includeIfNull: false,
  )


  final CharacterLocation? location;



  @JsonKey(
    
    name: r'updatedAt',
    required: false,
    includeIfNull: false,
  )


  final DateTime? updatedAt;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Character &&
      other.id == id &&
      other.name == name &&
      other.displayName == displayName &&
      other.profile == profile &&
      other.location == location &&
      other.updatedAt == updatedAt;

    @override
    int get hashCode =>
        id.hashCode +
        name.hashCode +
        (displayName == null ? 0 : displayName.hashCode) +
        profile.hashCode +
        location.hashCode +
        (updatedAt == null ? 0 : updatedAt.hashCode);

  factory Character.fromJson(Map<String, dynamic> json) => _$CharacterFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

