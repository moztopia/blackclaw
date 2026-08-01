// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_metadata.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PageMetadataCWProxy {
  PageMetadata pageSize(int pageSize);

  PageMetadata returned(int returned);

  PageMetadata nextCursor(String? nextCursor);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PageMetadata(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PageMetadata(...).copyWith(id: 12, name: "My name")
  /// ````
  PageMetadata call({int pageSize, int returned, String? nextCursor});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPageMetadata.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPageMetadata.copyWith.fieldName(...)`
class _$PageMetadataCWProxyImpl implements _$PageMetadataCWProxy {
  const _$PageMetadataCWProxyImpl(this._value);

  final PageMetadata _value;

  @override
  PageMetadata pageSize(int pageSize) => this(pageSize: pageSize);

  @override
  PageMetadata returned(int returned) => this(returned: returned);

  @override
  PageMetadata nextCursor(String? nextCursor) => this(nextCursor: nextCursor);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PageMetadata(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PageMetadata(...).copyWith(id: 12, name: "My name")
  /// ````
  PageMetadata call({
    Object? pageSize = const $CopyWithPlaceholder(),
    Object? returned = const $CopyWithPlaceholder(),
    Object? nextCursor = const $CopyWithPlaceholder(),
  }) {
    return PageMetadata(
      pageSize: pageSize == const $CopyWithPlaceholder()
          ? _value.pageSize
          // ignore: cast_nullable_to_non_nullable
          : pageSize as int,
      returned: returned == const $CopyWithPlaceholder()
          ? _value.returned
          // ignore: cast_nullable_to_non_nullable
          : returned as int,
      nextCursor: nextCursor == const $CopyWithPlaceholder()
          ? _value.nextCursor
          // ignore: cast_nullable_to_non_nullable
          : nextCursor as String?,
    );
  }
}

extension $PageMetadataCopyWith on PageMetadata {
  /// Returns a callable class that can be used as follows: `instanceOfPageMetadata.copyWith(...)` or like so:`instanceOfPageMetadata.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PageMetadataCWProxy get copyWith => _$PageMetadataCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PageMetadata _$PageMetadataFromJson(Map<String, dynamic> json) =>
    $checkedCreate('PageMetadata', json, ($checkedConvert) {
      $checkKeys(
        json,
        requiredKeys: const ['pageSize', 'returned', 'nextCursor'],
      );
      final val = PageMetadata(
        pageSize: $checkedConvert('pageSize', (v) => (v as num).toInt()),
        returned: $checkedConvert('returned', (v) => (v as num).toInt()),
        nextCursor: $checkedConvert('nextCursor', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$PageMetadataToJson(PageMetadata instance) =>
    <String, dynamic>{
      'pageSize': instance.pageSize,
      'returned': instance.returned,
      'nextCursor': instance.nextCursor,
    };
