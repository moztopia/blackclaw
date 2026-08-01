// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CharacterResponseCWProxy {
  CharacterResponse data(Character data);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CharacterResponse(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CharacterResponse(...).copyWith(id: 12, name: "My name")
  /// ````
  CharacterResponse call({Character data});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCharacterResponse.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCharacterResponse.copyWith.fieldName(...)`
class _$CharacterResponseCWProxyImpl implements _$CharacterResponseCWProxy {
  const _$CharacterResponseCWProxyImpl(this._value);

  final CharacterResponse _value;

  @override
  CharacterResponse data(Character data) => this(data: data);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CharacterResponse(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CharacterResponse(...).copyWith(id: 12, name: "My name")
  /// ````
  CharacterResponse call({Object? data = const $CopyWithPlaceholder()}) {
    return CharacterResponse(
      data: data == const $CopyWithPlaceholder()
          ? _value.data
          // ignore: cast_nullable_to_non_nullable
          : data as Character,
    );
  }
}

extension $CharacterResponseCopyWith on CharacterResponse {
  /// Returns a callable class that can be used as follows: `instanceOfCharacterResponse.copyWith(...)` or like so:`instanceOfCharacterResponse.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CharacterResponseCWProxy get copyWith =>
      _$CharacterResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterResponse _$CharacterResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate('CharacterResponse', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['data']);
      final val = CharacterResponse(
        data: $checkedConvert(
          'data',
          (v) => Character.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$CharacterResponseToJson(CharacterResponse instance) =>
    <String, dynamic>{'data': instance.data.toJson()};
