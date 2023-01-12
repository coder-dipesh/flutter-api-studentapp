import 'dart:io';

import 'package:batch_student_objbox_api/model/batch.dart';
import 'package:batch_student_objbox_api/model/course.dart';
import 'package:path_provider/path_provider.dart';
import '../model/student.dart';
import '../objectbox.g.dart';

class ObjectBoxInstance {
  late final Store _store;
  late final Box<Batch> _batch;
  late final Box<Student> _student;
  late final Box<Course> _course;
  // Constructor
  ObjectBoxInstance(this._store) {
    _batch = Box<Batch>(_store);
    _student = Box<Student>(_store);
    _course = Box<Course>(_store);
    //insertBatches();
  }
  // void insertBatches() {
  //   List<Batch> lstBatches = getAllBatch();
  //   if (lstBatches.isEmpty) {
  //     addBatch(Batch('29-A'));
  //     addBatch(Batch('29-B'));
  //   }
  // }

  // Initialization of ObjectBox
  static Future<ObjectBoxInstance> init() async {
    var dir = await getApplicationDocumentsDirectory();
    final store = Store(
      getObjectBoxModel(),
      directory: '${dir.path}/student_course',
    );

    return ObjectBoxInstance(store);
  }

  // Delete Store and all boxes
  static Future<void> deleteDatabase() async {
    var dir = await getApplicationDocumentsDirectory();
    Directory('${dir.path}/student_course').deleteSync(recursive: true);
  }

  //-------------Batch Queries----------------
  int addBatch(Batch batch) {
    return _batch.put(batch);
  }

  List<Batch> getAllBatch() {
    return _batch.getAll();
  }

  //Search student by batchName
  List<Student> getStudentByBatchName(String batchName) {
    return _batch
        .query(Batch_.batchName.equals(batchName))
        .build()
        .findFirst()!
        .student;
  }

  //Get students by coursename
  List<Student> getStudentByCourseName(String courseName) {
    return _course
        .query(Course_.courseName.equals(courseName))
        .build()
        .findFirst()!
        .student;
  }

  //---------------- Student Queries ----------------
  int addStudent(Student student) {
    return _student.put(student);
  }

  List<Student> getAllStudent() {
    return _student.getAll();
  }

  // Login student
  Student? loginStudent(String username, String password) {
    return _student
        .query(Student_.username.equals(username) &
            Student_.password.equals(password))
        .build()
        .findFirst();
  }

  //---------------- Course Queries ----------------
  int addCourse(Course course) {
    return _course.put(course);
  }

  List<Course> getAllCourse() {
    return _course.getAll();
  }

  // Search course by courseName
  Course? getCourseByCourseName(String courseName) {
    return _course
        .query(Course_.courseName.equals(courseName))
        .build()
        .findFirst();
  }

  // Get students in each course
  List<Student> getStudentsInEachCourse(String courseName) {
    // return _course
    //     .query(Course_.courseName.equals(courseName))
    //     .build()
    //     .findFirst()!
    //     .student;

    //OR

    return getCourseByCourseName(courseName)!.student;
  }
}
