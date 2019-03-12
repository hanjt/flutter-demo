import 'package:flutter/material.dart';
import '../Home/home.dart';
import '../Component/toast.dart';
import '../Utility/utility.dart';
import '../Signin/signin.dart';
import '../Network/networl.dart';

class LoginController extends StatefulWidget {
  @override
  LoginState createState() => new LoginState();
}

class LoginState extends State<LoginController> {
  
  final TextEditingController _mailController = new TextEditingController(text: '854692552@qq.com');
  final TextEditingController _passwordController = new TextEditingController(text: '123456Aa');
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        platform: TargetPlatform.iOS,
      ),
      //跳转到指定页面，且禁用右滑返回手势
      routes: {
        "/login": (_) => new HomeController(),
        "/signin": (_) => new SigninController(),
      },
      home: Scaffold(
        appBar: AppBar(
          title: Text('书宝宝的窝'),
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding:EdgeInsets.only(top: 20, bottom: 20),
              child: Row(
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
                      controller: _mailController,
                      decoration: InputDecoration(
                        hintText: '请输入正确邮箱           ',
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Row(
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
                      controller: _passwordController,
                      obscureText: true,//是否是密码
                      maxLength: 8,
                      decoration: InputDecoration(
                          hintText: '密码长度8位含大小写及数字',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: ButtonTheme(
                minWidth: 200,
                child: Builder(
                  builder: (context) => RaisedButton(
                    child: const Text('登录'),
                    color: Theme.of(context).accentColor,
                    textColor: Colors.white,
                    splashColor: Color(0x000000),
                    elevation: 4.0,
                    onPressed: () {
                      if (isMail(_mailController.text) && isPassword(_passwordController.text)) {
                        fetchLogin(_mailController.text, _passwordController.text).then((response) {
                          if (response.errorCode == 0) {
                            Navigator.pushReplacementNamed(context, "/login");
                          } else {
                            showToast(response.errorMsg);
                          }
                        });
                      } else {
                        if (!isMail(_mailController.text)) {
                          showToast("请输入正确邮箱");
                        } else {
                          showToast("请输入正确密码");
                        }
                      }
                    },
                  ),
                ),
              ),
            ),
            ButtonTheme(
              minWidth: 200,
              child: Builder(
                builder: (context) => RaisedButton(
                  child: const Text('注册'),
                  color: Theme.of(context).accentColor,
                  textColor: Colors.white,
                  elevation: 4.0,
                  splashColor: Color(0x000000),
                  onPressed: () {
                    Navigator.pushNamed(context, "/signin").then((value) {
                      Map result = value;
                        _mailController.text = result['mail'];
                        _passwordController.text = result['password'];
                    });
                  },
                ),
              ),
            ),
          ],
        )
      ),
    );
  }

}