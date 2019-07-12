import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';
import 'dart:async';

import '../Network/networl.dart';
import '../Component/information.dart';
import '../Model/detailResponse.dart';
import '../Component/toast.dart';

class ScanController extends StatefulWidget {
  @override
  _ScanState createState() => new _ScanState();
}

class _ScanState extends State<ScanController> {
  String _barcode = "";

  BookInformation information;
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
              DetailBookResponse response = information.response;
              fetchAddBook(response.title, response.author, 
                           response.publisher, 
                           response.pubDate, response.binding,
                            _barcode, response.imageURL).then((response) {
                          if (response.errorCode == 0) {
                            showToast('提交成功');
                            Navigator.pop(context, {'reloadData': true});
                          } else {
                            showToast(response.errorMsg);
                          }
                        });
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
      body: information,
    );
  }

   Future scan() async {
    try {
      String barcode = await BarcodeScanner.scan();
      setState(() {
        information = BookInformation(
          post: fetchBookDetail(barcode),
        );
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
