import 'package:flutter/material.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {

    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Row(
          children: [
            CircleAvatar(
              radius: 18,
            ),
            SizedBox(width: 8,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Nazib Hossen", style: textTheme.bodyLarge?.copyWith(
                  color: Colors.white,
                ),),
                Text("nazib@gmail.com", style: textTheme.bodySmall?.copyWith(
                  color: Colors.white,
                ),)
              ],
            )
          ],
        ),
      ),
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
