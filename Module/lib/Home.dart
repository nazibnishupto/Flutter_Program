import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'UserInfo.dart';

class aspectRatioExample extends StatelessWidget {
  const aspectRatioExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Aspect Ratio"),
      ),

      body: Column(
        children: [
          Container(
            color: Colors.blueAccent,
            child: AspectRatio(
              aspectRatio: 16/9,
              child: Container(
                color: Colors.amber,
                child: Center(
                  child: Text("Nazib",style: TextStyle(fontWeight: FontWeight.bold),),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class FractionalSizedBoxExample extends StatelessWidget {
  const FractionalSizedBoxExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Aspect Ratio"),
      ),

      body: Column(
        children: [
          Center(
            child: SizedBox(
              height: 200,
              width: 200,
              child: ColoredBox(
                  color: Colors.green),
            ),
          ),
          SizedBox(height: 20,),
          Center(
            child: Container(
              height: 200,
              width: 200,
              color: Colors.blue,
              child: FractionallySizedBox(
                heightFactor: .8,
                widthFactor: .5,
                child: ColoredBox(color: Colors.amber),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ExpandedExample extends StatelessWidget {
  const ExpandedExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expanded"),
      ),

      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 100,
              width: 200,
              child: Container(
                color: Colors.blue,
              ),
            ),

            SizedBox(
              height: 10,
              width: 10,
            ),

            SizedBox(
              height: 500,
              width: 200,
              child: Column(
                children: [
                  Expanded(
                      flex: 5,
                      child: Container(
                        color: Colors.green,
                      ),
                    ),
                  Expanded(
                        flex: 2,
                        child: Container(
                          color: Colors.amber,
                        ),
                      )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StackExample extends StatelessWidget {
  const StackExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stack"),
      ),

      body: Center(
        child: Stack(
          children: [
            Container(
              height: 300,
              width: 300,
              child: ColoredBox(color:Colors.black),
            ),
            Positioned(
              top: 10,
              left: 10,
              child: Container(
                height: 100,
                width: 100,
                child: ColoredBox(color:Colors.blue),
              ),
            ),
            Positioned(
              bottom: 10,
              right: 10,
              child: Container(
                height: 100,
                width: 100,
                child: ColoredBox(color:Colors.amber),
              ),
            )
          ],
        ),
      ),
    );
  }
}