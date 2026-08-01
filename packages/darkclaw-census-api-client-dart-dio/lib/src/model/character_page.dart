//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:darkclaw_census_api_client/src/model/page_metadata.dart';
import 'package:darkclaw_census_api_client/src/model/character.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'character_page.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CharacterPage {
  /// Returns a new [CharacterPage] instance.
  CharacterPage({

    required  this.data,

    required  this.page,
  });

  @JsonKey(
    
    name: r'data',
    required: true,
    includeIfNull: false,
  )


  final List<Character> data;



  @JsonKey(
    
    name: r'page',
    required: true,
    includeIfNull: false,
  )


  final PageMetadata page;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CharacterPage &&
      other.data == data &&
      other.page == page;

    @override
    int get hashCode =>
        data.hashCode +
        page.hashCode;

  factory CharacterPage.fromJson(Map<String, dynamic> json) => _$CharacterPageFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterPageToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

