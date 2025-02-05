//Module 10 Assignment

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Contact List',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ContactListScreen(),
    );
  }
}

class ContactListScreen extends StatefulWidget {
  const ContactListScreen({super.key});

  @override
  _ContactListScreenState createState() => _ContactListScreenState();
}

class _ContactListScreenState extends State<ContactListScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final List<Map<String, String>> _contacts = [];

  void _addContact() {
    String name = _nameController.text.trim();
    String number = _numberController.text.trim();

    if (name.isNotEmpty && number.isNotEmpty) {
      if(mounted){
        setState(() {
          _contacts.add({'name': name, 'number': number});
        });
        _nameController.clear();
        _numberController.clear();
      }
    }

  }

  void _deleteContact(int index) {
    setState(() {
      _contacts.removeAt(index);
    });
  }

  void _showDeleteDialog(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const Text('Confirmation', style: TextStyle(fontWeight: FontWeight.bold)),
          content: const Text('Are you sure for delete?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Icon(Icons.cancel_outlined, color: Colors.blue),
            ),
            TextButton(
              onPressed: () {
                _deleteContact(index);
                Navigator.pop(context);
              },
              child: const Icon(Icons.delete, color: Colors.red),
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Contact List', style: TextStyle(color: Colors.white),),
        titleSpacing: 0,
        centerTitle: true,
        toolbarHeight: 70,
        toolbarOpacity: 0.7,
        elevation: 0,
        backgroundColor: Colors.blueGrey,
      ),

      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(border: OutlineInputBorder(), labelText: "Name"),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _numberController,
              decoration: const InputDecoration(border: OutlineInputBorder(), labelText: "Number"),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 20,),
            ElevatedButton(
              onPressed: _addContact,
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                backgroundColor: Colors.blueGrey,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
              ),
              child: const Text('Add'),
            ),

            const SizedBox(height: 50),
            Expanded(
              child: ListView.builder(
                itemCount: _contacts.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.grey.shade50,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: ListTile(
                      leading: const Icon(Icons.person, color: Colors.brown,),
                      title: Text(
                        _contacts[index]['name'] ?? 'Unknown',
                        style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
                      ),
                      subtitle: Text(_contacts[index]['number'] ?? 'No number'),
                      trailing: const Icon(Icons.phone, color: Colors.blue),
                      onLongPress: () => _showDeleteDialog(index),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
