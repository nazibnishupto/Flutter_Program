import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:responsive_builder/responsive_builder.dart';

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
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(width: 10,),
                Container(
                  height: 50.h,
                  width: 30.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network("https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1b/6d/6b/80/caption.jpg?w=1200&h=-1&s=1"),
                      Text("Singapore",style: TextStyle(fontSize: 30,color: Colors.red, fontStyle: FontStyle.italic),),
                      SizedBox(height: 5,),
                      Text("Singapore is one of the beautiful cities in the world")
                    ],
                  ),
                ),
                SizedBox(width: 10,),
                Container(
                  height: 50.h,
                  width: 30.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network("https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1b/6d/6b/80/caption.jpg?w=1200&h=-1&s=1"),
                      Text("Singapore",style: TextStyle(fontSize: 30,color: Colors.red, fontStyle: FontStyle.italic),),
                      SizedBox(height: 5,),
                      Text("Singapore is one of the beautiful cities in the world")
                    ],
                  ),
                ),
                SizedBox(width: 10,),
                Container(
                  height: 50.h,
                  width: 30.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network("https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1b/6d/6b/80/caption.jpg?w=1200&h=-1&s=1"),
                      Text("Singapore",style: TextStyle(fontSize: 30,color: Colors.red, fontStyle: FontStyle.italic),),
                      SizedBox(height: 5,),
                      Text("Singapore is one of the beautiful cities in the world")
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
