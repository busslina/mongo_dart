import 'package:mongo_dart/src/commands/query_and_write_operation_commands/insert_operation/insert_operation.dart';
import 'package:mongo_dart/src/commands/query_and_write_operation_commands/return_classes/abstract_write_result.dart';
import 'package:mongo_dart/src/commands/query_and_write_operation_commands/return_classes/bulk_write_result.dart';

import '../../../../core/network/abstract/connection_base.dart';
import '../../../../database/mongo_collection.dart';
import '../../../../topology/server.dart';
import 'insert_many_options.dart';

class InsertManyOperation extends InsertOperation {
  InsertManyOperation(
      MongoCollection collection, List<Map<String, Object?>> documents,
      {InsertManyOptions? insertManyOptions, Map<String, Object>? rawOptions})
      : super(
          collection,
          documents,
          insertOptions: insertManyOptions,
          rawOptions: rawOptions,
        ) {
    if (documents.isEmpty) {
      throw ArgumentError(
          'At least one document required in InsertManyOperation');
    }
  }

  Future<BulkWriteResult> executeDocument(Server server,
      {ConnectionBase? connection}) async {
    var ret = await super.executeOnServer(server);
    return BulkWriteResult.fromMap(WriteCommandType.insert, ret)
      ..ids = ids
      ..documents = documents;
  }
}
