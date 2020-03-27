import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

import 'colors.dart';

class QRReader extends StatefulWidget {
  @override
  _QRReaderState createState() => _QRReaderState();
}

class _QRReaderState extends State<QRReader> {
  String results;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('QR Reader'),
        ),
      ),
      body: Container(
        color: Color(secondaryColor),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16.0)),
              border: Border.all(
                color: Colors.white,
                width: 1,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Text(results == null ? "Waiting for scan" : results),
            ),
          ),
//          child: RaisedButton(
//            onPressed: results == null ? null : () => _launchURL(results),
//            child: Text(
//                results == null ? "Waiting for Scanning" : "Open :" + results),
//          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.settings_overscan,
            color: Theme.of(context).primaryColor),
        label: Text("Scan", style: Theme.of(context).textTheme.body2),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.0)),
            side: BorderSide(color: Colors.white)),
        onPressed: scanQR,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  _launchURL(url) async {
    if (await canLaunch(results)) {
      await launch(results);
    } else {
      throw 'Could not launch $results';
    }
  }

  scanQR() async {
    print("pressed");
    try {
      String result = await BarcodeScanner.scan();
      print(result);
      setState(() {
        results = result;
      });
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          results = "Camera permission was denied";
        });
      } else {
        setState(() {
          results = "Unkown error";
        });
      }
    } on FormatException catch (_) {
      setState(() {
        results = "Yo pressed the back button befor scanning";
      });
    } catch (e) {
      print(e);
      setState(() {
        results = "Error";
      });
    }
  }
}
