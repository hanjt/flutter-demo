import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('第二个页面'),
        // backgroundColor: Colors.brown,
      ),
      // body: new Center(
      //   child: new RaisedButton(
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //     child: new Text('返回'),
      //   ),
      // ),
    );
  }
}