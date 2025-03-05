import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:http/http.dart' as http;

class RestApiExample extends StatefulWidget {
  const RestApiExample({super.key});

  @override
  State<RestApiExample> createState() => _RestApiExampleState();
}

class _RestApiExampleState extends State<RestApiExample> {
  List users = [];

  bool isLoading = false;

  Future<void> fetchUser() async {
    setState(() {
      isLoading = true;
    });
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    setState(() {
      isLoading = false;
    });

    if (response.statusCode == 200) {
      users = jsonDecode(response.body);
    } else {
      throw Exception("Failed to load users");
    }
  }

  @override
  void initState() {
    super.initState();
    fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "User List",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.brown,
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return Card(
                  margin: EdgeInsets.all(5),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  elevation: 4,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.deepPurple,
                      child: Text(
                        user['name'][0],
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                    title: Text(
                      user['name'],
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          "UserName: ${user['username']}",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          "Email: ${user['email']}",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          "Phone: ${user['phone']}",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          "Website ${user['website']}",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                );
              }),
    );
  }
}
