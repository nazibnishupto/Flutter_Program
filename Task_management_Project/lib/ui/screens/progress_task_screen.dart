import 'package:flutter/material.dart';
import '../widgets/task_card.dart';

class ProgressTaskScreen extends StatefulWidget {
  const ProgressTaskScreen({super.key});

  @override
  State<ProgressTaskScreen> createState() => _ProgressTaskScreenState();
}

class _ProgressTaskScreenState extends State<ProgressTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 8,),
            ListView.separated(
              primary: false,
              shrinkWrap: true,
              itemCount: 6,
              itemBuilder: (context, index)
              {
                return TaskCard(chipText: 'Progress', chipColor: Colors.deepPurple,);
              },
              separatorBuilder: (context, index) => SizedBox(height: 8,),
            ),
          ],
        ),
      ),
    );
  }
}
