import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  var titles;
  var bodys;
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new DefaultTabController(
        length: titles.length,
        child: new Scaffold(
          appBar: new PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: new Container(
              color: Colors.grey[100],
              child: new SafeArea(
                child: Column(
                  children: <Widget>[
                    new Expanded(child: new Container()),
                    new TabBar(
                      indicatorColor: Colors.black,
                      labelColor:  Colors.black,
                      unselectedLabelColor: Colors.black26,
                      indicatorWeight: 3.0,
                      indicatorPadding: new EdgeInsets.only(bottom: 3.0),
                      labelPadding: new EdgeInsets.only(bottom: 10.0),
                      indicatorSize: TabBarIndicatorSize.label,
                      tabs: titles,
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: new TabBarView(
            children: bodys
          ),
        ),
      ),
    );
  }
}

// class Choice {
//   const Choice({ this.title});
//   final String title;
// }

//  List<Choice> choices;

//下部内容
// class ChoiceCard extends StatelessWidget {
//   const ChoiceCard({ Key key, this.choice }) : super(key: key);

//   final Choice choice;

//   @override
//   Widget build(BuildContext context) {
//     final TextStyle textStyle = Theme.of(context).textTheme.display1;
//     return new Card(
//       color: Colors.white,
//       child: new Center(
//         child: new Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             new Icon(choice.icon, size: 128.0, color: textStyle.color),
//             new Text(choice.title, style: textStyle),
//           ],
//         ),
//       ),
//     );
//   }
// }