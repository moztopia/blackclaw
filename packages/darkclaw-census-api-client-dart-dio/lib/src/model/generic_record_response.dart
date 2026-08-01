//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generic_record_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GenericRecordResponse {
  /// Returns a new [GenericRecordResponse] instance.
  GenericRecordResponse({

    required  this.data,
  });

      /// Untyped upstream record retained as an advanced escape hatch.
  @JsonKey(
    
    name: r'data',
    required: true,
    includeIfNull: false,
  )


  final Map<String, Object> data;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GenericRecordResponse &&
      other.data == data;

    @override
    int get hashCode =>
        data.hashCode;

  factory GenericRecordResponse.fromJson(Map<String, dynamic> json) => _$GenericRecordResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GenericRecordResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

