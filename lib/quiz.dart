import 'package:classapp/main.dart';
import 'package:flutter/material.dart';

class Quiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(MyApp.primaryColor),
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Quiz'),
        ),
        backgroundColor: Color(MyApp.primaryColor),
      ),
      body: Center(
          child: Text(
        'Quiz',
        style: TextStyle(fontSize: 28, color: Colors.white),
      )),
    );
  }
}
