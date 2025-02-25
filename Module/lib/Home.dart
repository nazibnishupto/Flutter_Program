import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'UserInfo.dart';

class MediaQueryExample extends StatelessWidget {
  MediaQueryExample({super.key});

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

class WrapExample extends StatelessWidget {
  WrapExample({super.key});

  List<String> categories = ["Veg","Mutton","chicken","carrot","milk","tea","masala","potato"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wrap Example"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Wrap(
            spacing: 10,
            runSpacing: 10,
            children: categories.map((category){
              return Chip(
                label: Text(category,style: const TextStyle(color: Colors.white)),
                backgroundColor: Colors.blueAccent.shade100,
                elevation: 4,
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              );
            }).toList()
          )
      ),
    );
  }
}

class LayoutBuilderExample extends StatelessWidget {
  const LayoutBuilderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Layout Builder"),
        backgroundColor: Colors.redAccent.shade200,
        centerTitle: true,
      ),

      body: LayoutBuilder(
          builder: (context,con){
            if(con.maxWidth >= 900){
              return Center(
                child: Text("This is for PC View", style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic, fontWeight: FontWeight.bold,color: Colors.red),),
              );
            }
            else if(con.maxWidth>600 && con.maxWidth<900){
              return Center(
                child: Text("This is for Tablet View", style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic, fontWeight: FontWeight.bold,color: Colors.green),),
              );
            }
            else{
              return Center(
                child: Text("This is for Mobile View", style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic, fontWeight: FontWeight.bold,color: Colors.blue),),
              );
            }
          }
      ),
    );
  }
}
