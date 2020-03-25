import 'package:classapp/colors.dart';
import 'package:flutter/material.dart';

class GalleryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(primaryColor),
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Gallery'),
        ),
        backgroundColor: Color(primaryColor),
      ),
      body: Center(
          child: Text(
        'Gallery',
        style: TextStyle(fontSize: 28, color: Colors.white),
      )),
    );
  }
}
