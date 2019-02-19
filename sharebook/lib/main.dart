import 'package:flutter/material.dart';
import 'Home/home.dart';
import 'Model/enumeration.dart';
import 'Model/homeResponse.dart';

void main() => runApp(ShareBookApp());
// void main(List<String> args) {
//   HomeListResponse response = new HomeListResponse(
//     response: book
//   );
//   var list = response.convertToModel();
//   print('list is $list');
//   for (var item in list) {
//     print('result $item');
//   }
// }

// Map<String, dynamic> book = {'list':[
//   {'url': 'http://www.baidu.com','title': '我是标题', 'content': '我是内容', 'isbn': '123456', 'type': ReadType.noRead},
//   {'url': 'http://www.baidu.com','title': '我是标题', 'content': '我是内容', 'isbn': '123456', 'type': ReadType.noRead}
//    ]};