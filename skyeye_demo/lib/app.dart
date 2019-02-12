import 'package:flutter/material.dart';
import 'Controller/Home/home.dart';
import 'Controller/Community/community.dart';
import 'Controller/Message/message.dart';
import 'Controller/My/my.dart';
class SkyEyeApp extends StatefulWidget {
  @override
  SkyEyeState createState() => new SkyEyeState();
}
 
class SkyEyeState extends State<SkyEyeApp>
    with SingleTickerProviderStateMixin {
  TabController controller;
  var tabs = [
              new Tab(
                text: "首页",
                icon: new Icon(
                  Icons.change_history,
                ),
              ),
              new Tab(
                text: "社区",
                icon: new Icon(
                  Icons.close,
                ),
              ),
              new Tab(
                text: "通知",
                icon: new Icon(
                  Icons.fiber_manual_record,
                ),
              ),
              new Tab(
                text: "我的",
                icon: new Icon(
                  Icons.crop_din,
                ),
              ),
            ];
  @override
  void initState() {
    controller = new TabController(length: tabs.length, vsync: this);
  }
 
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
 
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        body: new TabBarView(
          controller: controller,
          children: [
            new Home(),
            new Community(),
            new Message(),
            new My(),
          ],
        ),
        bottomNavigationBar: new Material(
          color: Colors.blue,
          child: new TabBar(
            controller: controller,
            tabs: tabs
          ),
        ),
      ),
    );
  }
}