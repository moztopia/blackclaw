// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CollectionCWProxy {
  Collection id(String id);

  Collection recordCount(int recordCount);

  Collection hidden(bool hidden);

  Collection indexes(List<List<String>> indexes);

  Collection resolvers(List<String> resolvers);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Collection(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Collection(...).copyWith(id: 12, name: "My name")
  /// ````
  Collection call({
    String id,
    int recordCount,
    bool hidden,
    List<List<String>> indexes,
    List<String> resolvers,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCollection.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCollection.copyWith.fieldName(...)`
class _$CollectionCWProxyImpl implements _$CollectionCWProxy {
  const _$CollectionCWProxyImpl(this._value);

  final Collection _value;

  @override
  Collection id(String id) => this(id: id);

  @override
  Collection recordCount(int recordCount) => this(recordCount: recordCount);

  @override
  Collection hidden(bool hidden) => this(hidden: hidden);

  @override
  Collection indexes(List<List<String>> indexes) => this(indexes: indexes);

  @override
  Collection resolvers(List<String> resolvers) => this(resolvers: resolvers);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Collection(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Collection(...).copyWith(id: 12, name: "My name")
  /// ````
  Collection call({
    Object? id = const $CopyWithPlaceholder(),
    Object? recordCount = const $CopyWithPlaceholder(),
    Object? hidden = const $CopyWithPlaceholder(),
    Object? indexes = const $CopyWithPlaceholder(),
    Object? resolvers = const $CopyWithPlaceholder(),
  }) {
    return Collection(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      recordCount: recordCount == const $CopyWithPlaceholder()
          ? _value.recordCount
          // ignore: cast_nullable_to_non_nullable
          : recordCount as int,
      hidden: hidden == const $CopyWithPlaceholder()
          ? _value.hidden
          // ignore: cast_nullable_to_non_nullable
          : hidden as bool,
      indexes: indexes == const $CopyWithPlaceholder()
          ? _value.indexes
          // ignore: cast_nullable_to_non_nullable
          : indexes as List<List<String>>,
      resolvers: resolvers == const $CopyWithPlaceholder()
          ? _value.resolvers
          // ignore: cast_nullable_to_non_nullable
          : resolvers as List<String>,
    );
  }
}

extension $CollectionCopyWith on Collection {
  /// Returns a callable class that can be used as follows: `instanceOfCollection.copyWith(...)` or like so:`instanceOfCollection.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CollectionCWProxy get copyWith => _$CollectionCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Collection _$CollectionFromJson(Map<String, dynamic> json) =>
    $checkedCreate('Collection', json, ($checkedConvert) {
      $checkKeys(
        json,
        requiredKeys: const [
          'id',
          'recordCount',
          'hidden',
          'indexes',
          'resolvers',
        ],
      );
      final val = Collection(
        id: $checkedConvert('id', (v) => v as String),
        recordCount: $checkedConvert('recordCount', (v) => (v as num).toInt()),
        hidden: $checkedConvert('hidden', (v) => v as bool),
        indexes: $checkedConvert(
          'indexes',
          (v) => (v as List<dynamic>)
              .map((e) => (e as List<dynamic>).map((e) => e as String).toList())
              .toList(),
        ),
        resolvers: $checkedConvert(
          'resolvers',
          (v) => (v as List<dynamic>).map((e) => e as String).toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$CollectionToJson(Collection instance) =>
    <String, dynamic>{
      'id': instance.id,
      'recordCount': instance.recordCount,
      'hidden': instance.hidden,
      'indexes': instance.indexes,
      'resolvers': instance.resolvers,
    };
