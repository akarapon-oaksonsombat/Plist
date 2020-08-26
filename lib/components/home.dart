import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterexam/components/detail.dart';
import 'add.dart';
import 'globals.dart' as globals;

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _build() {
    int i = 0;
    List<ListTile> list = List();
    while (i < globals.get_index()) {
      Tile(i);
    }
  }

  @override
  Widget build(BuildContext context) {
    globals.init();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My List',
        ),
      ),
      body: ListView.builder(
          itemCount: globals.get_index(),
          itemBuilder: (BuildContext context, int index) {
            return new Tile(index);
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Add()),
          );
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class Tile extends StatelessWidget {
  Tile(this.index);
  final int index;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        globals.get_name(index),
        style: TextStyle(fontSize: 18),
      ),
      trailing: Text(
        globals.get_point(index),
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Detail(
                    index: this.index,
                  )),
        );
      },
    );
    ;
  }
}
