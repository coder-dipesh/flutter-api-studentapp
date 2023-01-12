import 'package:batch_student_objbox_api/data_source/remote_data_source/batch_data_source.dart';
import 'package:batch_student_objbox_api/model/batch.dart';
import '../data_source/local_data_source/batch_data_source.dart';
import '../model/student.dart';

abstract class BatchRepository {
  // Future<List<Batch?>> getAllBatch();
  Future<int> addBatch(Batch batch);
  Future<List<Student>> getStudentByBatchName(String batchName);
  Future<List<Batch?>> getAllBatch();
}

class BatchRepositoryImpl extends BatchRepository {
  @override
  Future<int> addBatch(Batch batch) {
    return BatchDataSource().addBatch(batch);
  }

  @override
  Future<List<Student>> getStudentByBatchName(String batchName) {
    return BatchDataSource().getStudentByBatchName(batchName);
  }

  @override
  Future<List<Batch?>> getAllBatch() {
    return BatchRemoteDataSource().getAllBatch();
  }
}
