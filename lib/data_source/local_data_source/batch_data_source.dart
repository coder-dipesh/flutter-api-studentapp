import 'package:batch_student_objbox_api/helper/objectbox.dart';
import 'package:batch_student_objbox_api/model/batch.dart';
import 'package:batch_student_objbox_api/model/student.dart';

import '../../state/objectbox_state.dart';

class BatchDataSource {
  // Get the objectBox instance from state
  ObjectBoxInstance get objectBoxInstance => ObjectBoxState.objectBoxInstance!;
  // OR
  ObjectBoxInstance objectBoxInstance2 = ObjectBoxState.objectBoxInstance!;

  Future<int> addBatch(Batch batch) async {
    try {
      return objectBoxInstance.addBatch(batch);
    } catch (e) {
      return 0;
    }
  }

  Future<List<Batch?>> getAllBatch() async {
    try {
      return Future.value(objectBoxInstance.getAllBatch());
    } catch (e) {
      return [];
    }
  }

  Future<List<Student>> getStudentByBatchName(String batchName) {
    try {
      return Future.value(objectBoxInstance.getStudentByBatchName(batchName));
    } catch (e) {
      return Future.value([]);
    }
  }
}
