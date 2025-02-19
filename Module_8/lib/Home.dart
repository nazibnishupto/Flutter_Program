import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'UserInfo.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _count = 0;
  _counterIncrement(){
    setState(() {
      _count++;
    });

    print(_count);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        centerTitle: false,
      ),
      body: Center(
        child: Text(_count.toString(), style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold)),
      ),
      floatingActionButton: FloatingActionButton(onPressed: _counterIncrement, child: Icon(CupertinoIcons.plus),),
    );
  }
}
