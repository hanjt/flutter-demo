import 'package:flutter/material.dart';

class LoginController extends StatefulWidget {
  @override
  LoginState createState() => new LoginState();
}

class LoginState extends State<LoginController> {  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('书宝宝的窝'),
        ),
        body: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Flexible(
                  flex: 2,
                  child: Container(
                    padding: EdgeInsets.only(right: 20),
                    child: Text(
                      '用户名'
                    ),
                  ),
                ),
                Flexible(
                  flex: 6,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: '请输入正确邮箱           '
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Flexible(
                  flex: 2,
                  child: Container(
                    padding: EdgeInsets.only(right: 20),
                    child: Text(
                      '密   码'
                    ),
                  ),
                ),
                Flexible(
                  flex: 6,
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: '密码长度8位含大小写及数字'
                    ),
                  ),
                ),
              ],
            ),
            RaisedButton(
              child: const Text('登录'),
              color: Theme.of(context).accentColor,
              elevation: 4.0,
              splashColor: Colors.blueGrey,
              onPressed: () {
                // Perform some action
              },
            ),
            RaisedButton(
              child: const Text('注册'),
              color: Theme.of(context).accentColor,
              elevation: 4.0,
              splashColor: Colors.blueGrey,
              onPressed: () {
                // Perform some action
              },
            ),
          ],
        )
      ),
    );
  }
}