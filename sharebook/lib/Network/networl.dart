import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'api.dart';
import '../Model/detailResponse.dart';
import '../Model/baseResponse.dart';
import '../Model/loginResponse.dart';
import '../Component/localCacher.dart';
import '../Model/homeResponse.dart';

 Map<String,String> headers = {'content-type': 'application/x-www-form-urlencoded'};
/**  
 * 
 * 获取图书详情
 * 
*/
Future<DetailResponse> fetchBookDetail(String isbn) async {
  final response = await http.get(DoubanAPI.host+DoubanAPI.detail+isbn);

  if (response.statusCode == 200) {
    return DetailResponse.fromJson(json.decode(response.body));
  } else {
    return DetailResponse(
        errorCode: -1,
        errorMsg: response.reasonPhrase
    );
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
    LoginResponse result = LoginResponse.fromJson(json.decode(response.body));
    saveUid(result.uid);
    return result;
  } else {
    return LoginResponse(
      errorCode: -1,
      errorMsg: response.reasonPhrase,
      uid: ''
    );
  }
}

/** 
 * 
 * 获取图书列表
 * 
 */
Future<HomeListResponse> fetchBookList() async {
  var url = API.host+API.list;
  var uid = await findUid();
  final response = await http.get(url, headers: {'uid':uid});
  if (response.statusCode == 200) {
    return HomeListResponse.fromJson(json.decode(response.body));
  } else {
    return HomeListResponse(
      errorCode: -1,
      errorMsg: response.reasonPhrase,
      originList: []
    );
  }
}