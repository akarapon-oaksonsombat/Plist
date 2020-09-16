library topthreebuilder;

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../globals.dart' as globals;

String _sub;

IconData medal (int rank){
  if(rank == 1){
    return EvaIcons.star;
  }else if(rank == 2){
    return EvaIcons.award;
  }else if(rank == 3){
    return EvaIcons.award;
  }else return null;
}
Color rankThumbnailColor (int index){
  if(globals.getRank(index) == 1){
    return globals.theme.dynamicCardAltColor(8);
  }else if(globals.getRank(index)  == 2){
    if(globals.theme.isLight){
      return Color.fromRGBO(199, 199, 201, 1.0);
    }else{
      return Color.fromRGBO(141, 141, 147, 1.0);
    }
  }else if(globals.getRank(index)  == 3){
    return globals.theme.dynamicCardAltColor(4);
  }else return globals.theme.dynamicCardAltColor(index);
}
Color rankIconColor (int index){
  if(globals.getRank(index)  == 1){
    return globals.theme.dynamicCardIconColor(8);
  }else if(globals.getRank(index)  == 2){
    return Colors.black;
  }else if(globals.getRank(index)  == 3){
    return globals.theme.dynamicCardIconColor(4);
  }else return globals.theme.dynamicCardIconColor(index);
}
Widget topThreeBuilder(int index, BuildContext context) {
  if(globals.hasData(index+1)){
    int dif = globals.getPoint(index) - globals.getPoint(index+1);
    _sub = globals.getName(index+1) + ' with ' + dif.toString() + ' point(s) behind.';
  }else{
    _sub = 'No one behind.';
  }
  if(index < 3){

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16,8),
      child: Container(

        decoration: BoxDecoration(
          color: globals.theme.dynamicCardColor(),
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
            globals.getRank(index).toString() +' Runner Up',
            style: TextStyle(fontWeight: FontWeight.bold, color: globals.theme.dynamicTitleColor()),
            // style: globals.titleText[globals.theme],
          ),
          leading: Container(
            height: 44,
            width: 44,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: rankThumbnailColor(index),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            alignment: Alignment.center,
            child: Icon(medal(globals.getRank(index)), color: rankIconColor(index),),
            // child: Text(globals.getRank(index).toString(), style: TextStyle(fontWeight: FontWeight.bold, color: globals.theme.getCardContentColor(index)),),
          ),
          subtitle: Text(
            _sub,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: globals.theme.dynamicSubtitleColor()),
          ),
        ),
      ),
    );
  }else{
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16,8),
      child: Container(

        decoration: BoxDecoration(
          color: globals.theme.dynamicCardColor(),
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
            globals.getRank(index).toString() +' Runner Up',
            style: TextStyle(fontWeight: FontWeight.bold, color: globals.theme.dynamicTitleColor()),
            // style: globals.titleText[globals.theme],
          ),
          leading: Container(
            height: 44,
            width: 44,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: rankThumbnailColor(index),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            alignment: Alignment.center,
            child: Icon(EvaIcons.person, color: rankIconColor(index),),
            // child: Text(globals.getRank(index).toString(), style: TextStyle(fontWeight: FontWeight.bold, color: globals.theme.getCardContentColor(index)),),
          ),
          subtitle: Text(
            _sub,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: globals.theme.dynamicSubtitleColor()),
          ),
        ),
      ),
    );
  }
}
