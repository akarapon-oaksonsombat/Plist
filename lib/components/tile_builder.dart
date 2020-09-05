library tile_builder;

import 'package:flutter/material.dart';
import 'detail.dart';
import 'globals.dart' as globals;
import 'package:animations/animations.dart';

Widget tileBuilder(int index, BuildContext context) {
  return Padding(
    padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
    child: Container(
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
      child: ListTile(
        title: Text(
          globals.getName(index),
          style: globals.titleText[globals.theme],
        ),
        subtitle: Text(
          index.toString(),
          style: globals.subtitleText[globals.theme],
        ),
        trailing: Text(
          globals.getPoint(index),
          style: globals.titleText[globals.theme],
        ),
        onTap: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //       builder: (context) => Detail(
          //             index: index,
          //           )),
          // );
          Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (BuildContext context) {
                return Detail(
                  index: index,
                );
              },
            ),
          );
        },
      ),
    ),
  );
}

Widget otileBuilder(int index, BuildContext context) {
  return Padding(
    padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
    child: Container(
      decoration: BoxDecoration(
        color: globals.tileColor[globals.theme],
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: ListTile(
        title: Text(
          globals.getName(index),
          style: globals.titleText[globals.theme],
        ),
        subtitle: Text(
          index.toString(),
          style: globals.subtitleText[globals.theme],
        ),
        trailing: Text(
          globals.getPoint(index),
          style: globals.titleText[globals.theme],
        ),
        onTap: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //       builder: (context) => Detail(
          //             index: index,
          //           )),
          // );
          Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (BuildContext context) {
                return Detail(
                  index: index,
                );
              },
            ),
          );
        },
      ),
    ),
  );
}
