import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'Widget/cityWidget.dart';

class SnackbarExample extends StatefulWidget {
  const SnackbarExample({super.key});

  @override
  State<SnackbarExample> createState() => _SnackbarExampleState();
}

class _SnackbarExampleState extends State<SnackbarExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: Text("Snackbar"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
            width: 10,
          ),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("HI HA HU --- Gone"),
                    duration: Duration(seconds: 1),
                    action: SnackBarAction(label: 'Undo', onPressed: () {}),
                  ));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                child: Text("Snackbar Button")),
          ),
          SizedBox(
            height: 15,
            width: 15,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.blueGrey,
                    builder: (context) {
                      return Column(
                        children: [
                          SizedBox(
                            height: 50,
                            width: 50,
                          ),
                          Center(
                            child: Text("This is Bottom Sheet"),
                          ),
                          SizedBox(
                            height: 50,
                            width: 50,
                          ),
                          Container(
                            height: 50,
                            width: 50,
                            color: Colors.red,
                          ),
                          SizedBox(
                            height: 50,
                            width: 50,
                          ),
                          Center(
                            child: Text("This is Bottom Sheet"),
                          ),
                        ],
                      );
                    });
              },
              child: Text("BottomList Button"),
            ),
          ),
          SizedBox(
            height: 15,
            width: 15,
          ),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Delete"),
                          content: Text("Are u sure u want to delete?"),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("Okay")),
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("Cancel"))
                          ],
                        );
                      });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                child: Text("Alert Button")),
          ),
          SizedBox(
            height: 50,
            width: 50,
          ),
          ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(dragDevices: {
              PointerDeviceKind.mouse,
              PointerDeviceKind.touch,
            }),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: AlwaysScrollableScrollPhysics(),
              child: Row(
                children: [
                  SizedBox(width: 10,),
                  cityWidget(cityImage: 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1b/6d/6b/80/caption.jpg?w=1200&h=-1&s=1', cityName: 'Singapore', cityDescription: 'This is one of the growing city in world right now',),
                  SizedBox(width: 10,),
                  cityWidget(cityImage: 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1b/6d/6b/80/caption.jpg?w=1200&h=-1&s=1', cityName: 'Nepal', cityDescription: 'This is one of the cleanliest cities in world right now',),
                  SizedBox(width: 10,),
                  cityWidget(cityImage: 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1b/6d/6b/80/caption.jpg?w=1200&h=-1&s=1', cityName: 'Dhaka', cityDescription: 'This is one of the poluted city in world right now',),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


