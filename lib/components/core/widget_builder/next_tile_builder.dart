library tile_builder;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../detail.dart';
import '../globals.dart' as globals;

Widget nextPersonTileBuilder(int index, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(16, 8, 16,8),
    child: Container(

      decoration: BoxDecoration(
        color: globals.theme.dynamicCardColor(),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: ListTile(
        title: Text(
          'Next Person',
          style: TextStyle(fontWeight: FontWeight.bold, color: globals.theme.dynamicSubtitleColor()),
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
          child: Icon(Icons.arrow_forward_ios, color: globals.theme.dynamicCardIconColor(index),),
        ),
        subtitle: Text(
          globals.getName(index)+' with '+globals.getPoint(index).toString(),
          style: TextStyle(fontWeight: FontWeight.bold, color: globals.theme.dynamicCardContentColor(index)),
        ),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (BuildContext context) {
                return Detail(index: index,);
              },
            ),
          );
        },
      ),
    ),
  );
}
