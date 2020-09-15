library tile_builder;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../detail.dart';
import '../objects/globals.dart' as globals;
import 'package:animations/animations.dart';

Widget nextPersonTileBuilder(int index, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(16, 8, 16,8),
    child: Container(

      decoration: BoxDecoration(
        color: globals.theme.getCardColor(),
        // shape: BoxShape.rectangle,
        // boxShadow: [
        //   BoxShadow(
        //     color: globals.shadowColor,
        //     // color: Colors.grey.withOpacity(0.1),
        //     spreadRadius: 1,
        //     blurRadius: 5,
        //     // offset: Offset(0, 3), // changes position of shadow
        //   ),
        // ],
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: ListTile(
        title: Text(
          'Next Person',
          style: TextStyle(fontWeight: FontWeight.bold, color: globals.theme.getSubtitleColor()),
          // style: globals.titleText[globals.theme],
        ),
        leading: Container(
          height: 44,
          width: 44,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: globals.theme.getCardAltColor(index),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          alignment: Alignment.center,
          child: Icon(Icons.arrow_forward_ios, color: globals.theme.getCardIconColor(index),),
          // child: Text(globals.getRank(index).toString(), style: TextStyle(fontWeight: FontWeight.bold, color: globals.theme.getCardContentColor(index)),),
        ),
        // subtitle: Text(
        //   index.toString(),
        //   style: globals.subtitleText[globals.theme],
        // ),
        subtitle: Text(
          globals.getName(index)+' with '+globals.getPoint(index).toString(),
          style: TextStyle(fontWeight: FontWeight.bold, color: globals.theme.getCardContentColor(index)),
        ),
        // trailing: Text(
        //   globals.getPoint(index),
        //   style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold, color: globals.theme.getCardContentColor(index)),
        // ),
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
                return Detail(index: index,);
              },
            ),
          );
        },
      ),
    ),
  );
}
