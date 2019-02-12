import 'package:flutter/material.dart';
 
class Community extends StatefulWidget {
  @override
  CommunityState createState() => new CommunityState();
}
 
class CommunityState extends State<Community> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("社区"),
        ),
        body: new Center(
          child: new Text('Community'),
        ),
      ),
    );
  }
}