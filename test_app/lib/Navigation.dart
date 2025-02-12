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
      body: Column(

        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(padding: const EdgeInsets.all(10.0)),
          ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Activity1()));
              },
              style: buttonStyle,
              child: Text("Go Activity 1")
          ),
          Padding(padding: const EdgeInsets.all(10.0)),
          ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Activity2()));
              },
              style: buttonStyle,
              child: Text("Go Activity 2")
          )
        ],
      ),
    );
  }
}

class Activity1 extends StatelessWidget {
  const Activity1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Activity1"),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Activity2()));
            },
            child: Text("Goo Act 2")),
      ),
    );
  }
}

class Activity2 extends StatelessWidget {
  const Activity2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Activity2"),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Activity1()));
            },
            child: Text("Goo Act 1")),
      ),
    );
  }
}
