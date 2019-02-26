import 'package:flutter/material.dart';
import '../Component/information.dart';
import '../Network/networl.dart';

class DetailController extends StatelessWidget {
  final String barcode;
  
  const DetailController({this.barcode});

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(''),
        ),
        body: BookInformation(
        post: fetchBookDetail(this.barcode),
      ),
    );
  }  
}
