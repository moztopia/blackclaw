//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'character_profile.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CharacterProfile {
  /// Returns a new [CharacterProfile] instance.
  CharacterProfile({

     this.classId,

     this.className,

     this.raceId,

     this.raceName,

     this.level,

     this.gender,

     this.deity,

     this.alignment,
  });

  @JsonKey(
    
    name: r'classId',
    required: false,
    includeIfNull: false,
  )


  final int? classId;



  @JsonKey(
    
    name: r'className',
    required: false,
    includeIfNull: false,
  )


  final String? className;



  @JsonKey(
    
    name: r'raceId',
    required: false,
    includeIfNull: false,
  )


  final int? raceId;



  @JsonKey(
    
    name: r'raceName',
    required: false,
    includeIfNull: false,
  )


  final String? raceName;



          // minimum: 1
  @JsonKey(
    
    name: r'level',
    required: false,
    includeIfNull: false,
  )


  final int? level;



  @JsonKey(
    
    name: r'gender',
    required: false,
    includeIfNull: false,
  )


  final String? gender;



  @JsonKey(
    
    name: r'deity',
    required: false,
    includeIfNull: false,
  )


  final String? deity;



  @JsonKey(
    
    name: r'alignment',
    required: false,
    includeIfNull: false,
  )


  final int? alignment;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CharacterProfile &&
      other.classId == classId &&
      other.className == className &&
      other.raceId == raceId &&
      other.raceName == raceName &&
      other.level == level &&
      other.gender == gender &&
      other.deity == deity &&
      other.alignment == alignment;

    @override
    int get hashCode =>
        (classId == null ? 0 : classId.hashCode) +
        (className == null ? 0 : className.hashCode) +
        (raceId == null ? 0 : raceId.hashCode) +
        (raceName == null ? 0 : raceName.hashCode) +
        (level == null ? 0 : level.hashCode) +
        (gender == null ? 0 : gender.hashCode) +
        (deity == null ? 0 : deity.hashCode) +
        (alignment == null ? 0 : alignment.hashCode);

  factory CharacterProfile.fromJson(Map<String, dynamic> json) => _$CharacterProfileFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterProfileToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

