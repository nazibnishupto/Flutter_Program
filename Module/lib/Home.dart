import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'UserInfo.dart';

class Home extends StatelessWidget {
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("MediaQuery",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        backgroundColor: Colors.red,
        centerTitle: false,
      ),
      body: Center(
        child: Container(
          height: screenHeight,
          width: screenHeight,
          color: Colors.blueGrey,
          child: Center(
            child: Text(
              "Responsive Design",
              style: TextStyle(
                  fontSize: 50,
                  fontWeight:
                  FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
