import 'package:flutter/material.dart';

import '../widgets/summary_card.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildSummarySection(),
          Card(
            elevation: 0,
            color: Colors.white,
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("This is the title",style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
                  SizedBox(height: 6,),
                  Text("Description will be here"),
                  SizedBox(height: 6,),
                  Text("Date: 11/10/2024",style: TextStyle(fontWeight: FontWeight.w500),),
                  SizedBox(height: 10,),
                  Row(children: [
                    Chip(
                      label: Text(
                        "New",
                        style: TextStyle(color: Colors.white),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24)),
                      backgroundColor: Colors.blue,
                      side: BorderSide.none,
                    ),
                  ])
                ],
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
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
