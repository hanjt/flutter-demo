class Daily {
  // final int userId;
  // final int id;
  // final String title;
  // final String body;

  // Daily({this.userId, this.id, this.title, this.body});

  // factory Daily.fromJson(Map<String, dynamic> json) {
  //   return Daily(
  //     userId: json['userId'],
  //     id: json['id'],
  //     title: json['title'],
  //     body: json['body'],
  //   );
  // }
  final String type;
  final DailyData data;
  final String tag;
  final int id;
  final int adIndex;

  Daily({this.type, this.data, this.tag, this.id, this.adIndex});
   factory Daily.fromJson(Map<String, dynamic> json) {
    return Daily(
      type: json['type'],
      data: json['data'],
      tag: json['tag'],
      id: json['id'],
      adIndex: json['adIndex'],
    );
  }
}

class DailyData {
  // final String dataType;
  // final int id;
  // final String type;
  // final String text;
  // final String subTitle;
  // final String 
  // DailyData({this.type, this.id, this.tag, this.id, this.adIndex});
}