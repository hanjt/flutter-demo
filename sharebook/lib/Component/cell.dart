import 'package:flutter/material.dart';
import '../Model/homeResponse.dart';

class BookCell extends StatelessWidget {
  final HomeResponse model;
  const BookCell({this.model});
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 2, // 20%
            child: Container(
              padding: EdgeInsets.all(3),
              child: FadeInImage.assetNetwork(
                    placeholder: 'assets/book.png',
                    image: this.model.imageURL,//Image.asset('assets/book.png'),
              ),
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
                  '${this.model.title}',
                  maxLines: 1,
                  textAlign: TextAlign.left,
                  style: new TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${this.model.author}/${this.model.publisher}/${this.model.pubDate}出版/${this.model.binding}',
                  maxLines: 2,
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