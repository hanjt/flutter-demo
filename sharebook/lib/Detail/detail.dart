import 'package:flutter/material.dart';
import '../Model/detailResponse.dart';

class DetailController extends StatelessWidget {
  final Future<DetailResponse> post;
  final String title;
  
  const DetailController({this.post, this.title});

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('$title'),
        ),
        body: new Center(
          child: FutureBuilder<DetailResponse>(
            future: post,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data.summary);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      );
  }
}
