// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_profile.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CharacterProfileCWProxy {
  CharacterProfile classId(int? classId);

  CharacterProfile className(String? className);

  CharacterProfile raceId(int? raceId);

  CharacterProfile raceName(String? raceName);

  CharacterProfile level(int? level);

  CharacterProfile gender(String? gender);

  CharacterProfile deity(String? deity);

  CharacterProfile alignment(int? alignment);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CharacterProfile(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CharacterProfile(...).copyWith(id: 12, name: "My name")
  /// ````
  CharacterProfile call({
    int? classId,
    String? className,
    int? raceId,
    String? raceName,
    int? level,
    String? gender,
    String? deity,
    int? alignment,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCharacterProfile.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCharacterProfile.copyWith.fieldName(...)`
class _$CharacterProfileCWProxyImpl implements _$CharacterProfileCWProxy {
  const _$CharacterProfileCWProxyImpl(this._value);

  final CharacterProfile _value;

  @override
  CharacterProfile classId(int? classId) => this(classId: classId);

  @override
  CharacterProfile className(String? className) => this(className: className);

  @override
  CharacterProfile raceId(int? raceId) => this(raceId: raceId);

  @override
  CharacterProfile raceName(String? raceName) => this(raceName: raceName);

  @override
  CharacterProfile level(int? level) => this(level: level);

  @override
  CharacterProfile gender(String? gender) => this(gender: gender);

  @override
  CharacterProfile deity(String? deity) => this(deity: deity);

  @override
  CharacterProfile alignment(int? alignment) => this(alignment: alignment);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CharacterProfile(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CharacterProfile(...).copyWith(id: 12, name: "My name")
  /// ````
  CharacterProfile call({
    Object? classId = const $CopyWithPlaceholder(),
    Object? className = const $CopyWithPlaceholder(),
    Object? raceId = const $CopyWithPlaceholder(),
    Object? raceName = const $CopyWithPlaceholder(),
    Object? level = const $CopyWithPlaceholder(),
    Object? gender = const $CopyWithPlaceholder(),
    Object? deity = const $CopyWithPlaceholder(),
    Object? alignment = const $CopyWithPlaceholder(),
  }) {
    return CharacterProfile(
      classId: classId == const $CopyWithPlaceholder()
          ? _value.classId
          // ignore: cast_nullable_to_non_nullable
          : classId as int?,
      className: className == const $CopyWithPlaceholder()
          ? _value.className
          // ignore: cast_nullable_to_non_nullable
          : className as String?,
      raceId: raceId == const $CopyWithPlaceholder()
          ? _value.raceId
          // ignore: cast_nullable_to_non_nullable
          : raceId as int?,
      raceName: raceName == const $CopyWithPlaceholder()
          ? _value.raceName
          // ignore: cast_nullable_to_non_nullable
          : raceName as String?,
      level: level == const $CopyWithPlaceholder()
          ? _value.level
          // ignore: cast_nullable_to_non_nullable
          : level as int?,
      gender: gender == const $CopyWithPlaceholder()
          ? _value.gender
          // ignore: cast_nullable_to_non_nullable
          : gender as String?,
      deity: deity == const $CopyWithPlaceholder()
          ? _value.deity
          // ignore: cast_nullable_to_non_nullable
          : deity as String?,
      alignment: alignment == const $CopyWithPlaceholder()
          ? _value.alignment
          // ignore: cast_nullable_to_non_nullable
          : alignment as int?,
    );
  }
}

extension $CharacterProfileCopyWith on CharacterProfile {
  /// Returns a callable class that can be used as follows: `instanceOfCharacterProfile.copyWith(...)` or like so:`instanceOfCharacterProfile.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CharacterProfileCWProxy get copyWith => _$CharacterProfileCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterProfile _$CharacterProfileFromJson(Map<String, dynamic> json) =>
    $checkedCreate('CharacterProfile', json, ($checkedConvert) {
      final val = CharacterProfile(
        classId: $checkedConvert('classId', (v) => (v as num?)?.toInt()),
        className: $checkedConvert('className', (v) => v as String?),
        raceId: $checkedConvert('raceId', (v) => (v as num?)?.toInt()),
        raceName: $checkedConvert('raceName', (v) => v as String?),
        level: $checkedConvert('level', (v) => (v as num?)?.toInt()),
        gender: $checkedConvert('gender', (v) => v as String?),
        deity: $checkedConvert('deity', (v) => v as String?),
        alignment: $checkedConvert('alignment', (v) => (v as num?)?.toInt()),
      );
      return val;
    });

Map<String, dynamic> _$CharacterProfileToJson(CharacterProfile instance) =>
    <String, dynamic>{
      'classId': ?instance.classId,
      'className': ?instance.className,
      'raceId': ?instance.raceId,
      'raceName': ?instance.raceName,
      'level': ?instance.level,
      'gender': ?instance.gender,
      'deity': ?instance.deity,
      'alignment': ?instance.alignment,
    };
