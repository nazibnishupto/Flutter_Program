import 'package:flutter/material.dart';
import '../widgets/task_card.dart';

class CompletedTaskScreen extends StatefulWidget {
  const CompletedTaskScreen({super.key});

  @override
  State<CompletedTaskScreen> createState() => _CompletedTaskScreenState();
}

class _CompletedTaskScreenState extends State<CompletedTaskScreen> {
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
                return TaskCard(chipText: 'Completed', chipColor: Colors.green,);
              },
              separatorBuilder: (context, index) => SizedBox(height: 8,),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
