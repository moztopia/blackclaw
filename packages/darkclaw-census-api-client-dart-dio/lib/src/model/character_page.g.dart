// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_page.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CharacterPageCWProxy {
  CharacterPage data(List<Character> data);

  CharacterPage page(PageMetadata page);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CharacterPage(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CharacterPage(...).copyWith(id: 12, name: "My name")
  /// ````
  CharacterPage call({List<Character> data, PageMetadata page});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCharacterPage.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCharacterPage.copyWith.fieldName(...)`
class _$CharacterPageCWProxyImpl implements _$CharacterPageCWProxy {
  const _$CharacterPageCWProxyImpl(this._value);

  final CharacterPage _value;

  @override
  CharacterPage data(List<Character> data) => this(data: data);

  @override
  CharacterPage page(PageMetadata page) => this(page: page);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CharacterPage(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CharacterPage(...).copyWith(id: 12, name: "My name")
  /// ````
  CharacterPage call({
    Object? data = const $CopyWithPlaceholder(),
    Object? page = const $CopyWithPlaceholder(),
  }) {
    return CharacterPage(
      data: data == const $CopyWithPlaceholder()
          ? _value.data
          // ignore: cast_nullable_to_non_nullable
          : data as List<Character>,
      page: page == const $CopyWithPlaceholder()
          ? _value.page
          // ignore: cast_nullable_to_non_nullable
          : page as PageMetadata,
    );
  }
}

extension $CharacterPageCopyWith on CharacterPage {
  /// Returns a callable class that can be used as follows: `instanceOfCharacterPage.copyWith(...)` or like so:`instanceOfCharacterPage.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CharacterPageCWProxy get copyWith => _$CharacterPageCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterPage _$CharacterPageFromJson(Map<String, dynamic> json) =>
    $checkedCreate('CharacterPage', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['data', 'page']);
      final val = CharacterPage(
        data: $checkedConvert(
          'data',
          (v) => (v as List<dynamic>)
              .map((e) => Character.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        page: $checkedConvert(
          'page',
          (v) => PageMetadata.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$CharacterPageToJson(CharacterPage instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
      'page': instance.page.toJson(),
    };
