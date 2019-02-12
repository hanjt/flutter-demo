
import 'package:flutter/material.dart';
 
class Home extends StatefulWidget {
  @override
  HomeState createState() => new HomeState();
}
 
class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("首页"),
        ),
        body: new Center(
          child: new Text('Homepage'),
        ),
      ),
    );
  }
}