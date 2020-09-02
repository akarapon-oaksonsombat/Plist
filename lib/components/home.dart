import 'package:flutter/material.dart';
import 'globals.dart' as globals;
import 'tile_builder.dart';
import 'add.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 120.0,
              floating: false,
              pinned: false,
              backgroundColor: Colors.white,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.fromLTRB(32, 0, 0, 0),
                title: Text("My List", style: globals.headText[globals.theme]),
              ),
            ),
          ];
        },
        body: ListView.builder(
            itemCount: globals.getLength() - 7,
            itemBuilder: (BuildContext context, int index) {
              return tileBuilder(index, context);
            }),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(131, 136, 156, 1),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Add()),
          );
        },
        // elevation: 0.0,
        child: Icon(Icons.add),
      ), //
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
