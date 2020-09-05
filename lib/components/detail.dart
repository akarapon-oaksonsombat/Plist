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
        backgroundColor: globals.backgroundColor[globals.theme],
        appBar: AppBar(
          iconTheme: IconThemeData(color: globals.headColor[globals.theme]),
          backgroundColor: globals.backgroundColor[globals.theme],
          elevation: 0.0,
          title: Text(
            'Detail',
            style: TextStyle(color: globals.headColor[globals.theme]),
          ),
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
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 120,
                  // height: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: globals.tileColor[globals.theme],
                    shape: BoxShape.rectangle,
                    boxShadow: [
                      BoxShadow(
                        color: globals.shadowColor,
                        // color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 5,
                        // offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    // borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          globals.getPoint(index),
                          style: TextStyle(
                              fontSize: 34,
                              fontWeight: FontWeight.bold,
                              color: globals.headColor[globals.theme]),
                        ),
                        Text(
                          globals.getName(index),
                          style: TextStyle(
                              fontSize: 34,
                              fontWeight: FontWeight.bold,
                              color: globals.headColor[globals.theme]),
                        ),
                      ],
                    ),
                  )),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 90,
                  // height: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: globals.tileColor[globals.theme],
                    shape: BoxShape.rectangle,
                    boxShadow: [
                      BoxShadow(
                        color: globals.shadowColor,
                        // color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 5,
                        // offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          globals.getPoint(index),
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: globals.headColor[globals.theme]),
                        ),
                        Text(
                          globals.getName(index),
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: globals.headColor[globals.theme]),
                        ),
                      ],
                    ),
                  )),
            ),
          ],
        ));
  }
}
