import 'package:flutter/material.dart';
import 'package:wear/wear.dart';

class WatchDashboardScreen extends StatefulWidget {
  const WatchDashboardScreen({super.key});

  static const String route = 'watchdashboardscreen';

  @override
  State<WatchDashboardScreen> createState() => _WatchDashboardScreenState();
}

class _WatchDashboardScreenState extends State<WatchDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return WatchShape(
        builder: (BuildContext context, WearShape shape, Widget? child) {
      return AmbientMode(builder: (context, mode, child) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [Text("Dashboard")]),
          ),
        );
      });
    });
  }
}
