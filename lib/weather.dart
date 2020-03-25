import 'package:flutter/material.dart';

import 'colors.dart';

class Weather extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(primaryColor),
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Weather'),
        ),
        backgroundColor: Color(primaryColor),
      ),
      body: Center(
          child: Text(
        'Weather',
        style: TextStyle(fontSize: 28, color: Colors.white),
      )),
    );
  }
}
