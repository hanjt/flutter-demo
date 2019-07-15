// import 'enumeration.dart';
import 'dart:convert';

class DetailResponse {
  final int errorCode;
  final String errorMsg;

  //图书
  final List booksJson;
  
  DetailResponse({
    this.errorCode,
    this.errorMsg,
    this.booksJson
    });

  DetailBookResponse book() {
    return this.booksJson.map((m) => new DetailBookResponse.fromJson(m)).toList().first;
  }

  factory DetailResponse.fromJson(Map<String, dynamic> reponse) {
      return DetailResponse(
        booksJson: reponse['result']['books']
      );
    }
}

class DetailBookResponse {

  //作者
  final String author;
  
  //副标题
  // final String subTitle;

  //出版日期
  final String pubDate;

  //标题
  final String title;

  //封面图片
  final String imageURL;

  //包装类型
  final String binding;

  //出版社
  final String publisher;

  //概述
  final String summary;

  //售价
  final String price;
  
  DetailBookResponse({
    this.author, 
    this.pubDate, 
    this.title, 
    this.imageURL,
    this.binding,
    this.publisher,
    this.summary,
    this.price,
    });
  factory DetailBookResponse.fromJson(Map<String, dynamic> json) {
      return DetailBookResponse(
        author: json['author'],
        pubDate: json['publictime'],
        title: json['name'],
        imageURL: json['img'],
        binding: json['size'],
        publisher: json['press'],
        summary: json['desc'],
        price: json['price'],
      );
    }
}
