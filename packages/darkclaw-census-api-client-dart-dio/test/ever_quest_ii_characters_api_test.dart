import 'package:test/test.dart';
import 'package:darkclaw_census_api_client/darkclaw_census_api_client.dart';


/// tests for EverQuestIICharactersApi
void main() {
  final instance = DarkclawCensusApiClient().getEverQuestIICharactersApi();

  group(EverQuestIICharactersApi, () {
    // Get an EverQuest II character
    //
    //Future<CharacterResponse> getCharacter(String characterId, { String fields, String language }) async
    test('test getCharacter', () async {
      // TODO
    });

    // Search EverQuest II characters
    //
    //Future<CharacterPage> listCharacters({ int pageSize, String cursor, String fields, String name, String server, String className, int minimumLevel, int maximumLevel, String sort, String language }) async
    test('test listCharacters', () async {
      // TODO
    });

  });
}
