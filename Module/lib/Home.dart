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
      appBar: AppBar(
        title: Text("Snackbar"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
            width: 50,
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
            height: 50,
            width: 50,
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
            height: 50,
            width: 50,
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
        ],
      ),
    );
  }
}
