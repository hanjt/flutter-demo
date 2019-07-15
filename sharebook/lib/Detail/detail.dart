import 'package:flutter/material.dart';
import '../Component/information.dart';
import '../Network/networl.dart';
import '../Component/toast.dart';

class DetailController extends StatefulWidget {
  final String barcode;
  final bool readType;

  @override
  // _DetailState createState() => new _DetailState();
  _DetailState createState() {
    _DetailState status = new _DetailState();
    status.isbn = this.barcode;
    status.readType = this.readType;
    return status;
  }
  DetailController({
    this.barcode,
    this.readType,
  });
}


class _DetailState extends State<DetailController> {
  String isbn = '';
  bool readType;

  @override
  void initState() {
    super.initState();
  }

  void _increment() {
    fetchUpdateTypeStatus(this.isbn).then((response) {
      if (response.errorCode == 0) {
        //状态改变要用setState()方法
        setState(() {
          this.readType = true;
        });
      } else {
        showToast(response.errorMsg);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(''),
           actions: <Widget>[
             new Offstage(
              offstage: this.readType, 
              child: FlatButton (
                onPressed: _increment,
                color: Colors.blue,
                splashColor: Color(0x000000),
                child: Text(
                  '已读',
                  style: new TextStyle(
                    fontSize: 14.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: BookInformation(
          post: fetchBookDetail(this.isbn),
      ),
    );
  }  
}