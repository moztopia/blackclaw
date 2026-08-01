// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_list_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CollectionListResponseCWProxy {
  CollectionListResponse data(List<Collection> data);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CollectionListResponse(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CollectionListResponse(...).copyWith(id: 12, name: "My name")
  /// ````
  CollectionListResponse call({List<Collection> data});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCollectionListResponse.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCollectionListResponse.copyWith.fieldName(...)`
class _$CollectionListResponseCWProxyImpl
    implements _$CollectionListResponseCWProxy {
  const _$CollectionListResponseCWProxyImpl(this._value);

  final CollectionListResponse _value;

  @override
  CollectionListResponse data(List<Collection> data) => this(data: data);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CollectionListResponse(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CollectionListResponse(...).copyWith(id: 12, name: "My name")
  /// ````
  CollectionListResponse call({Object? data = const $CopyWithPlaceholder()}) {
    return CollectionListResponse(
      data: data == const $CopyWithPlaceholder()
          ? _value.data
          // ignore: cast_nullable_to_non_nullable
          : data as List<Collection>,
    );
  }
}

extension $CollectionListResponseCopyWith on CollectionListResponse {
  /// Returns a callable class that can be used as follows: `instanceOfCollectionListResponse.copyWith(...)` or like so:`instanceOfCollectionListResponse.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CollectionListResponseCWProxy get copyWith =>
      _$CollectionListResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollectionListResponse _$CollectionListResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('CollectionListResponse', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['data']);
  final val = CollectionListResponse(
    data: $checkedConvert(
      'data',
      (v) => (v as List<dynamic>)
          .map((e) => Collection.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
  );
  return val;
});

Map<String, dynamic> _$CollectionListResponseToJson(
  CollectionListResponse instance,
) => <String, dynamic>{'data': instance.data.map((e) => e.toJson()).toList()};
