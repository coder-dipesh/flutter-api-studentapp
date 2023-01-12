import 'package:flutter/material.dart';

class SearchStudentScreen extends StatefulWidget {
  const SearchStudentScreen({super.key});

  @override
  State<SearchStudentScreen> createState() => _SearchStudentScreenState();
}

class _SearchStudentScreenState extends State<SearchStudentScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Search Student'));
  }
}
