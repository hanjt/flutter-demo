import 'package:flutter/material.dart';
 
class My extends StatefulWidget {
  @override
  MyState createState() => new MyState();
}
 
class MyState extends State<My> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("我的"),
        ),
        body: new Center(
          child: new Text('My'),
        ),
      ),
    );
  }
}