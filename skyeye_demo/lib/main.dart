import 'package:flutter/material.dart';
import 'Component/Tabbar/tabbar.dart';

//创建tabbar
// void main() => runApp(HomeAppBar());
void main() {
  var bar = new HomeAppBar();
  bar.titles = [Text('发现'), Text('推荐'), Text('日报')];
  bar.bodys = [Text('发现内容'), Text('推荐内容'), Text('日报内容')];
  runApp(bar);
}