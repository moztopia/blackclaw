// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_record_page.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$GenericRecordPageCWProxy {
  GenericRecordPage data(List<Map<String, Object>> data);

  GenericRecordPage page(PageMetadata page);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GenericRecordPage(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GenericRecordPage(...).copyWith(id: 12, name: "My name")
  /// ````
  GenericRecordPage call({List<Map<String, Object>> data, PageMetadata page});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGenericRecordPage.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGenericRecordPage.copyWith.fieldName(...)`
class _$GenericRecordPageCWProxyImpl implements _$GenericRecordPageCWProxy {
  const _$GenericRecordPageCWProxyImpl(this._value);

  final GenericRecordPage _value;

  @override
  GenericRecordPage data(List<Map<String, Object>> data) => this(data: data);

  @override
  GenericRecordPage page(PageMetadata page) => this(page: page);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GenericRecordPage(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GenericRecordPage(...).copyWith(id: 12, name: "My name")
  /// ````
  GenericRecordPage call({
    Object? data = const $CopyWithPlaceholder(),
    Object? page = const $CopyWithPlaceholder(),
  }) {
    return GenericRecordPage(
      data: data == const $CopyWithPlaceholder()
          ? _value.data
          // ignore: cast_nullable_to_non_nullable
          : data as List<Map<String, Object>>,
      page: page == const $CopyWithPlaceholder()
          ? _value.page
          // ignore: cast_nullable_to_non_nullable
          : page as PageMetadata,
    );
  }
}

extension $GenericRecordPageCopyWith on GenericRecordPage {
  /// Returns a callable class that can be used as follows: `instanceOfGenericRecordPage.copyWith(...)` or like so:`instanceOfGenericRecordPage.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GenericRecordPageCWProxy get copyWith =>
      _$GenericRecordPageCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenericRecordPage _$GenericRecordPageFromJson(Map<String, dynamic> json) =>
    $checkedCreate('GenericRecordPage', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['data', 'page']);
      final val = GenericRecordPage(
        data: $checkedConvert(
          'data',
          (v) => (v as List<dynamic>)
              .map(
                (e) => (e as Map<String, dynamic>).map(
                  (k, e) => MapEntry(k, e as Object),
                ),
              )
              .toList(),
        ),
        page: $checkedConvert(
          'page',
          (v) => PageMetadata.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$GenericRecordPageToJson(GenericRecordPage instance) =>
    <String, dynamic>{'data': instance.data, 'page': instance.page.toJson()};
