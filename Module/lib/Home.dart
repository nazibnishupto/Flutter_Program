import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TODO_app extends StatefulWidget {
  const TODO_app({super.key});

  @override
  State<TODO_app> createState() => _TODO_appState();
}

class _TODO_appState extends State<TODO_app> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        title: Text("TODO APP"),
      ),
      body: Column(
        children: [
          SizedBox(height: 20,),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 80,
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(color: Colors.black12, blurRadius: 4),
                  ]
                ),
                child: Column(
                  children: [
                    Text("Active",style: TextStyle(fontSize: 23,fontWeight: FontWeight.w500),),
                    Text("20",style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
              Container(
                height: 80,
                width: 150,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(color: Colors.black12, blurRadius: 4),
                    ]
                ),
                child: Column(
                  children: [
                    Text("Completed",style: TextStyle(fontSize: 23,fontWeight: FontWeight.w500),),
                    Text("10",style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){}, child: Icon(Icons.add),),
    );
  }
}


