import 'package:flutter/material.dart';
import 'ui/screens/splash_screen.dart';

class TaskManagementApp extends StatefulWidget {
  const TaskManagementApp({super.key});

  @override
  State<TaskManagementApp> createState() => _TaskManagementAppState();
}

class _TaskManagementAppState extends State<TaskManagementApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(),
    );
  }
}
