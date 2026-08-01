// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_record_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$GenericRecordResponseCWProxy {
  GenericRecordResponse data(Map<String, Object> data);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GenericRecordResponse(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GenericRecordResponse(...).copyWith(id: 12, name: "My name")
  /// ````
  GenericRecordResponse call({Map<String, Object> data});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGenericRecordResponse.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGenericRecordResponse.copyWith.fieldName(...)`
class _$GenericRecordResponseCWProxyImpl
    implements _$GenericRecordResponseCWProxy {
  const _$GenericRecordResponseCWProxyImpl(this._value);

  final GenericRecordResponse _value;

  @override
  GenericRecordResponse data(Map<String, Object> data) => this(data: data);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GenericRecordResponse(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GenericRecordResponse(...).copyWith(id: 12, name: "My name")
  /// ````
  GenericRecordResponse call({Object? data = const $CopyWithPlaceholder()}) {
    return GenericRecordResponse(
      data: data == const $CopyWithPlaceholder()
          ? _value.data
          // ignore: cast_nullable_to_non_nullable
          : data as Map<String, Object>,
    );
  }
}

extension $GenericRecordResponseCopyWith on GenericRecordResponse {
  /// Returns a callable class that can be used as follows: `instanceOfGenericRecordResponse.copyWith(...)` or like so:`instanceOfGenericRecordResponse.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GenericRecordResponseCWProxy get copyWith =>
      _$GenericRecordResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenericRecordResponse _$GenericRecordResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('GenericRecordResponse', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['data']);
  final val = GenericRecordResponse(
    data: $checkedConvert(
      'data',
      (v) =>
          (v as Map<String, dynamic>).map((k, e) => MapEntry(k, e as Object)),
    ),
  );
  return val;
});

Map<String, dynamic> _$GenericRecordResponseToJson(
  GenericRecordResponse instance,
) => <String, dynamic>{'data': instance.data};
