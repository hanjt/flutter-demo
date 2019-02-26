import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';
import 'dart:async';

import '../Network/networl.dart';
import '../Component/information.dart';
class ScanController extends StatefulWidget {
  @override
  _ScanState createState() => new _ScanState();
}

class _ScanState extends State<ScanController> {
  String _barcode = "";

  @override
  void initState() {
    super.initState();
    scan();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code'),
        actions: <Widget>[
          FlatButton (
            onPressed: () {

            },
            color: Colors.blue,
            splashColor: Color(0x000000),
            child: Text(
              '提交',
              style: new TextStyle(
                fontSize: 14.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: BookInformation(
        post: fetchBookDetail(this._barcode),
      ),
    );
  }

   Future scan() async {
    try {
      String barcode = await BarcodeScanner.scan();
      setState(() {
        return this._barcode = barcode;
      });
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          return this._barcode = 'The user did not grant the camera permission!';
        });
      } else {
        setState(() {
          return this._barcode = 'Unknown error: $e';
        });
      }
    } on FormatException{
      setState(() => this._barcode = 'null (User returned using the "back"-button before scanning anything. Result)');
    } catch (e) {
      setState(() => this._barcode = 'Unknown error: $e');
    }
  }
}
