import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'UserInfo.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _taskController = TextEditingController();

  List<String> _task = [];

  @override
  void initState() {
    super.initState();

  }

  _addTask(){
    if(_taskController.text.isNotEmpty){
      setState(() {
        _task.add(_taskController.text);
        _taskController.clear();
      });
    }
  }

  _removeTask(int index){
    setState(() {
      _task.removeAt(index);
    });
  }

  _removeALL(){
    setState(() {
      _task.clear();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TO DO LIST", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _taskController,
              decoration: InputDecoration(
                hintText: "Enter your test",
                border: OutlineInputBorder(),
                suffixIcon: IconButton(onPressed: _addTask, icon: Icon(Icons.add)),
              ),
            ),
            SizedBox(height: 20,),

            Expanded(
              child: ListView.builder(
                  itemCount: _task.length,
                  itemBuilder:(context,index){
                    return Card(
                      child: ListTile(
                        title: Text(_task[index]),
                        trailing: IconButton(onPressed: () => _removeTask(index), icon: Icon(Icons.delete), color: Colors.red,),
                      ),
                    );
                  }
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: _removeALL, child: Icon(Icons.delete_sweep),),
    );
  }
}
