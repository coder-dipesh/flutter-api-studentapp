import 'package:batch_student_objbox_api/screen/batch_student.dart';
import 'package:batch_student_objbox_api/screen/course_student.dart';
import 'package:batch_student_objbox_api/screen/dashboard.dart';
import 'package:batch_student_objbox_api/screen/login.dart';
import 'package:batch_student_objbox_api/screen/register.dart';
import 'package:batch_student_objbox_api/screen/splash_screen.dart';
import 'package:flutter/cupertino.dart';

var getAppRoutes = <String, WidgetBuilder>{
  SplashScreen.route: (context) => const SplashScreen(),
  LoginScreen.route: (context) => const LoginScreen(),
  RegisterScreen.route: (context) => const RegisterScreen(),
  DashboardScreen.route: (context) => const DashboardScreen(),
  BatchStudentScreen.route: (context) => const BatchStudentScreen(),
  CourseStudentScreen.route: (context) => const CourseStudentScreen(),
};
