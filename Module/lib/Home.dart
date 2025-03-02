import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

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
          Container(
            height: 500,
            width: 500,
            child: Center(
              child: Image.network(
                  height: 50.h,
                  width: 50.w,
                  "https://images.pexels.com/photos/268533/pexels-photo-268533.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
            ),
          ),
          Center(
            child: Image.asset("ASSET/uncrop_hero_bdf08a8ca6.jpg",
                width: 200,
                height: 200,
                fit: BoxFit.fitWidth),
          ),
          Text("Hello",style: TextStyle(fontSize:30.sp))

        ],
      ),
    );
  }
}
