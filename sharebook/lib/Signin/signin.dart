import 'package:flutter/material.dart';
import '../Component/toast.dart';
import '../Utility/utility.dart';
import '../Network/networl.dart';

class SigninController extends StatefulWidget {
  @override
  SigninState createState() => new SigninState();
}

class SigninState extends State<SigninController> {
  final TextEditingController _mailController = new TextEditingController(text: '854692552@qq.com');
  final TextEditingController _passwordController = new TextEditingController(text: '123456Aa');
  final TextEditingController _reenterPasswordController = new TextEditingController(text: '123456Aa');
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text('注册'),
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
                        hintText: '请输入正确邮箱           '
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
                          hintText: '密码长度8位含大小写及数字'
                      ),
                    ),
                  ),
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
                        '确认输入'
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 6,
                    child: TextField(
                      controller: _reenterPasswordController,
                      obscureText: true,//是否是密码
                      maxLength: 8,
                      decoration: InputDecoration(
                          hintText: '密码长度8位含大小写及数字'
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
                    child: const Text('注册'),
                    color: Theme.of(context).accentColor,
                    textColor: Colors.white,
                    splashColor: Color(0x000000),
                    elevation: 4.0,
                    onPressed: () {
                      if (!isMail(_mailController.text)) {
                        showToast("请输入正确邮箱");
                      }  else if (!isPassword(_passwordController.text)) {
                        showToast("请输入正确密码");
                      } else if (_passwordController.text !=_reenterPasswordController.text) {
                        showToast("两次密码输入不正确");
                      } else {
                        fetchSignin(_mailController.text, _passwordController.text).then((response) {
                          if (response.errorCode == 0) {
                            showToast('注册成功');
                            Navigator.pop(context, {'mail':_mailController.text, 'password':_passwordController.text});
                          } else {
                            showToast(response.errorMsg);
                          }
                        });
                      }
                    },
                  ),
                ),
              ),
            ),
          ],
        )
    );
  }
}