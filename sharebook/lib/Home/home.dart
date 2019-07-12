import 'package:flutter/material.dart';
import '../Component/cell.dart';
import '../Detail/detail.dart';
import '../Model/homeResponse.dart';
import '../Model/enumeration.dart';
import '../Scan/scan.dart';
import '../Network/networl.dart';

class HomeController extends StatefulWidget {
  @override
  HomeState createState() => new HomeState();
}

class HomeState extends State<HomeController> {  
  Future<HomeListResponse> _post;
  @override
  void initState() {
    super.initState();
    _post = fetchBookList();
    
  }
  @override
  Widget build(BuildContext context) {
     return new LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
             return MaterialApp(
                title: 'Share Book',
                theme: ThemeData(
                  primarySwatch: Colors.blue,
                  platform: TargetPlatform.iOS,
                ),
                home: Scaffold(
                  appBar: AppBar(
                    title: Text('书宝宝的窝'),
                    actions: <Widget>[
                      Builder(
                        builder: (context) => IconButton(
                            icon: Icon(
                            Icons.add
                            ),
                            onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => 
                                ScanController()
                                ),
                              ).then((value){
                                  Map result = value;
                                  if (result['reloadData']) {
                                    _post = fetchBookList();
                                  }
                              });  
                            }
                        ),
                      ),
                    ],
                  ),
                  body: FutureBuilder<HomeListResponse> (
                    future: _post,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        HomeListResponse response =snapshot.data;
                        List list = response.convertToModel();
                        return ListView.separated(
                        shrinkWrap: true, 
                        itemCount: list.length,
                        separatorBuilder: (BuildContext context, int index) => new Divider(), 
                        itemBuilder: (context, index) {
                          return new InkWell(
                            child: BookCell(
                              model: list[index],
                            ),
                            onTap: (){
                              //跳转详情页
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => 
                                DetailController(
                                  barcode: '9787540488789'//list[index].isbn
                                )),
                              );                 
                            },
                          );//BookCell();
                        },
                      );
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }
                      return CircularProgressIndicator();
                    }
                  ),
                ),
              ); 
          },
     );
  }
}