import 'package:flutter/material.dart';

class BookCell extends StatelessWidget {
  final String title;
  final String content;
  const BookCell({this.title, this.content});
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 2, // 20%
            child: Container(
              padding: EdgeInsets.all(3),
              child: Image.asset('assets/book.png'),
              ),
          ),
          Expanded(
            flex: 7, // 70%
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
            //图书标题
            //出版社，作者
              children: <Widget>[
                Text(
                  '$title',
                  maxLines: 1,
                  textAlign: TextAlign.left,
                  style: new TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '$content',
                  maxLines: 1,
                  textAlign: TextAlign.left,
                  style: new TextStyle(
                        fontSize: 13.0,
                        color: Colors.black38,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1, // 10%
            child: Text(
              '未读',
            ),
          )
        ],
      ),
    );
  }
}