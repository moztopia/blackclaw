import 'package:darkclaw_census_api_client/src/model/character.dart';
import 'package:darkclaw_census_api_client/src/model/character_location.dart';
import 'package:darkclaw_census_api_client/src/model/character_name.dart';
import 'package:darkclaw_census_api_client/src/model/character_page.dart';
import 'package:darkclaw_census_api_client/src/model/character_profile.dart';
import 'package:darkclaw_census_api_client/src/model/character_response.dart';
import 'package:darkclaw_census_api_client/src/model/collection.dart';
import 'package:darkclaw_census_api_client/src/model/collection_list_response.dart';
import 'package:darkclaw_census_api_client/src/model/generic_record_page.dart';
import 'package:darkclaw_census_api_client/src/model/generic_record_response.dart';
import 'package:darkclaw_census_api_client/src/model/page_metadata.dart';
import 'package:darkclaw_census_api_client/src/model/problem.dart';

final _regList = RegExp(r'^List<(.*)>$');
final _regSet = RegExp(r'^Set<(.*)>$');
final _regMap = RegExp(r'^Map<String,(.*)>$');

  ReturnType deserialize<ReturnType, BaseType>(dynamic value, String targetType, {bool growable= true}) {
      switch (targetType) {
        case 'String':
          return '$value' as ReturnType;
        case 'int':
          return (value is int ? value : int.parse('$value')) as ReturnType;
        case 'bool':
          if (value is bool) {
            return value as ReturnType;
          }
          final valueString = '$value'.toLowerCase();
          return (valueString == 'true' || valueString == '1') as ReturnType;
        case 'double':
          return (value is double ? value : double.parse('$value')) as ReturnType;
        case 'Character':
          return Character.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'CharacterLocation':
          return CharacterLocation.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'CharacterName':
          return CharacterName.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'CharacterPage':
          return CharacterPage.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'CharacterProfile':
          return CharacterProfile.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'CharacterResponse':
          return CharacterResponse.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Collection':
          return Collection.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'CollectionListResponse':
          return CollectionListResponse.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GenericRecordPage':
          return GenericRecordPage.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GenericRecordResponse':
          return GenericRecordResponse.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'PageMetadata':
          return PageMetadata.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Problem':
          return Problem.fromJson(value as Map<String, dynamic>) as ReturnType;
        default:
          RegExpMatch? match;

          if (value is List && (match = _regList.firstMatch(targetType)) != null) {
            targetType = match![1]!; // ignore: parameter_assignments
            return value
              .map<BaseType>((dynamic v) => deserialize<BaseType, BaseType>(v, targetType, growable: growable))
              .toList(growable: growable) as ReturnType;
          }
          if (value is Set && (match = _regSet.firstMatch(targetType)) != null) {
            targetType = match![1]!; // ignore: parameter_assignments
            return value
              .map<BaseType>((dynamic v) => deserialize<BaseType, BaseType>(v, targetType, growable: growable))
              .toSet() as ReturnType;
          }
          if (value is Map && (match = _regMap.firstMatch(targetType)) != null) {
            targetType = match![1]!.trim(); // ignore: parameter_assignments
            return Map<String, BaseType>.fromIterables(
              value.keys as Iterable<String>,
              value.values.map((dynamic v) => deserialize<BaseType, BaseType>(v, targetType, growable: growable)),
            ) as ReturnType;
          }
          break;
    }
    throw Exception('Cannot deserialize');
  }