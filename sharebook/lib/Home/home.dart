import 'package:flutter/material.dart';
import '../Component/cell.dart';
import '../Detail/detail.dart';
import '../Add/add.dart';

class ShareBookApp extends StatelessWidget {
  //列表中的数据结构
  var list = ListView.separated(
              shrinkWrap: true, 
              itemCount: books.length,
              separatorBuilder: (BuildContext context, int index) => new Divider(), 
              itemBuilder: (context, index) {
                return new InkWell(
                  child: BookCell(
                    title: books[index]['title'],
                    content: books[index]['content'],
                  ),
                  onTap: (){
                    //跳转详情页
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => 
                      DetailController(
                        title: books[index]['title'],
                        content: books[index]['content'],
                      )),
                    );                 
                  },
                );//BookCell();
              },
            );
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Share Book',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('书宝宝的窝'),
          actions: <Widget>[
            //跳转添加页面
            IconButton(
              icon: Icon(
                Icons.add
              ),
              onPressed: () {
                //跳转详情页
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => 
                      DetailController(
                        title: '我是标题',
                        content:  '我是小冰',
                      )),
                    ); 
              },
            )
          ],
        ),
        body: list,
      ),
    );
  }
}

List<Map<String, String>> books = [{'title': '我是标题', 'content': '我是内容'},
    {'title': '我是标题', 'content': '我是内容'},
    {'title': '我是标题', 'content': '我是内容'},
    {'title': '我是标题', 'content': '我是内容'},
    {'title': '我是标题', 'content': '我是内容'},
    {'title': '我是标题', 'content': '我是内容'},
    {'title': '我是标题', 'content': '我是内容'},
    {'title': '我是标题', 'content': '我是内容'},
    {'title': '我是标题', 'content': '我是内容'},
    {'title': '我是标题', 'content': '我是内容'}];