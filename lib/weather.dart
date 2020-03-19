import 'package:classapp/main.dart';
import 'package:flutter/material.dart';

class Weather extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(MyApp.primaryColor),
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Weather'),
        ),
        backgroundColor: Color(MyApp.primaryColor),
      ),
      body: Center(
          child: Text(
        'Weather',
        style: TextStyle(fontSize: 28, color: Colors.white),
      )),
    );
  }
}
