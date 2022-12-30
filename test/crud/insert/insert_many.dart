part of '../../crud_test.dart';

/// Insert a Document without Specifying an _id Field
/// In the following example, the document passed to the insertOneRaw()
/// method does not contain the _id field:
Future insertManyDocumentsWithoutIdRaw(
    MongoDatabase db, List<String> usedColletions) async {
  var collectionName = getRandomCollectionName(usedColletions);
  var collection = db.collection(collectionName);
  var result = await db.runCommand({
    'insert': "users",
    'documents': [
      {'user': "ijk123", 'status': "A"},
      {'user': "xyz123", 'status': "P"},
      {'user': "mop123", 'status': "P"}
    ],
    'ordered': false,
    'writeConcern': {'w': "majority", 'wtimeout': 5000}
  });

  var doc = await collection.insertMany([
    {'_id': 2, 'user': "ijk123", 'status': "A"},
    {'_id': 3, 'user': "xyz123", 'status': "P"},
    {'_id': 4, 'user': "mop123", 'status': "P"}
  ]);
  MongoDocument result2 = doc.serverResponses.first;

  expect(result.length, 2);
  expect(result.length, result2.length);
  expect(result, {'n': 3, 'ok': 1.0});
  expect(result, result2);
}
