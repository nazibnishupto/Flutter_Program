import 'package:flutter/material.dart';
import '../widgets/task_card.dart';

class CancelledTaskScreen extends StatefulWidget {
  const CancelledTaskScreen({super.key});

  @override
  State<CancelledTaskScreen> createState() => _CancelledTaskScreenState();
}

class _CancelledTaskScreenState extends State<CancelledTaskScreen> {
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
                return TaskCard(chipText: 'Cancelled', chipColor: Colors.deepOrange,);
              },
              separatorBuilder: (context, index) => SizedBox(height: 8,),
            ),
          ],
        ),
      ),
    );
  }
}
