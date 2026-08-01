// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_location.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CharacterLocationCWProxy {
  CharacterLocation serverId(int? serverId);

  CharacterLocation serverName(String? serverName);

  CharacterLocation zoneName(String? zoneName);

  CharacterLocation coordinates(String? coordinates);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CharacterLocation(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CharacterLocation(...).copyWith(id: 12, name: "My name")
  /// ````
  CharacterLocation call({
    int? serverId,
    String? serverName,
    String? zoneName,
    String? coordinates,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCharacterLocation.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCharacterLocation.copyWith.fieldName(...)`
class _$CharacterLocationCWProxyImpl implements _$CharacterLocationCWProxy {
  const _$CharacterLocationCWProxyImpl(this._value);

  final CharacterLocation _value;

  @override
  CharacterLocation serverId(int? serverId) => this(serverId: serverId);

  @override
  CharacterLocation serverName(String? serverName) =>
      this(serverName: serverName);

  @override
  CharacterLocation zoneName(String? zoneName) => this(zoneName: zoneName);

  @override
  CharacterLocation coordinates(String? coordinates) =>
      this(coordinates: coordinates);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CharacterLocation(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CharacterLocation(...).copyWith(id: 12, name: "My name")
  /// ````
  CharacterLocation call({
    Object? serverId = const $CopyWithPlaceholder(),
    Object? serverName = const $CopyWithPlaceholder(),
    Object? zoneName = const $CopyWithPlaceholder(),
    Object? coordinates = const $CopyWithPlaceholder(),
  }) {
    return CharacterLocation(
      serverId: serverId == const $CopyWithPlaceholder()
          ? _value.serverId
          // ignore: cast_nullable_to_non_nullable
          : serverId as int?,
      serverName: serverName == const $CopyWithPlaceholder()
          ? _value.serverName
          // ignore: cast_nullable_to_non_nullable
          : serverName as String?,
      zoneName: zoneName == const $CopyWithPlaceholder()
          ? _value.zoneName
          // ignore: cast_nullable_to_non_nullable
          : zoneName as String?,
      coordinates: coordinates == const $CopyWithPlaceholder()
          ? _value.coordinates
          // ignore: cast_nullable_to_non_nullable
          : coordinates as String?,
    );
  }
}

extension $CharacterLocationCopyWith on CharacterLocation {
  /// Returns a callable class that can be used as follows: `instanceOfCharacterLocation.copyWith(...)` or like so:`instanceOfCharacterLocation.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CharacterLocationCWProxy get copyWith =>
      _$CharacterLocationCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterLocation _$CharacterLocationFromJson(Map<String, dynamic> json) =>
    $checkedCreate('CharacterLocation', json, ($checkedConvert) {
      final val = CharacterLocation(
        serverId: $checkedConvert('serverId', (v) => (v as num?)?.toInt()),
        serverName: $checkedConvert('serverName', (v) => v as String?),
        zoneName: $checkedConvert('zoneName', (v) => v as String?),
        coordinates: $checkedConvert('coordinates', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$CharacterLocationToJson(CharacterLocation instance) =>
    <String, dynamic>{
      'serverId': ?instance.serverId,
      'serverName': ?instance.serverName,
      'zoneName': ?instance.zoneName,
      'coordinates': ?instance.coordinates,
    };
