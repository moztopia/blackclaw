//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'character_name.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CharacterName {
  /// Returns a new [CharacterName] instance.
  CharacterName({

    required  this.first,

     this.last,
  });

  @JsonKey(
    
    name: r'first',
    required: true,
    includeIfNull: false,
  )


  final String first;



  @JsonKey(
    
    name: r'last',
    required: false,
    includeIfNull: false,
  )


  final String? last;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CharacterName &&
      other.first == first &&
      other.last == last;

    @override
    int get hashCode =>
        first.hashCode +
        (last == null ? 0 : last.hashCode);

  factory CharacterName.fromJson(Map<String, dynamic> json) => _$CharacterNameFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterNameToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

