import 'package:flutter/material.dart';
class DailyCell extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: Column(
        children: <Widget>[
          Container(
              padding: new EdgeInsets.only(bottom: 10),
              child: Image.network(
               'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1550055170639&di=6e0bb0df70ff5962903448a01d12c1fe&imgtype=0&src=http%3A%2F%2Fgss0.baidu.com%2F-4o3dSag_xI4khGko9WTAnF6hhy%2Fzhidao%2Fpic%2Fitem%2F71cf3bc79f3df8dcfd3835c3ca11728b4710285e.jpg',
            ),
          ),
          Row(
            children: <Widget>[
              Container(
                padding: new EdgeInsets.only(right: 10),
                child:Image.network(
                  'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1550058373089&di=de3eab6505fbf867b6bfa5ea34ebbc9a&imgtype=0&src=http%3A%2F%2Fimg.shu163.com%2Fuploadfiles%2Fqq%2Fhead%2F2010%2F91%2F2010102416403975.gif',
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                    Text(
                        '搞笑短片：看！这该死的爱情',
                        textAlign: TextAlign.left,
                        style: new TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                        '开眼搞笑精选 / #搞笑',
                        textAlign: TextAlign.left,
                        style: new TextStyle(
                        fontSize: 13.0,
                        color: Colors.black38,
                      ),
                    ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}