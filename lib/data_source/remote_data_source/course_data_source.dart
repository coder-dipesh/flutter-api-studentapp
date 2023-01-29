import 'package:batch_student_objbox_api/app/constants.dart';
import 'package:batch_student_objbox_api/data_source/remote_data_source/response/course_response.dart';
import 'package:batch_student_objbox_api/helper/http_service.dart';
import 'package:batch_student_objbox_api/model/course.dart';
import 'package:dio/dio.dart';

class CourseRemoteDataSource {
  final Dio _httpServices = HttpServices().getDioInstance();

  Future<List<Course>> getAllCourse() async {
    try {
      Response response = await _httpServices.get(
        Constant.courseURL,
      );
      if (response.statusCode == 200) {
        CourseResponse courseResponse = CourseResponse.fromJson(response.data);
        return courseResponse.data!;
      } else {
        return [];
      }
    } catch (e) {
      throw Exception('Failed to load course');
    }
  }
}
