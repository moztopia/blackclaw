//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:darkclaw_census_api_client/src/model/page_metadata.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generic_record_page.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GenericRecordPage {
  /// Returns a new [GenericRecordPage] instance.
  GenericRecordPage({

    required  this.data,

    required  this.page,
  });

  @JsonKey(
    
    name: r'data',
    required: true,
    includeIfNull: false,
  )


  final List<Map<String, Object>> data;



  @JsonKey(
    
    name: r'page',
    required: true,
    includeIfNull: false,
  )


  final PageMetadata page;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GenericRecordPage &&
      other.data == data &&
      other.page == page;

    @override
    int get hashCode =>
        data.hashCode +
        page.hashCode;

  factory GenericRecordPage.fromJson(Map<String, dynamic> json) => _$GenericRecordPageFromJson(json);

  Map<String, dynamic> toJson() => _$GenericRecordPageToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

