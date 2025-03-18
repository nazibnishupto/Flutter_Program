import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TODO_app extends StatefulWidget {
  const TODO_app({super.key});

  @override
  State<TODO_app> createState() => _TODO_appState();
}

class _TODO_appState extends State<TODO_app> {

  List<Map<String, dynamic>> tasks = [];
  bool showActiveTask = true;

  void _showTaskDialog({int ? index}){
    TextEditingController _taskController = TextEditingController(
      text: index != null ? tasks[index]['task'] : '',
    );
    showDialog(context: context, builder: (context) => AlertDialog(
      title: Text(index != null ? "Edit Task" : "Add Task"),
      content: TextField(
        controller: _taskController,
        decoration: InputDecoration(
          hintText: 'New Task',
        ),
      ),
      actions: [
        TextButton(onPressed: (){Navigator.pop(context);}, child: Text("Cancel")),
        ElevatedButton(
            style: ElevatedButton.styleFrom(shape: StadiumBorder()),
            onPressed: () {
              if(_taskController.text.trim().isNotEmpty){
                if(index == null){
                  addTask(_taskController.text);
                }
                else{
                  editTask(index, _taskController.text);
                }
              }
            },
            child: Text("Save")
        ),
      ],
    ));
  }

  void addTask(String task){
    setState(() {
      tasks.add({
        'task' : task,
        'completed' : false
      });
    });
    Navigator.pop(context);
  }

  void toggleTask(int index){
    setState(() {
      tasks[index]['completed'] = !tasks[index]['completed'];
    });
  }

  void deleteTask(int index){
    setState(() {
      tasks.removeAt(index);
    });
  }

  void editTask(int index, String updateTask){
    setState(() {
      tasks[index]['task'] = updateTask;
    });
    Navigator.pop(context);
  }

  int get activeCount => tasks.where((task) => !task['completed']).length;
  int get completedCount => tasks.where((task) => task['completed']).length;

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
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
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
                      Text(activeCount.toString(),style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),),
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
                      Text(completedCount.toString(),style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index){
                  return Dismissible(
                    key: Key(UniqueKey().toString()),
                    background: Container(
                      color: Colors.green,
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 20),
                      child: Icon(Icons.check, color: Colors.white,),
                    ),
                    secondaryBackground: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.only(right: 20),
                      child: Icon(Icons.delete, color: Colors.white,),
                    ),
                    onDismissed: (direction){
                      if(direction == DismissDirection.startToEnd){
                        toggleTask(index);
                      }
                      else{
                        deleteTask(index);
                      }
                    },
                    child: Card(
                      child: ListTile(
                        title: Text(tasks[index]['task'],
                          style: TextStyle(fontSize: 20, decoration: tasks[index]['completed']? TextDecoration.lineThrough: null),
                        ),
                        leading: Checkbox(
                            shape: CircleBorder(),
                            value: tasks[index]['completed'],
                            onChanged: (value) => toggleTask(index)
                        ),
                        trailing: IconButton(onPressed: ()=> _showTaskDialog(index: index), icon: Icon(Icons.edit))
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: ()=> _showTaskDialog(), child: Icon(Icons.add),),
    );
  }
}