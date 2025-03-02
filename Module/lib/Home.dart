import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'UserInfo.dart';

class ImageExample extends StatelessWidget {
  const ImageExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image"),
      ),
      body: Column(
        children: [
          Center(
            child: Image.network(
                height: 200,
                width: 200,
                "https://images.pexels.com/photos/268533/pexels-photo-268533.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
          ),
          Center(
            child: Image.asset("ASSET/uncrop_hero_bdf08a8ca6.jpg",
                width: 200,
                height: 200,
                fit: BoxFit.fitWidth),
          )
        ],
      ),
    );
  }
}
