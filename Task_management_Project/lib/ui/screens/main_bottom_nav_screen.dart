import 'package:assignment/ui/screens/cancelled_task_screen.dart';
import 'package:assignment/ui/screens/completed_task_screen.dart';
import 'package:assignment/ui/screens/new_task_screen.dart';
import 'package:assignment/ui/screens/progress_task_screen.dart';
import 'package:flutter/material.dart';

import '../widgets/tm_app_bar.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {

  int _selectedIndex = 0;

  final List<Widget> _screen = [
    NewTaskScreen(),
    ProgressTaskScreen(),
    CompletedTaskScreen(),
    CancelledTaskScreen(),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: TMAppBar(),
      body: _screen[_selectedIndex],
      bottomNavigationBar: NavigationBar(
          selectedIndex: _selectedIndex,
          onDestinationSelected: (index) {
            _selectedIndex = index;
            setState(() {});
          },
          destinations: const [
        NavigationDestination(
            icon: Icon(Icons.open_in_new_outlined), label: "New Task"),
        NavigationDestination(
            icon: Icon(Icons.blur_circular_sharp), label: "Progress"),
        NavigationDestination(
            icon: Icon(Icons.done_outline), label: "Completed"),
        NavigationDestination(
            icon: Icon(Icons.cancel_outlined), label: "Cancelled"),
      ]
      ),
    );
  }
}

