import 'package:flutter/material.dart';
import '../../Component/Bar/navigationBar.dart';

class Community extends StatefulWidget {
  @override
  CommunityState createState() => new CommunityState();
}
 
class CommunityState extends State<Community> {
  @override
  Widget build(BuildContext context) {
    return new NavigationBar(
        titles: <Widget>[Text('推荐'), Text('关注')],
        bodys: <Widget>[Text('推荐内容'), Text('关注内容'),],
    );
  }
}