import 'package:batch_student_objbox_api/app/network_connectivity.dart';
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
  Future<List<Batch?>> getAllBatch() async {
    bool status = await NetworkConnectivity.isOnline();
    List<Batch> lstBatch = [];
    if (status) {
      lstBatch = await BatchRemoteDataSource().getAllBatch();
      // Add all batch to objectbox
      await BatchDataSource().addAllBatch(lstBatch);
      return lstBatch;
    }
    return BatchDataSource().getAllBatch();
  }
}
