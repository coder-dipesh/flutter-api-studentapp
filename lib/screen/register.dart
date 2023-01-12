import 'dart:io';

import 'package:batch_student_objbox_api/app/snackbar.dart';
import 'package:batch_student_objbox_api/app/user_permission.dart';
import 'package:batch_student_objbox_api/repository/batch_repo.dart';
import 'package:flutter/material.dart';
import 'package:batch_student_objbox_api/model/course.dart';
import 'package:batch_student_objbox_api/model/student.dart';
import 'package:batch_student_objbox_api/repository/course_repository.dart';
import 'package:batch_student_objbox_api/repository/student_repo.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import '../model/batch.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  static const String route = "registerScreen";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  void initState() {
    _checkUserPermission();
    super.initState();
  }

  _checkUserPermission() async {
    await UserPermission.checkCameraPermission();
  }

  Batch? _dropDownValue;
  List<Course> _lstCourseSelected = [];

  final _gap = const SizedBox(height: 8);

  final _key = GlobalKey<FormState>();
  final _fnameController = TextEditingController(text: 'Kiran');
  final _lnameController = TextEditingController(text: 'Rana');
  final _usernameController = TextEditingController(text: 'kiran');
  final _passwordController = TextEditingController(text: 'kiran123');

  _saveStudent() async {
    Student student = Student(
      fname: _fnameController.text,
      lname: _lnameController.text,
      username: _usernameController.text,
      password: _passwordController.text,
    );

    //student.batch.targetId = _dropDownValue!.batchId;
    student.batch.target = _dropDownValue;
    // Add all the courses
    student.course.addAll(_lstCourseSelected);

    int status = await StudentRepositoryImpl().addStudent(_img, student);
    _showMessage(status);
  }

  File? _img;

  Future _browseImage(ImageSource imageSource) async {
    try {
      // Source is either Gallary or Camera
      final image = await ImagePicker().pickImage(source: imageSource);
      if (image != null) {
        setState(() {
          _img = File(image.path);
        });
      } else {
        return;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  _showMessage(int status) {
    if (status > 0) {
      showSnackbar(context, 'Successfully added student', Colors.green);
    } else {
      showSnackbar(context, 'Error registring student', Colors.red);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Form(
              key: _key,
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        backgroundColor: Colors.grey[300],
                        context: context,
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        builder: (context) => Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton.icon(
                                onPressed: () {
                                  _browseImage(ImageSource.camera);
                                  Navigator.pop(context);
                                },
                                icon: const Icon(Icons.camera),
                                label: const Text('Camera'),
                              ),
                              ElevatedButton.icon(
                                onPressed: () {
                                  _browseImage(ImageSource.gallery);
                                  Navigator.pop(context);
                                },
                                icon: const Icon(Icons.image),
                                label: const Text('Gallery'),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    child: SizedBox(
                      height: 200,
                      width: double.infinity - 500,
                      child: _img == null
                          ? SvgPicture.asset(
                              'assets/svg/profile.svg',
                            )
                          : Image.file(_img!),
                    ),
                  ),
                  _gap,
                  TextFormField(
                    controller: _fnameController,
                    decoration: const InputDecoration(
                      labelText: 'First Name',
                    ),
                    validator: ((value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter first name';
                      }
                      return null;
                    }),
                  ),
                  _gap,
                  TextFormField(
                    controller: _lnameController,
                    decoration: const InputDecoration(
                      labelText: 'Last Name',
                    ),
                    validator: ((value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter last name';
                      }
                      return null;
                    }),
                  ),
                  _gap,
                  FutureBuilder(
                    future: BatchRepositoryImpl().getAllBatch(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.data!.isNotEmpty) {
                          _dropDownValue = snapshot.data![0];
                        }

                        return DropdownButtonFormField(
                          value: snapshot.data!.isNotEmpty
                              ? snapshot.data![0]
                              : null,
                          validator: (value) {
                            if (value == null) {
                              return 'Please select batch';
                            }
                            return null;
                          },
                          isExpanded: true,
                          decoration: const InputDecoration(
                            labelText: 'Select Batch',
                          ),
                          items: snapshot.data!
                              .map(
                                (batch) => DropdownMenuItem(
                                  value: batch,
                                  child: Text(batch!.batchName!),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            _dropDownValue = value!;
                          },
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                  _gap,
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Select Courses',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  _gap,
                  FutureBuilder(
                    future: CourseRepositoryImpl().getAllCourse(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return MultiSelectDialogField(
                          //initialValue: [snapshot.data![0]],
                          title: const Text('Select course'),
                          items: snapshot.data!
                              .map((course) => MultiSelectItem(
                                    course,
                                    course.courseName!,
                                  ))
                              .toList(),
                          listType: MultiSelectListType.CHIP,
                          buttonText: const Text('Select course'),
                          buttonIcon: const Icon(Icons.search),
                          onConfirm: (values) {
                            _lstCourseSelected = values;
                          },
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          validator: ((value) {
                            if (value == null || value.isEmpty) {
                              return 'Please select course';
                            }
                            return null;
                          }),
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                  _gap,
                  TextFormField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      labelText: 'Username',
                    ),
                    validator: ((value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter username';
                      }
                      return null;
                    }),
                  ),
                  _gap,
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                    ),
                    validator: ((value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter password';
                      }
                      return null;
                    }),
                  ),
                  _gap,
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      icon: const Icon(
                        Icons.save,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        if (_key.currentState!.validate()) {
                          _saveStudent();
                        }
                      },
                      label: const Text('Register student'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
