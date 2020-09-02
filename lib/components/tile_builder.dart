library tile_builder;

import 'package:flutter/material.dart';
import 'detail.dart';
import 'globals.dart' as globals;

Widget tileBuilder(int index, BuildContext context) {
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
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Detail(
                      index: index,
                    )),
          );
        },
      ),
    ),
  );
}
