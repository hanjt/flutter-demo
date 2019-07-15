class HomeListResponse {
  final List originList;
  final int errorCode;
  final String errorMsg;
  HomeListResponse({this.originList, this.errorCode, this.errorMsg});
  
  factory HomeListResponse.fromJson(Map<String, dynamic> json) {
    return HomeListResponse(
      errorCode: json['error_code'],
      errorMsg: json['error_msg'],
      originList: json['data']['list'],
    );
  }
  
  List convertToModel() {
    var result = List();
    for (var item in originList) {
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

  //作者
  final String author;

  //出版社
  final String publisher;

  //出版年份
  final String pubDate;

  //装订类型
  final String binding;

  //isbn
  final String isbn;

  //阅读状态
  final bool type;

  HomeResponse({this.imageURL, this.title, this.author, this.publisher, this.pubDate, this.binding, this.isbn, this.type});
  factory HomeResponse.fromJson(Map<String, dynamic> json) {
      return HomeResponse(
        imageURL:   json['image'],
        title:      json['title'],
        author:     json['author'],
        publisher:  json['publisher'],
        pubDate:    json['pub_date'],
        binding:    json['binding'],
        isbn:       json['isbn'],
        type:       json['read_type'],
      );
    }
  }