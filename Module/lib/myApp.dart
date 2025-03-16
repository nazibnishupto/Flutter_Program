import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'Calculator_APP.dart';
import 'Home.dart';

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          useInheritedMediaQuery: true,
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          theme: ThemeData(
            brightness: Brightness.light,
              primaryColor: Colors.orange,
              appBarTheme: AppBarTheme(
                color: Colors.orangeAccent,
                centerTitle: true,
              ),

              elevatedButtonTheme: ElevatedButtonThemeData(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurpleAccent,
                      foregroundColor: Colors.white))),
          title: 'Ostad Flutter app',

          home: TODO_app(),
        );
      }
    );
  }
}