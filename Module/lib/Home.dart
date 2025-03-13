import 'package:flutter/material.dart';
import 'Models/expense.dart';

class Expense_Tracker_App extends StatefulWidget {
  const Expense_Tracker_App({super.key});

  @override
  State<Expense_Tracker_App> createState() => _Expense_Tracker_AppState();
}

class _Expense_Tracker_AppState extends State<Expense_Tracker_App> {
  final List<expense> _expense = [];
  final List<String> _category = [
    'Food',
    'Transport',
    'Entertainment',
    'Bills'
  ];
  double _total = 0.0;

  void _showForm(BuildContext context){
    TextEditingController titleController = TextEditingController();
    TextEditingController amountController = TextEditingController();

    String selectedCategory = _category.first;
    
    showModalBottomSheet(context: context,
        isScrollControlled: true,
        builder: (_){
          return Padding(
            padding: EdgeInsets.only(
              bottom: 10,
              left: 16,
              right: 16,
              top: 16,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Title',
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Amount',
                  ),
                ),
                SizedBox(height: 10,),
                DropdownButtonFormField<String>(
                    items: _category.map((category)=>DropdownMenuItem(value: category, child: Text(category),)).toList(),
                    onChanged: (value) => selectedCategory = value!,
                    decoration: InputDecoration(
                      labelText: 'Category',
                    ),
                ),
                SizedBox(height: 10,),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(onPressed: (){}, child: Text("Add Button"))
                ),
                SizedBox(height: 10,),
              ],
            ),
          );
        });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense Tracker"),
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(onPressed: ()=> _showForm(context), icon: Icon(Icons.add)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: IconButton(onPressed: ()=> _showForm(context), icon: Icon(Icons.add)),
      ),
      body: Column(
        children: [
          Center(
            child: Card(
                margin: EdgeInsets.all(16),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Text(
                    "Total: \$${_total}",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: _expense.length,
                itemBuilder: (ctx, index) {
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue,
                        child: Text(_expense[index].category),
                      ),
                      title: Text(_expense[index].title),
                      subtitle: Text(_expense[index].date.toString()),
                    ),
                  );
                }
            ),
          )
        ],
      ),
    );
  }
}
