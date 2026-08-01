import 'package:test/test.dart';
import 'package:darkclaw_census_api_client/darkclaw_census_api_client.dart';


/// tests for DiscoveryApi
void main() {
  final instance = DarkclawCensusApiClient().getDiscoveryApi();

  group(DiscoveryApi, () {
    // List available collections
    //
    // Lists the upstream data collections available for a supported game.
    //
    //Future<CollectionListResponse> listCollections(String gameId) async
    test('test listCollections', () async {
      // TODO
    });

  });
}
