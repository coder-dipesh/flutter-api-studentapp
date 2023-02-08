import 'package:batch_student_objbox_api/app/routes.dart';
import 'package:batch_student_objbox_api/app/theme.dart';
import 'package:batch_student_objbox_api/screen/googlemaps/google_map_screen.dart';
import 'package:batch_student_objbox_api/screen/register.dart';
import 'package:batch_student_objbox_api/screen/wearos/login/login_screen.dart';
import 'package:flutter/material.dart';

import '../screen/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student course using API',
      debugShowCheckedModeBanner: false,
      theme: getApplicationThemeData(),
      initialRoute: RegisterScreen.route,
      routes: getAppRoutes,
    );
  }
}
