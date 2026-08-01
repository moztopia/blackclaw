//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'collection.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Collection {
  /// Returns a new [Collection] instance.
  Collection({

    required  this.id,

    required  this.recordCount,

    required  this.hidden,

    required  this.indexes,

    required  this.resolvers,
  });

  @JsonKey(
    
    name: r'id',
    required: true,
    includeIfNull: false,
  )


  final String id;



          // minimum: 0
  @JsonKey(
    
    name: r'recordCount',
    required: true,
    includeIfNull: false,
  )


  final int recordCount;



  @JsonKey(
    
    name: r'hidden',
    required: true,
    includeIfNull: false,
  )


  final bool hidden;



  @JsonKey(
    
    name: r'indexes',
    required: true,
    includeIfNull: false,
  )


  final List<List<String>> indexes;



  @JsonKey(
    
    name: r'resolvers',
    required: true,
    includeIfNull: false,
  )


  final List<String> resolvers;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Collection &&
      other.id == id &&
      other.recordCount == recordCount &&
      other.hidden == hidden &&
      other.indexes == indexes &&
      other.resolvers == resolvers;

    @override
    int get hashCode =>
        id.hashCode +
        recordCount.hashCode +
        hidden.hashCode +
        indexes.hashCode +
        resolvers.hashCode;

  factory Collection.fromJson(Map<String, dynamic> json) => _$CollectionFromJson(json);

  Map<String, dynamic> toJson() => _$CollectionToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

