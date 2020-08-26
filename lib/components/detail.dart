import 'package:flutter/material.dart';
import 'edit.dart';
import 'globals.dart' as globals;

class Detail extends StatefulWidget {
  Detail({Key key, this.index}) : super(key: key);
  final int index;
  @override
  _DetailState createState() => _DetailState(index);
}

class _DetailState extends State<Detail> {
  _DetailState(this.index);
  final int index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Detail'),
          actions: [
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Edit()),
                );
              },
            )
          ],
          //elevation: 0.0,
        ),
        body: Column(
          children: [
            Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width,
                color: Colors.blue[200],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      globals.get_point(index),
                      style:
                          TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      globals.get_name(index),
                      style:
                          TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                    ),
                  ],
                )),
          ],
        ));
  }
}
