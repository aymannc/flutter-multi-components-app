import 'package:classapp/colors.dart';
import 'package:classapp/quiz.dart';
import 'package:classapp/weather.dart';
import 'package:classapp/QRReader.dart';
import 'package:flutter/material.dart';

import 'gallery_page.dart';

class MyMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color(primaryColor),
        child: ListView(
          children: <Widget>[
            DrawerHeader(
//                decoration: BoxDecoration(
//                    gradient: LinearGradient(
//                        colors: [Color(primaryColor), Colors.white])),
              child: Center(
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(
                      "https://scontent.frak1-1.fna.fbcdn.net"
                      "/v/t1.0-9/p960x960/52775072_2086860254739255_4090072337796"
                      "300800_o.jpg?_nc_cat=101&_nc_sid=85a577&_nc_ohc=3wrtfCYdekE"
                      "AX95Ucoj&_nc_ht=scontent.frak1-1.fna&_nc_tp=6&oh=5b371fa81d"
                      "1ff10a7114466e307e9801&oe=5E987CF7"),
                ),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 30),
              leading: Icon(
                Icons.question_answer,
                color: Colors.white,
              ),
              trailing: Icon(
                Icons.arrow_right,
                color: Colors.white,
              ),
              title: Text(
                "Quiz",
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Quiz()));
              },
            ),
            Divider(),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 30),
              leading: Icon(
                Icons.wb_sunny,
                color: Colors.white,
              ),
              trailing: Icon(
                Icons.arrow_right,
                color: Colors.white,
              ),
              title: Text(
                "Wheather",
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Weather()));
              },
            ),
            Divider(),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 30),
              leading: Icon(
                Icons.image,
                color: Colors.white,
              ),
              trailing: Icon(
                Icons.arrow_right,
                color: Colors.white,
              ),
              title: Text(
                "Gallery",
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => GalleryPage()));
              },
            ),
            Divider(),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 30),
              leading: Icon(
                Icons.settings_overscan,
                color: Colors.white,
              ),
              trailing: Icon(
                Icons.arrow_right,
                color: Colors.white,
              ),
              title: Text(
                "QR reader",
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => QRReader()));
              },
            )
          ],
        ),
      ),
    );
  }
}
