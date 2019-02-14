import 'package:flutter/material.dart';

class DetailController extends StatelessWidget {
  final String title;
  final String content;
  const DetailController({this.title, this.content});
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('$title'),
        ),
        body: new Center(
          child: new Text('$content'),
        ),
      );
  }
}