import 'package:flutter/material.dart';


class Water_Tracker_App extends StatefulWidget {
  const Water_Tracker_App({super.key});

  @override
  State<Water_Tracker_App> createState() => _Water_Tracker_AppState();
}

class _Water_Tracker_AppState extends State<Water_Tracker_App> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade500,
        title: Text("Water Tracker", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20, fontStyle: FontStyle.italic),),
      ),

      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                 BoxShadow(
                   color: Colors.blue.withOpacity(0.2),

                 )
                ]
              ),
              child: Column(
                children: [
                  Text("Today's InTake", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15,),),
                  SizedBox(height: 15,),
                  Text("1000 mL", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.blue),)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
