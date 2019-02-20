import 'package:flutter/material.dart';
import '../Component/cell.dart';
import '../Detail/detail.dart';
import '../Model/homeResponse.dart';
import '../Model/enumeration.dart';
import '../Network/networl.dart';
import '../Scan/scan.dart';

import 'package:barcode_scan/barcode_scan.dart';
import 'dart:async';
import 'package:flutter/services.dart';

class ShareBookApp extends StatefulWidget {
  @override
  ShareBookState createState() => new ShareBookState();
}

class ShareBookState extends State<ShareBookApp> {  

    String barcode = "";

  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    HomeListResponse response = new HomeListResponse(
      response: book
    );
    List list = response.convertToModel();
    return MaterialApp(
      title: 'Share Book',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('书宝宝的窝'),
          actions: <Widget>[
            Builder(
              builder: (context) => IconButton(
                  icon: Icon(
                  Icons.add
                  ),
                  onPressed: scan
              ),
            ),
          ],
        ),
        body: ListView.separated(
              shrinkWrap: true, 
              itemCount: list.length,
              separatorBuilder: (BuildContext context, int index) => new Divider(), 
              itemBuilder: (context, index) {
                return new InkWell(
                  child: BookCell(
                    title: list[index].title,
                    content: list[index].content,
                  ),
                  onTap: (){
                    //跳转详情页
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => 
                      DetailController(
                        post: fetchBookDetail(list[index].isbn)
                      )),
                    );                 
                  },
                );//BookCell();
              },
            ),
      ),
    );
  }

  Future scan() async {
    try {
      String barcode = await BarcodeScanner.scan();
      setState(() {
        return this.barcode = barcode;
      });
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          return this.barcode = 'The user did not grant the camera permission!';
        });
      } else {
        setState(() {
          return this.barcode = 'Unknown error: $e';
        });
      }
    } on FormatException{
      setState(() => this.barcode = 'null (User returned using the "back"-button before scanning anything. Result)');
    } catch (e) {
      setState(() => this.barcode = 'Unknown error: $e');
    }
  }
}

Map<String, dynamic> book = {'list':[
  {'url': 'http://www.baidu.com','title': '我是标题', 'content': '我是内容', 'isbn': '9787533936020', 'type': ReadType.noRead},
  {'url': 'http://www.baidu.com','title': '我是标题', 'content': '我是内容', 'isbn': '9787505735002', 'type': ReadType.noRead}
   ]};