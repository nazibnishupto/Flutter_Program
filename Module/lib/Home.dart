import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'UserInfo.dart';

class ImageExample extends StatelessWidget {
  const ImageExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image"),
      ),
      body: Column(
        children: [
          Center(
            child: Image.network(
              "https://images.pexels.com/photos/268533/pexels-photo-268533.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
              height: 50.h,
              width: 50.w,
            ),
          ),
          const SizedBox(height: 20), // Added spacing
          Center(
            child: Image.asset(
              "ASSET/uncrop_hero_bdf08a8ca6.jpg",
              width: 200,
              height: 200,
              fit: BoxFit.fitWidth,
            ),
          ),
          Text("Hello", style: TextStyle(fontSize: 30.sp)),
          Expanded(
            child: ResponsiveBuilder(
              builder: (context, sizingInformation) {
                if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
                  return Container(color: Colors.blue, height: 100);
                }
                if (sizingInformation.deviceScreenType == DeviceScreenType.tablet) {
                  return Container(color: Colors.red, height: 100);
                }
                if (sizingInformation.deviceScreenType == DeviceScreenType.watch) {
                  return Container(color: Colors.yellow, height: 100);
                }
                return Container(color: Colors.purple, height: 100);
              },
            ),
          ),
        ],
      ),
    );
  }
}
