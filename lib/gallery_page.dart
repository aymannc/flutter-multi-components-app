import 'package:classapp/colors.dart';
import 'package:flutter/material.dart';

import 'GalleryResults.dart';

class GalleryPage extends StatefulWidget {
  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  String _keyword="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(primaryColor),
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Gallery of "+_keyword),
          ),
          backgroundColor: Color(primaryColor),
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 1.0),
                  ),
                  hintText: "Search in gallery",
                ),
                onChanged: (str) {
                  setState(() {
                    _keyword = str;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: SizedBox(
                width: 250,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(0.0),
                      side: BorderSide(color: Colors.white)),
                  color: (Theme.of(context).primaryColor),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => GalleryResults(_keyword)));
                  },
                  child: ListTile(
                    leading: Icon(Icons.search),
                    title: Text("Search"),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
