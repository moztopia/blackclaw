// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CharacterCWProxy {
  Character id(String id);

  Character name(CharacterName name);

  Character displayName(String? displayName);

  Character profile(CharacterProfile? profile);

  Character location(CharacterLocation? location);

  Character updatedAt(DateTime? updatedAt);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Character(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Character(...).copyWith(id: 12, name: "My name")
  /// ````
  Character call({
    String id,
    CharacterName name,
    String? displayName,
    CharacterProfile? profile,
    CharacterLocation? location,
    DateTime? updatedAt,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCharacter.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCharacter.copyWith.fieldName(...)`
class _$CharacterCWProxyImpl implements _$CharacterCWProxy {
  const _$CharacterCWProxyImpl(this._value);

  final Character _value;

  @override
  Character id(String id) => this(id: id);

  @override
  Character name(CharacterName name) => this(name: name);

  @override
  Character displayName(String? displayName) => this(displayName: displayName);

  @override
  Character profile(CharacterProfile? profile) => this(profile: profile);

  @override
  Character location(CharacterLocation? location) => this(location: location);

  @override
  Character updatedAt(DateTime? updatedAt) => this(updatedAt: updatedAt);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Character(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Character(...).copyWith(id: 12, name: "My name")
  /// ````
  Character call({
    Object? id = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? displayName = const $CopyWithPlaceholder(),
    Object? profile = const $CopyWithPlaceholder(),
    Object? location = const $CopyWithPlaceholder(),
    Object? updatedAt = const $CopyWithPlaceholder(),
  }) {
    return Character(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as CharacterName,
      displayName: displayName == const $CopyWithPlaceholder()
          ? _value.displayName
          // ignore: cast_nullable_to_non_nullable
          : displayName as String?,
      profile: profile == const $CopyWithPlaceholder()
          ? _value.profile
          // ignore: cast_nullable_to_non_nullable
          : profile as CharacterProfile?,
      location: location == const $CopyWithPlaceholder()
          ? _value.location
          // ignore: cast_nullable_to_non_nullable
          : location as CharacterLocation?,
      updatedAt: updatedAt == const $CopyWithPlaceholder()
          ? _value.updatedAt
          // ignore: cast_nullable_to_non_nullable
          : updatedAt as DateTime?,
    );
  }
}

extension $CharacterCopyWith on Character {
  /// Returns a callable class that can be used as follows: `instanceOfCharacter.copyWith(...)` or like so:`instanceOfCharacter.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CharacterCWProxy get copyWith => _$CharacterCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Character _$CharacterFromJson(Map<String, dynamic> json) =>
    $checkedCreate('Character', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['id', 'name']);
      final val = Character(
        id: $checkedConvert('id', (v) => v as String),
        name: $checkedConvert(
          'name',
          (v) => CharacterName.fromJson(v as Map<String, dynamic>),
        ),
        displayName: $checkedConvert('displayName', (v) => v as String?),
        profile: $checkedConvert(
          'profile',
          (v) => v == null
              ? null
              : CharacterProfile.fromJson(v as Map<String, dynamic>),
        ),
        location: $checkedConvert(
          'location',
          (v) => v == null
              ? null
              : CharacterLocation.fromJson(v as Map<String, dynamic>),
        ),
        updatedAt: $checkedConvert(
          'updatedAt',
          (v) => v == null ? null : DateTime.parse(v as String),
        ),
      );
      return val;
    });

Map<String, dynamic> _$CharacterToJson(Character instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name.toJson(),
  'displayName': ?instance.displayName,
  'profile': ?instance.profile?.toJson(),
  'location': ?instance.location?.toJson(),
  'updatedAt': ?instance.updatedAt?.toIso8601String(),
};
