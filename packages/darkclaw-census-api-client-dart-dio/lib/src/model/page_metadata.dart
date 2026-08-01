//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'page_metadata.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PageMetadata {
  /// Returns a new [PageMetadata] instance.
  PageMetadata({

    required  this.pageSize,

    required  this.returned,

    required  this.nextCursor,
  });

          // minimum: 1
          // maximum: 100
  @JsonKey(
    
    name: r'pageSize',
    required: true,
    includeIfNull: false,
  )


  final int pageSize;



          // minimum: 0
  @JsonKey(
    
    name: r'returned',
    required: true,
    includeIfNull: false,
  )


  final int returned;



  @JsonKey(
    
    name: r'nextCursor',
    required: true,
    includeIfNull: true,
  )


  final String? nextCursor;





    @override
    bool operator ==(Object other) => identical(this, other) || other is PageMetadata &&
      other.pageSize == pageSize &&
      other.returned == returned &&
      other.nextCursor == nextCursor;

    @override
    int get hashCode =>
        pageSize.hashCode +
        returned.hashCode +
        (nextCursor == null ? 0 : nextCursor.hashCode);

  factory PageMetadata.fromJson(Map<String, dynamic> json) => _$PageMetadataFromJson(json);

  Map<String, dynamic> toJson() => _$PageMetadataToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

