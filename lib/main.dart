import 'package:classapp/colors.dart';
import 'package:flutter/material.dart';

import 'main_menu.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      // Define the default brightness and colors.
      brightness: Brightness.dark,
      primaryColor: Color(primaryColor),
      accentColor: Color(secondaryColor),
//      fontFamily: 'Georgia',
      textTheme: TextTheme(
        headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
        title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
        body1: TextStyle(fontSize: 24.0, fontStyle: FontStyle.italic),
        body2: TextStyle(fontSize: 20.0, color: Color(primaryColor)),
      ),
    ),
    home: MyApp(),
//      theme: ThemeData(
//        canvasColor: Color(primaryColor),
//        primaryColor: Color(primaryColor),
//        accentColor: Color(secondaryColor),
//      )
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyMenu(),
      backgroundColor: Color(primaryColor),
      appBar: AppBar(
        title: Center(child: Text("My App")),
      ),
      body: Center(
        child: Text(
          "Hello World",
          style: TextStyle(fontSize: 38, color: Colors.white),
        ),
      ),
    );
  }
}
