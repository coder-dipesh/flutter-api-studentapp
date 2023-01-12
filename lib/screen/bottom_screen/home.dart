import 'package:batch_student_objbox_api/repository/batch_repo.dart';
import 'package:flutter/material.dart';
import 'package:batch_student_objbox_api/repository/course_repository.dart';
import 'package:batch_student_objbox_api/screen/batch_student.dart';
import 'package:batch_student_objbox_api/screen/course_student.dart';

import '../../app/theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  final _gap = const SizedBox(height: 8);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        elevation: 5,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Batches',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              _gap,
              const DisplayBatches(),
              _gap,
              const Text(
                'Courses',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const DisplayCourses(),
            ],
          ),
        ),
      ),
    );
  }
}

class DisplayCourses extends StatelessWidget {
  const DisplayCourses({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .3,
      color: Colors.grey[200],
      child: Expanded(
        child: FutureBuilder(
          future: CourseRepositoryImpl().getAllCourse(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.count(
                childAspectRatio: 3 / 2,
                crossAxisCount: 2,
                children: [
                  //Get data from snapshot
                  for (var course in snapshot.data!)
                    InkWell(
                      splashColor: Colors.red,
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          CourseStudentScreen.route,
                          arguments: course.courseName,
                        );
                      },
                      child: Card(
                        color: HexColor.fromHex("#ED9728"),
                        child: Center(
                          child: Text(
                            course.courseName!,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}

class DisplayBatches extends StatelessWidget {
  const DisplayBatches({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .3,
      color: Colors.grey[200],
      child: Expanded(
        child: FutureBuilder(
          future: BatchRepositoryImpl().getAllBatch(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.count(
                childAspectRatio: 3 / 2,
                crossAxisCount: 2,
                children: [
                  //Get data from snapshot
                  for (var batch in snapshot.data!)
                    InkWell(
                      splashColor: Colors.red,
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          BatchStudentScreen.route,
                          arguments: batch.batchName,
                        );
                      },
                      child: Card(
                        color: HexColor.fromHex("#ED9728"),
                        child: Center(
                          child: Text(
                            batch!.batchName!,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
