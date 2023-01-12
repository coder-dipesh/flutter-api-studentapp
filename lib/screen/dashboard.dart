import 'package:batch_student_objbox_api/app/user_permission.dart';
import 'package:batch_student_objbox_api/screen/bottom_screen/search_student.dart';
import 'package:flutter/material.dart';
import 'package:batch_student_objbox_api/screen/bottom_screen/about.dart';

import '../app/theme.dart';
import 'bottom_screen/home.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  static const String route = "dashboardScreen";

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();
    checkPermission();
  }

  checkPermission() async {
    await UserPermission.checkCameraPermission();
  }

  int _selectedIndex = 0;
  final List<Widget> _lstScreen = [
    const HomeScreen(),
    const SearchStudentScreen(),
    const AboutScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _lstScreen[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'View Student',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.insert_chart),
            label: 'About Screen',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        backgroundColor: HexColor.fromHex("#ED9728"),
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
      ),
    );
  }
}
