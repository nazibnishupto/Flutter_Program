import 'package:assignment/ui/screens/add_new_task_screen.dart';
import 'package:flutter/material.dart';

import '../widgets/summary_card.dart';
import '../widgets/task_card.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildSummarySection(),
            ListView.separated(
              primary: false,
              shrinkWrap: true,
              itemCount: 6,
              itemBuilder: (context, index) {
                return TaskCard(
                  chipText: 'New',
                  chipColor: Colors.blueAccent,
                );
              },
              separatorBuilder: (context, index) => SizedBox(
                height: 8,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onTapAddNewTask,
        child: Icon(Icons.add),
      ),
    );
  }

  void _onTapAddNewTask() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => AddNewTaskScreen()));
  }

  Widget _buildSummarySection() {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            SummaryCard(
              title: 'New Task',
              taskCount: 12,
            ),
            SummaryCard(
              title: 'Completed',
              taskCount: 9,
            ),
            SummaryCard(
              title: 'Progress',
              taskCount: 10,
            ),
            SummaryCard(
              title: 'canceled',
              taskCount: 7,
            ),
          ],
        ),
      ),
    );
  }
}
