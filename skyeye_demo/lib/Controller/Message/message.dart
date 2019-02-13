import 'package:flutter/material.dart';
import '../../Component/Bar/navigationBar.dart';

class Message extends StatefulWidget {
  @override
  MessageState createState() => new MessageState();
}
 
class MessageState extends State<Message> {
  @override
  Widget build(BuildContext context) {
    return new NavigationBar(
        titles: <Widget>[Text('推送'), Text('互动')],
        bodys: <Widget>[Text('推送内容'), Text('互动内容'),],
    );
  }
}