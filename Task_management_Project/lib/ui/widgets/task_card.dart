import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.chipText,
    required this.chipColor,
  });

  final String chipText;
  final Color chipColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                  chipText,
                  style: TextStyle(color: Colors.white),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24)),
                backgroundColor: chipColor,
                side: BorderSide.none,
              ),
              Spacer(),
              IconButton(onPressed: () {}, icon: Icon(Icons.edit_note_sharp)),
              IconButton(onPressed: () {}, icon: Icon(Icons.delete_forever))
            ])
          ],
        ),
      ),
    );
  }
}