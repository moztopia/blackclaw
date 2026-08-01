//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'character_location.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CharacterLocation {
  /// Returns a new [CharacterLocation] instance.
  CharacterLocation({

     this.serverId,

     this.serverName,

     this.zoneName,

     this.coordinates,
  });

  @JsonKey(
    
    name: r'serverId',
    required: false,
    includeIfNull: false,
  )


  final int? serverId;



  @JsonKey(
    
    name: r'serverName',
    required: false,
    includeIfNull: false,
  )


  final String? serverName;



  @JsonKey(
    
    name: r'zoneName',
    required: false,
    includeIfNull: false,
  )


  final String? zoneName;



  @JsonKey(
    
    name: r'coordinates',
    required: false,
    includeIfNull: false,
  )


  final String? coordinates;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CharacterLocation &&
      other.serverId == serverId &&
      other.serverName == serverName &&
      other.zoneName == zoneName &&
      other.coordinates == coordinates;

    @override
    int get hashCode =>
        (serverId == null ? 0 : serverId.hashCode) +
        (serverName == null ? 0 : serverName.hashCode) +
        (zoneName == null ? 0 : zoneName.hashCode) +
        (coordinates == null ? 0 : coordinates.hashCode);

  factory CharacterLocation.fromJson(Map<String, dynamic> json) => _$CharacterLocationFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterLocationToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

