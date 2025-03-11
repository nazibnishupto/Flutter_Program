import 'package:flutter/material.dart';

import 'Widget/addWaterButton.dart';


class Water_Tracker_App extends StatefulWidget {
  const Water_Tracker_App({super.key});

  @override
  State<Water_Tracker_App> createState() => _Water_Tracker_AppState();
}

class _Water_Tracker_AppState extends State<Water_Tracker_App> {

  int _currentInTake = 0;
  final int _goal = 2000;

  void addWater(int amount){
    setState(() {
      if(_currentInTake < _goal){
        _currentInTake = (_currentInTake + amount).clamp(0, _goal);
      }
    });
  }

  void resetWater(){
    setState(() {
      _currentInTake = 0;
    });
  }

  @override
  Widget build(BuildContext context) {

    double progress = (_currentInTake / _goal).clamp(0, 1.0);

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 120,
                  width: 180,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                     BoxShadow(
                       color: Colors.blue.withOpacity(0.2),
                       blurRadius: 10,
                       spreadRadius: 2,
                     )
                    ]
                  ),
                  child: Column(
                    children: [
                      Text("Today's Goal", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15,),),
                      SizedBox(height: 15,),
                      Text("${_goal} mL", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.blue),)
                    ],
                  ),
                ),
                Container(
                  height: 120,
                  width: 180,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.withOpacity(0.2),
                          blurRadius: 10,
                          spreadRadius: 2,
                        )
                      ]
                  ),
                  child: Column(
                    children: [
                      Text("Today's InTake", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15,),),
                      SizedBox(height: 15,),
                      Text("${_currentInTake} mL", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.blue),)
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 30,),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 130,
                  width: 130,
                  child: CircularProgressIndicator(
                    value: progress,
                    color: Colors.blueAccent,
                    backgroundColor: Colors.grey.shade400,
                    strokeWidth: 12,
                  ),
                ),
                Text("${(progress * 100).toInt()} %", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                SizedBox(height: 40),

              ],
            ),
            SizedBox(height: 40,),
            addWaterButton(amount: 200, onClick: () => addWater(200)),
            addWaterButton(amount: 500, icon: Icons.local_drink, onClick: () => addWater(500)),
            addWaterButton(amount: 1000, icon: Icons.local_cafe, onClick: () => addWater(1000)),

            SizedBox(height: 40,),

            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                  ),
                  onPressed: () => resetWater(),
                  child: Text("Reset", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),),

                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

