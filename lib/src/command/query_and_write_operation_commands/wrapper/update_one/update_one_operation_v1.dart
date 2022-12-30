import 'package:mongo_dart/mongo_dart.dart';
import 'package:mongo_dart/src/command/query_and_write_operation_commands/wrapper/update_one/update_one_statement_v1.dart';

import 'update_one_options_v1.dart';

class UpdateOneOperationV1 extends UpdateOneOperation {
  UpdateOneOperationV1(
      MongoCollection collection, UpdateOneStatementV1 updateOneStatement,
      {UpdateOneOptionsV1? updateOneOptions, super.rawOptions})
      : super.protected(collection, updateOneStatement,
            updateOneOptions: updateOneOptions);
}
