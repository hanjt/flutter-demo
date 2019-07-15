import 'package:flutter/material.dart';
import '../Model/detailResponse.dart';
import 'toast.dart';

class BookInformation extends StatelessWidget {
  DetailBookResponse response;
  final Future<DetailResponse> post;
  BookInformation({this.post});  
  @override
  Widget build(BuildContext context) {
    return new LayoutBuilder(
            builder: (BuildContext context, BoxConstraints viewportConstraints) {
              return SingleChildScrollView(
                child: FutureBuilder<DetailResponse>(
                    future: this.post,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.data.errorCode != -1) {
                          response = snapshot.data.book();
                          return new Column(
                          children: <Widget>[
                            Row (
                              children: <Widget>[
                                Expanded(
                                  flex: 4, // 40%
                                  child: Container(
                                    padding: EdgeInsets.all(20),
                                    child: Image.network(
                                      response.imageURL
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 6, // 40%
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        Text(
                                          '书名：${response.title}',
                                          maxLines: 3,
                                          textAlign: TextAlign.left,
                                          style: new TextStyle(
                                                fontSize: 14.0,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          '作者：${response.author}'
                                        ),
                                        Text(
                                          '出版社：${response.publisher}'
                                        ),
                                        Text(
                                          '出版年：${response.pubDate}'
                                        ),
                                        Text(
                                          '定价：${response.price}'
                                        ),
                                        Text(
                                          '装帧：${response.binding}'
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container (
                              padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Text(
                                    '内容简介：',
                                    textAlign: TextAlign.left,
                                          style: new TextStyle(
                                                fontSize: 14.0,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                          ),
                                  ),
                                  Text(
                                    '${response.summary}'
                                  ),
                                ],
                              )
                            ),
                          ],
                        );
                        } else {
                          showToast('${snapshot.data.errorMsg}');
                          return Text('');
                        }
                      } else if (snapshot.hasError) {
                        showToast('${snapshot.error}');
                        return Text('');
                      } 
                      return Container(
                        color: Colors.green.withOpacity(0.3),
                        width: MediaQuery.of(context).size.width,//70.0,
                        height: MediaQuery.of(context).size.height, //70.0,
                        child: new Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: new Center(child: new CircularProgressIndicator())),
                      );
                    },
                  ),
                );
            },
          );
  }
}