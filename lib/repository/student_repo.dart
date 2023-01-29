import 'dart:io';
import 'package:batch_student_objbox_api/app/network_connectivity.dart';
import 'package:batch_student_objbox_api/data_source/local_data_source/student_data_source.dart';
import 'package:batch_student_objbox_api/data_source/remote_data_source/student_data_source.dart';
import 'package:batch_student_objbox_api/model/student.dart';

abstract class StudentRepository {
  Future<List<Student>> getStudents();
  Future<int> addStudent(File? file, Student student);
  Future<bool> loginStudent(String username, String password);
  Future<List<Student>?> getStudentsByCourse(String courseId);
}

class StudentRepositoryImpl extends StudentRepository {
  @override
  Future<int> addStudent(File? file, Student student) async {
    return StudentRemoteDataSource().addStudent(file, student);
  }

  @override
  Future<List<Student>> getStudents() async {
    bool status = await NetworkConnectivity.isOnline();
    if (status) {
      return StudentDataSource().getStudents();
    } else {
      // Get from object box if there is no internet
      return [];
    }
  }

  @override
  Future<bool> loginStudent(String username, String password) async {
    return StudentRemoteDataSource().loginStudent(username, password);
  }

  @override
  Future<List<Student>?> getStudentsByCourse(String courseId) async {
    bool status = await NetworkConnectivity.isOnline();
    if (status) {
      return StudentRemoteDataSource().getStudentByCourse(courseId);
    } else {
      return [];
    }
  }
}
