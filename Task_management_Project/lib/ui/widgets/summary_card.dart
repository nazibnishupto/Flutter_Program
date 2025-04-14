import 'package:flutter/material.dart';

class SummaryCard extends StatelessWidget {
  const SummaryCard({
    super.key,
    required this.title,
    required this.taskCount,
  });

  final String title;
  final int taskCount;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24,horizontal: 16),
        child: Column(
          children: [
            Text('$taskCount',style: TextStyle(fontSize: 24),),
            Text(title,style: TextStyle(color: Colors.black54),),
          ],
        ),
      ),
    );
  }
}