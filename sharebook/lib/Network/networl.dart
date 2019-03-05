import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';

import 'api.dart';
import '../Model/detailResponse.dart';
import '../Model/baseResponse.dart';
import '../Model/loginResponse.dart';

 Map<String,String> headers = {'content-type': 'application/x-www-form-urlencoded'};
/**  
 * 
 * 获取图书详情
 * 
*/
Future<DetailResponse> fetchBookDetail(String isbn) async {
  var url = DoubanAPI.host+DoubanAPI.detail+isbn;
  final response = await http.get('$url');

  if (response.statusCode == 200) {
    return DetailResponse.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load post');
  }
}

/** 
 * 
 * 注册
 * 
 */
Future<BaseResponse> fetchSignin(String mail, String password) async {
  var url = API.host+API.signin;
  var body = {mail:mail ,password:password};
  
  final response = await http.post(url, body:body);

  if (response.statusCode == 200) {
    return BaseResponse.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load post');
  }
}

/** 
 * 
 * 登录
 * 
 */
Future<LoginResponse> fetchLogin(String mail, String password) async {
  var url = API.host+API.login;
  var body = {"mail": mail,  "password": password};
  final response = await http.post(Uri.parse(url), headers: headers, body: body);
  if (response.statusCode == 200) {
    print(response.body);
    print(json.decode(response.body));
    return LoginResponse.fromJson(json.decode(response.body));
  } else {
    return LoginResponse(
      errorCode: -1,
      errorMsg: '登录失败',
      uid: ''
    );
  }
}

/** 
 * 
 * 获取图书列表
 * 
 */