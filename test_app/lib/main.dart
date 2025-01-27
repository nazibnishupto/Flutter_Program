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


  MySnackBar(message,context){
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message))
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MyApp"),
        titleSpacing: 0,
        centerTitle: false,
        toolbarHeight: 70,
        toolbarOpacity: 0.7,
        elevation: 0,
        backgroundColor: Colors.lightGreen,
        actions: [
          IconButton(onPressed: (){MySnackBar("Too much Comments!!!", context);}, icon: Icon(Icons.comment)),
          IconButton(onPressed: (){MySnackBar("There is Email...", context);}, icon: Icon(Icons.email)),
          IconButton(onPressed: (){MySnackBar("Wanna DarkMode????", context);}, icon: Icon(Icons.dark_mode)),
          IconButton(onPressed: (){MySnackBar("No Phone call,Sorry^^", context);}, icon: Icon(Icons.call)),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        elevation: 10,
        child: Icon(Icons.delete),
        backgroundColor: Colors.lightGreen,
        onPressed: (){
          MySnackBar("HeHeHeHe", context);
        },
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.access_alarm),label: "Alarm"),
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.image),label: "Image")
        ],
        onTap: (int index){
          if(index==0){
            MySnackBar("I am alarm menu", context);
          }
          if(index==1){
            MySnackBar("I am Home", context);
          }
          if(index==2){
            MySnackBar("I am Image menu", context);
          }
        },
      ),

      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                padding: EdgeInsets.all(0),
                child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: Colors.brown),
                  accountName: Text("New App"),
                  accountEmail: Text("abc@g.com"),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(
                      "https://images.rawpixel.com/image_png_800/czNmcy1wcml2YXRlL3Jhd3BpeGVsX2ltYWdlcy93ZWJzaXRlX2NvbnRlbnQvam9iNjgwLTE2Ni1wLWwxZGJ1cTN2LnBuZw.png",
                    ),
                  ),
                )
            ),
            ListTile(
                leading: Icon(Icons.home),
                title: Text("Home"),
                onTap: (){
                  MySnackBar("HIHAHUHU", context);
                },
            ),
            ListTile(
                leading: Icon(Icons.contact_page),
                title: Text("Contract"),
                onTap: (){
                  MySnackBar("HIHAHUhhhhhhhhHU", context);
                },
            ),
            ListTile(
                leading: Icon(Icons.person),
                title: Text("Profile"),
                onTap: (){
                  MySnackBar("HIHAHUHU", context);
                },
            ),
          ],
        ),
      ),
      
      body: Container(
        height: 250,
        color: Colors.brown,
        alignment: Alignment.center,
        child: Text("Hello"),
      )
      
    );
  }
}