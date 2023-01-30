import 'package:batch_student_objbox_api/app/network_connectivity.dart';
import 'package:batch_student_objbox_api/data_source/local_data_source/course_data_source.dart';
import 'package:batch_student_objbox_api/data_source/remote_data_source/course_data_source.dart';
import 'package:batch_student_objbox_api/model/student.dart';

import '../model/course.dart';

abstract class CourseRepository {
  Future<int> addCourse(Course course);
  Future<List<Course>> getAllCourse();
  Future<Course?> getCourseByCourseName(String courseName);
  Future<List<Student>> getStudentsInEachCourse(String courseName);
}

class CourseRepositoryImpl extends CourseRepository {
  @override
  Future<int> addCourse(Course course) {
    return CourseDataSource().addCourse(course);
  }

  @override
  Future<List<Course>> getAllCourse() async {
    // Check if any internet connection in on
    bool status = await NetworkConnectivity.isOnline(); // return bool values
    List<Course> lstCourse = [];
    if (status) {
      // If internet is there returns all data from remote
      lstCourse = await CourseRemoteDataSource().getAllCourse();
      // Add all batch to objectbox
      await CourseDataSource().addAllCourse(lstCourse);
      // returning course for local source
      return lstCourse;
    }
    // If internet is not there returns all data from local
    return CourseDataSource().getAllCourse();
  }

  @override
  Future<Course?> getCourseByCourseName(String courseName) {
    return CourseDataSource().getCourseByCourseName(courseName);
  }

  @override
  Future<List<Student>> getStudentsInEachCourse(String courseName) {
    return CourseDataSource().getStudentsInEachCourse(courseName);
  }
}
