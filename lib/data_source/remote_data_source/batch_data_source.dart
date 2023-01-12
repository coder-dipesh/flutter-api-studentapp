import 'package:batch_student_objbox_api/app/constants.dart';
import 'package:batch_student_objbox_api/data_source/remote_data_source/response/batch_response.dart';
import 'package:batch_student_objbox_api/helper/http_service.dart';
import 'package:batch_student_objbox_api/model/batch.dart';
import 'package:dio/dio.dart';

class BatchRemoteDataSource {
  final Dio _httpServices = HttpServices().getDioInstance();

  Future<List<Batch>> getAllBatch() async {
    try {
      Response response = await _httpServices.get(
        Constant.batchURL,
      );
      if (response.statusCode == 200) {
        BatchResponse batchResponse = BatchResponse.fromJson(response.data);
        return batchResponse.data!;
      } else {
        return [];
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
