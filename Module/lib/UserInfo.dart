import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  final String email;
  const UserInfo(this.email, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User page"),
      ),
      body: Column(
        children: [
          Text(email, style: TextStyle(fontStyle: FontStyle.italic, fontSize: 32),),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Back")),
          ElevatedButton(
              onPressed: () {},
              child: Text("Page1"))
        ],
      ),
    );
  }
}