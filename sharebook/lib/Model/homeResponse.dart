import 'enumeration.dart';

class HomeListResponse {
  HomeListResponse({this.response});
  final Map<String, dynamic> response;
  
  List convertToModel() {
    var content = response['list'] as List;
    var result = List();
    for (var item in content) {
        result.add(HomeResponse.fromJson(item));
      }
      return result;
  }
}

  class HomeResponse {
    //封面下载地址
  final String imageURL;

  //标题
  final String title;

  //内容
  final String content;

  //isbn
  final String isbn;

  //阅读状态
  final ReadType type;

  HomeResponse({this.imageURL, this.title, this.content, this.isbn, this.type});
  factory HomeResponse.fromJson(Map<String, dynamic> json) {
      return HomeResponse(
        imageURL: json['url'],
        title: json['title'],
        content: json['content'],
        isbn: json['isbn'],
        type: json['type'],
      );
    }
  }