
import 'package:flutter/material.dart';
import '../../Component/Bar/navigationBar.dart';
import '../../Component/ListView/cell.dart';
class Home extends StatefulWidget {
  @override
  HomeState createState() => new HomeState();
}
 
class HomeState extends State<Home> {
  var find = ListView.builder(
            shrinkWrap: true, 
            itemCount: 10,
            itemBuilder: (context, index) {
              return DailyCell();
            },
          ); 
  var recommend = ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return ListTile(title: new Text("Number $index"));
            },
          );
  var daily = ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return ListTile(title: new Text("Number $index"));
            },
          );
  @override
  Widget build(BuildContext context) {
      return new NavigationBar(
        titles: <Widget>[Text('发现'), Text('推荐'), Text('日报')],
        bodys: <Widget>[
          find,
          recommend, 
          daily],
    );
  }
}