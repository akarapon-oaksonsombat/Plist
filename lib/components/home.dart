import 'package:flutter/material.dart';
import 'globals.dart' as globals;
import 'sliver_components.dart';
import 'tile_builder.dart';
import 'add.dart';
import 'package:animations/animations.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: globals.backgroundColor[globals.theme],
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 100.0,
              // floating: true,
              // pinned: true,
              iconTheme: IconThemeData(color: globals.headColor[globals.theme]),
              actions: [
                IconButton(
                    icon: Icon(Icons.brightness_2),
                    onPressed: () {
                      setState(() {
                        if (globals.theme == 1)
                          globals.theme = 0;
                        else
                          globals.theme = 1;
                      });
                    })
              ],
              backgroundColor: globals.backgroundColor[globals.theme],
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
        backgroundColor: globals.accentColor[globals.theme],
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Add()),
          );
        },
        // elevation: 0.0,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ), //

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
