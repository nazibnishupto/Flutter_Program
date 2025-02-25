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
              ),
            ),
          )
        ],
      ),
    );
  }
}

