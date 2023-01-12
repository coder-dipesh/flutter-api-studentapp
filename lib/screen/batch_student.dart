import 'package:flutter/material.dart';
import 'package:batch_student_objbox_api/data_source/local_data_source/batch_data_source.dart';

import '../model/student.dart';

class BatchStudentScreen extends StatefulWidget {
  const BatchStudentScreen({super.key});
  static const String route = "batchStudentScreen";
  @override
  State<BatchStudentScreen> createState() => _BatchStudentScreenState();
}

class _BatchStudentScreenState extends State<BatchStudentScreen> {
  String batchName = '';

  final List<Student> _lstStudents = [];
  @override
  void didChangeDependencies() {
    batchName = ModalRoute.of(context)!.settings.arguments as String;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Students in $batchName'),
      ),
      body: FutureBuilder(
        future: BatchDataSource().getStudentByBatchName(batchName),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            _lstStudents.clear();
            _lstStudents.addAll(snapshot.data!);
            return ListView.builder(
              itemCount: _lstStudents.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_lstStudents[index].fname!),
                  subtitle: Text(
                      _lstStudents[index].batch.target!.batchName.toString()),
                  trailing: Wrap(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.edit),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _lstStudents.removeAt(index);
                          });
                        },
                        icon: const Icon(Icons.delete),
                      ),
                    ],
                  ),
                );
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
