import '../base/find_and_modify_operation.dart';

class FindAndModifyOperationOpen extends FindAndModifyOperation {
  FindAndModifyOperationOpen(super.collection,
      {super.query,
      super.sort,
      super.remove,
      super.update,
      super.returnNew,
      super.fields,
      super.upsert,
      super.arrayFilters,
      super.session,
      super.hint,
      super.findAndModifyOptions,
      super.rawOptions})
      : super.protected();
}
