import 'package:batch_student_objbox_api/app/constants.dart';
import 'package:batch_student_objbox_api/model/course.dart';
import 'package:batch_student_objbox_api/model/student.dart';
import 'package:batch_student_objbox_api/repository/student_repo.dart';
import 'package:flutter/material.dart';

class CourseStudentScreen extends StatefulWidget {
  const CourseStudentScreen({super.key});
  static const String route = "courseStudentScreen";

  @override
  State<CourseStudentScreen> createState() => _CourseStudentScreenState();
}

class _CourseStudentScreenState extends State<CourseStudentScreen> {
  late Course course;

  @override
  void didChangeDependencies() {
    course = ModalRoute.of(context)!.settings.arguments as Course;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Students in  ${course.courseName}'),
      ),
      body: FutureBuilder(
        future: StudentRepositoryImpl().getStudentsByCourse(course.courseId!),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final students = snapshot.data as List<Student>;
            return ListView.builder(
              itemCount: students.length,
              itemBuilder: (context, index) {
                return DisplayStudentWidget(students[index]);
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class DisplayStudentWidget extends StatelessWidget {
  final Student student;

  const DisplayStudentWidget(this.student, {super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 4,
          margin: const EdgeInsets.all(10),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(
              Constant.userImageURL + student.image!,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Colors.grey.withOpacity(0.5),
              child: ListTile(
                title: Text(
                  '${student.fname} ${student.lname}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                subtitle: Text(
                  student.batches!.batchName!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
