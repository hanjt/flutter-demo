import 'package:flutter/material.dart';

class NavigationBar extends StatelessWidget {
  // var titles = [Text('发现'), Text('推荐'), Text('日报')];
  // var bodys = [Text('发现内容'), Text('推荐内容'), Text('日报内容')];
  const NavigationBar({
    this.titles,
    this.bodys,
  });
  final List<Widget> titles;
  final List<Widget> bodys;
  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
        length: titles.length,
        child: new Scaffold(
          appBar: new PreferredSize(
            // preferredSize: Size.fromHeight(kToolbarHeight),
            preferredSize: new Size(MediaQuery.of(context).size.width - 64, 64),
            child: new Container(
              color: Colors.grey[100],
              child: new SafeArea(
                child: new Row (
                  children: <Widget>[
                    Expanded (
                      child: Container(
                      ),
                    ),
                    Expanded (
                      child: Container(
                        child: TabBar(
                            indicatorColor: Colors.black,
                            labelColor:  Colors.black,
                            unselectedLabelColor: Colors.black26,
                            indicatorWeight: 3.0,
                            indicatorPadding: new EdgeInsets.only(top: 25.0),
                            labelPadding: new EdgeInsets.only(top: 20.0),
                            indicatorSize: TabBarIndicatorSize.label,
                            tabs: titles,
                            ),
                      ),
                    ),
                    Expanded (
                      child: Container(
                        padding: new EdgeInsets.only(top: 20.0, left: 70.0),
                        child: IconButton(
                        icon: Icon(Icons.search),
                        highlightColor: Color(0x00000000),
                        splashColor: Color(0x00000000),
                        disabledColor: Color(0x00000000),
                        onPressed: () {
                          
                        },
                      ),
                      ),
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