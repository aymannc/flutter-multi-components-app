import 'package:flutter/material.dart';

import 'WeatherResults.dart';
import 'colors.dart';

class Weather extends StatefulWidget {
  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  String _city = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(primaryColor),
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Weather of " + _city),
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
                  hintText: "Search for a city",
                ),
                onChanged: (str) {
                  setState(() {
                    _city = str;
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
                            builder: (context) => WeatherResults(_city)));
                    print(_city);
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
