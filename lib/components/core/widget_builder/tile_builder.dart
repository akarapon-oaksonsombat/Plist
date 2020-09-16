library tile_builder;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../detail.dart';
import '../globals.dart' as globals;

Widget tileBuilder(int index, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(16, 8, 16,8),
    child: Container(
      height: 100.0,
      decoration: BoxDecoration(
        color: globals.theme.dynamicCardColor(),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: ListTile(
        title: Text(
          globals.getName(index),
          style: TextStyle(fontWeight: FontWeight.bold, color: globals.theme.dynamicTitleColor()),
        ),
        leading: Container(
          height: 44,
          width: 44,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: globals.theme.dynamicCardAltColor(index),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          alignment: Alignment.center,
          child: Text(globals.getRank(index).toString(), style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold, color: globals.theme.dynamicCardIconColor(index)),),
        ),

        subtitle: Text(
          'Tap to see detail',
          style: TextStyle(fontSize: 12, color: globals.theme.dynamicSubtitleColor()),
        ),

        trailing: Text(
          globals.getPoint(index).toString(),
          style: TextStyle(fontWeight: FontWeight.bold, color: globals.theme.dynamicCardContentColor(index)),
        ),
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) {
            return Detail(index: index,);
          }));
        },
      ),
    ),
  );
}
