import 'package:test/test.dart';
import 'package:darkclaw_census_api_client/darkclaw_census_api_client.dart';


/// tests for RecordsApi
void main() {
  final instance = DarkclawCensusApiClient().getRecordsApi();

  group(RecordsApi, () {
    // Get an untyped collection record
    //
    //Future<GenericRecordResponse> getCollectionRecord(String gameId, String collectionId, String recordId, { String fields, String language }) async
    test('test getCollectionRecord', () async {
      // TODO
    });

    // List records from an untyped collection
    //
    // Advanced escape hatch for collections that do not yet have a typed Darkclaw resource. Prefer a typed endpoint when one exists. 
    //
    //Future<GenericRecordPage> listCollectionRecords(String gameId, String collectionId, { int pageSize, String cursor, String fields, String sort, String language }) async
    test('test listCollectionRecords', () async {
      // TODO
    });

  });
}
