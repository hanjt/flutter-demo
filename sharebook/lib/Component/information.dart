import 'package:flutter/material.dart';
import '../Model/detailResponse.dart';
import 'toast.dart';

class BookInformation extends StatelessWidget {
  final Future<DetailResponse> post;
  const BookInformation({this.post});  
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
                          return new Column(
                          children: <Widget>[
                            Row (
                              children: <Widget>[
                                Expanded(
                                  flex: 4, // 40%
                                  child: Container(
                                    padding: EdgeInsets.all(20),
                                    child: Image.network(
                                      snapshot.data.imageURL
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
                                          '书名：${snapshot.data.title}',
                                          maxLines: 1,
                                          textAlign: TextAlign.left,
                                          style: new TextStyle(
                                                fontSize: 14.0,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          '作者：${snapshot.data.author.join(',')}'
                                        ),
                                        Text(
                                          '出版社：${snapshot.data.publisher}'
                                        ),
                                        Text(
                                          '副标题：${snapshot.data.subTitle}'
                                        ),
                                        Text(
                                          '原作名：${snapshot.data.originTitle}'
                                        ),
                                        Text(
                                          '译者：${snapshot.data.translator.join('/')}'
                                        ),
                                        Text(
                                          '出版年：${snapshot.data.pubDate}'
                                        ),
                                        Text(
                                          '页数：${snapshot.data.pages}'
                                        ),
                                        Text(
                                          '定价：${snapshot.data.price}'
                                        ),
                                        Text(
                                          '装帧：${snapshot.data.binding}'
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
                                    '${snapshot.data.summary}'
                                  ),
                                ],
                              )
                            ),
                          ],
                        );
                        } else {
                          // showToast(snapshot.data.errorMsg);
                          return Text('${snapshot.data.errorMsg}');
                        }
                      } else if (snapshot.hasError) {
                        // showToast(snapshot.error);
                        return Text('${snapshot.error}');
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