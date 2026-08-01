// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_name.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CharacterNameCWProxy {
  CharacterName first(String first);

  CharacterName last(String? last);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CharacterName(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CharacterName(...).copyWith(id: 12, name: "My name")
  /// ````
  CharacterName call({String first, String? last});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCharacterName.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCharacterName.copyWith.fieldName(...)`
class _$CharacterNameCWProxyImpl implements _$CharacterNameCWProxy {
  const _$CharacterNameCWProxyImpl(this._value);

  final CharacterName _value;

  @override
  CharacterName first(String first) => this(first: first);

  @override
  CharacterName last(String? last) => this(last: last);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CharacterName(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CharacterName(...).copyWith(id: 12, name: "My name")
  /// ````
  CharacterName call({
    Object? first = const $CopyWithPlaceholder(),
    Object? last = const $CopyWithPlaceholder(),
  }) {
    return CharacterName(
      first: first == const $CopyWithPlaceholder()
          ? _value.first
          // ignore: cast_nullable_to_non_nullable
          : first as String,
      last: last == const $CopyWithPlaceholder()
          ? _value.last
          // ignore: cast_nullable_to_non_nullable
          : last as String?,
    );
  }
}

extension $CharacterNameCopyWith on CharacterName {
  /// Returns a callable class that can be used as follows: `instanceOfCharacterName.copyWith(...)` or like so:`instanceOfCharacterName.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CharacterNameCWProxy get copyWith => _$CharacterNameCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterName _$CharacterNameFromJson(Map<String, dynamic> json) =>
    $checkedCreate('CharacterName', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['first']);
      final val = CharacterName(
        first: $checkedConvert('first', (v) => v as String),
        last: $checkedConvert('last', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$CharacterNameToJson(CharacterName instance) =>
    <String, dynamic>{'first': instance.first, 'last': ?instance.last};
