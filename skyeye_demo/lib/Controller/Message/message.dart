import 'package:flutter/material.dart';
 
class Message extends StatefulWidget {
  @override
  MessageState createState() => new MessageState();
}
 
class MessageState extends State<Message> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("通知"),
        ),
        body: new Center(
          child: new Text('Message'),
        ),
      ),
    );
  }
}