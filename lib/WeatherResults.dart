import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:weather_icons/weather_icons.dart';

class WeatherResults extends StatefulWidget {
  String city;

  WeatherResults(this.city);

  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<WeatherResults> {
  List<dynamic> weatherData;
  Map<String, IconData> _iconsList = {
    "snow": WeatherIcons.snow,
    "clouds": WeatherIcons.cloud,
    "rain": WeatherIcons.rain,
    "clear": WeatherIcons.night_clear,
  };

  getData(url) {
    http.get(Uri.encodeFull(url), headers: {'accept': 'application/json'}).then(
        (resp) {
      setState(() {
        weatherData = json.decode(resp.body)['list'];
      });
    }).catchError((err) {
      print(err);
    });
  }

  @override
  void initState() {
    super.initState();
    String url =
        'http://openweathermap.org/data/2.5/forecast?q=${this.widget.city},ma&appid=b6907d289e10d714a6e88b30761fae22';
    print(url);
    this.getData(url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('${widget.city}'),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: (weatherData == null)
            ? Center(child: CircularProgressIndicator())
            : Container(
                color: Colors.black38,
                child: ListView.builder(
                    itemCount: weatherData == null ? 0 : weatherData.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: Theme.of(context).primaryColor,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Icon(_iconsList[weatherData[index]['weather'][0]['main'].toLowerCase()]),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 30),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                            "${new DateFormat('E dd/MM/yyyy').format(DateTime.fromMicrosecondsSinceEpoch(weatherData[index]['dt'] * 1000000))}",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold)),
                                        Text(
                                            "${new DateFormat('HH:mm').format(DateTime.fromMicrosecondsSinceEpoch(weatherData[index]['dt'] * 1000000))} |${weatherData[index]['weather'][0]['main']}",
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                "${weatherData[index]['main']['temp'].round()} °C",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ));
  }
}
