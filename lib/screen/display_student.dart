import 'package:batch_student_objbox_api/app/constants.dart';
import 'package:batch_student_objbox_api/model/student.dart';
import 'package:flutter/material.dart';

class DisplayStudentWidget extends StatelessWidget {
  final Student student;
  const DisplayStudentWidget(this.student, {super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
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
        // END CARD
        // POSITION
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
                // subtitle: Text(
                //   student.batches!.batchName!,
                //   style: const TextStyle(
                //     color: Colors.white,
                //     fontSize: 20,
                //   ),
                // ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
