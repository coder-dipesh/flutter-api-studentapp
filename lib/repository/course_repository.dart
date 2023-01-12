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
    return CourseRemoteDataSource().getAllCourse();
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
