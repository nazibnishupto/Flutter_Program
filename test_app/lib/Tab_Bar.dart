
import 'package:flutter/material.dart';

import 'Fragment/EmailFragment.dart';
import 'Fragment/HomeFragment.dart';
import 'Fragment/SearchFragment.dart';
import 'Fragment/SettingsFragment.dart';
import 'Fragment/WalletFragment.dart';

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


  MySnackBar(message,context){
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message))
    );
  }


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



    var MyItems = [
      {"img":"https://images.rawpixel.com/image_png_800/czNmcy1wcml2YXRlL3Jhd3BpeGVsX2ltYWdlcy93ZWJzaXRlX2NvbnRlbnQvam9iNjgwLTE2Ni1wLWwxZGJ1cTN2LnBuZw.png","title":"Butterfly"},
      {"img":"https://images.rawpixel.com/image_png_600/czNmcy1wcml2YXRlL3Jhd3BpeGVsX2ltYWdlcy93ZWJzaXRlX2NvbnRlbnQvam9iNjc3LTE1My1wXzEtbDE0b2ZocDQucG5n.png","title":"Hand"},
      {"img":"https://images.rawpixel.com/image_png_800/czNmcy1wcml2YXRlL3Jhd3BpeGVsX2ltYWdlcy93ZWJzaXRlX2NvbnRlbnQvam9iNjc5LTExMi1wLWwxNjd4NHA3LnBuZw.png","title":"Picture"},
      {"img":"https://images.rawpixel.com/image_png_800/czNmcy1wcml2YXRlL3Jhd3BpeGVsX2ltYWdlcy93ZWJzaXRlX2NvbnRlbnQvam9iNjgwLTE2Ni1wLWwxZGJ1cTN2LnBuZw.png","title":"Hasib"},
      {"img":"https://images.rawpixel.com/image_png_600/czNmcy1wcml2YXRlL3Jhd3BpeGVsX2ltYWdlcy93ZWJzaXRlX2NvbnRlbnQvam9iNjc3LTE1My1wXzEtbDE0b2ZocDQucG5n.png","title":"fly"},
      {"img":"https://images.rawpixel.com/image_png_800/czNmcy1wcml2YXRlL3Jhd3BpeGVsX2ltYWdlcy93ZWJzaXRlX2NvbnRlbnQvam9iNjc5LTExMi1wLWwxNjd4NHA3LnBuZw.png","title":"Picture"}
    ];


    MyAlertDialog(context){
      return showDialog(
          context: context,
          builder: (BuildContext context){
            return Expanded(
                child: AlertDialog(
                  title: Text("Alert !!"),
                  content: Text("Do you want to delete??"),
                  actions: [
                    TextButton(onPressed: (){
                      MySnackBar("Bye_Bye", context);
                      Navigator.of(context).pop();
                    }, child: Text("Yes")),
                    TextButton(onPressed: (){Navigator.of(context).pop();}, child: Text("No"))
                  ],
                )
            );
          }
      );
    }


    return DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            title: Text("MyApp"),
            titleSpacing: 10,
            centerTitle: false,
            toolbarHeight: 70,
            toolbarOpacity: 0.7,
            elevation: 0,
            backgroundColor: Colors.lightGreen,
            actions: [
              IconButton(onPressed: (){MySnackBar("Wanna DarkMode????", context);}, icon: Icon(Icons.dark_mode)),
              IconButton(onPressed: (){MySnackBar("No Phone call,Sorry^^", context);}, icon: Icon(Icons.call)),
            ],

          bottom: TabBar(
            //isScrollable: true,
            tabs: [
              Tab(icon: Icon(Icons.home),),
              Tab(icon: Icon(Icons.email),),
              Tab(icon: Icon(Icons.settings),),
              Tab(icon: Icon(Icons.wallet),),
              Tab(icon: Icon(Icons.search),),
            ]
          ),
          ),
          body: TabBarView(
              children: [
                HomeFragment(),
                Emailfragment(),
                Settingsfragment(),
                Walletfragment(),
                Searchfragment(),
              ]
          ),


        )
    );
  }
}