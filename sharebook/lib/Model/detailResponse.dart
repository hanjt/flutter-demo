// import 'enumeration.dart';

class DetailResponse {
  final int errorCode;
  final String errorMsg;

  //作者
  final List<dynamic> author;
  
  //副标题
  final String subTitle;

  //出版日期
  final String pubDate;

  //标题
  final String title;

  //封面图片
  final String imageURL;

  //包装类型
  final String binding;

  //翻译
  final List<dynamic> translator;

  //页数
  final String pages;

  //豆瓣链接
  final String doubanURL;

  //出版社
  final String publisher;

  //原作名
  final String originTitle;

  //概述
  final String summary;

  //售价
  final String price;
  
  DetailResponse({
    this.errorCode,
    this.errorMsg,
    this.author, 
    this.subTitle, 
    this.pubDate, 
    this.title, 
    this.imageURL,
    this.binding,
    this.translator,
    this.pages,
    this.doubanURL,
    this.publisher,
    this.originTitle,
    this.summary,
    this.price,
    });
  factory DetailResponse.fromJson(Map<String, dynamic> json) {
      return DetailResponse(
        author: json['author'],
        subTitle: json['subtitle'],
        pubDate: json['pubdate'],
        title: json['title'],
        imageURL: json['image'],
        binding: json['binding'],
        translator: json['translator'],
        pages: json['pages'],
        doubanURL: json['alt'],
        publisher: json['publisher'],
        originTitle: json['alt_title'],
        summary: json['summary'],
        price: json['price'],
      );
    }
}