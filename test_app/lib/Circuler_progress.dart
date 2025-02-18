import 'package:flutter/material.dart';

main(){
  runApp(const myApp()); //Application

}

class myApp extends StatelessWidget{
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.brown),
        color: Colors.blueAccent,
        debugShowCheckedModeBanner: false,
        home : HomeActivity()
    );
  }

}

class HomeActivity extends StatelessWidget {
  const HomeActivity({super.key});

  @override
  Widget build(BuildContext context) {

    ButtonStyle buttonStyle = ElevatedButton.styleFrom(
        padding: EdgeInsets.all(20),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(40))
        )

    );

    return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
          backgroundColor: Colors.blue,
        ),
        body:Center(
            child: CircularProgressIndicator(
              color: Colors.green,
              strokeWidth: 5,
              backgroundColor: Colors.greenAccent,
            ),
        )

    );
  }
}

