library plisto_builder;

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plisto/components/core/plisto_core.dart';
import 'package:plisto/components/core/plisto_theme.dart';
import 'package:plisto/components/detail.dart';

class PlistoBuilder{
  static Widget tile(int index, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16,8),
      child: Container(
        // height: 100.0,
        decoration: BoxDecoration(
          color: PlistoDynamic.cardBackground(),
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        child: ListTile(
          title: Text(
            PlistoCore.getName(index),
            style: TextStyle(fontWeight: FontWeight.bold, color: PlistoDynamic.title()),
          ),
          leading: AspectRatio(
            aspectRatio: 1/1,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: PlistoDynamic.alt(index),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              alignment: Alignment.center,
              child: Text(PlistoCore.getRank(index).toString(), style: TextStyle(fontSize: 17*MediaQuery.of(context).textScaleFactor,fontWeight: FontWeight.bold, color: PlistoDynamic.icon(index)),),
            ),
          ),

          subtitle: Text(
            'Tap to see detail',
            style: TextStyle(fontSize: 15*MediaQuery.of(context).textScaleFactor, color: PlistoDynamic.subtitle()),
          ),

          trailing: Text(
            PlistoCore.getPoint(index).toString(),
            style: TextStyle(fontWeight: FontWeight.bold, color: PlistoDynamic.primary()),
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
  static IconData _medalIcon (int rank){
    if(rank == 1){
      return EvaIcons.star;
    }else if(rank == 2){
      return EvaIcons.award;
    }else if(rank == 3){
      return EvaIcons.award;
    }else return null;
  }
  static Color _rankThumbnailColor (int index){
    if(PlistoCore.getRank(index) == 1){
      return PlistoDynamic.alt(8);
    }else if(PlistoCore.getRank(index)  == 2){
      if(PlistoDynamic.getBrightness()){
        return Color.fromRGBO(199, 199, 201, 1.0);
      }else{
        return Color.fromRGBO(141, 141, 147, 1.0);
      }
    }else if(PlistoCore.getRank(index)  == 3){
      return PlistoDynamic.alt(4);
    }else return PlistoDynamic.alt(index);
  }
  static Color _rankIconColor (int index){
    if(PlistoCore.getRank(index)  == 1){
      return PlistoDynamic.icon(8);
    }else if(PlistoCore.getRank(index)  == 2){
      return Colors.black;
    }else if(PlistoCore.getRank(index)  == 3){
      return PlistoDynamic.icon(4);
    }else return PlistoDynamic.icon(index);
  }
  static Widget rank(int index, BuildContext context){
    String _sub;
    if(PlistoCore.hasData(index+1)){
      int dif = PlistoCore.getPoint(index) - PlistoCore.getPoint(index+1);
      _sub = PlistoCore.getName(index+1) + ' with ' + dif.toString() + ' point(s) behind.';
    }else{
      _sub = 'No one behind.';
    }
    if(index < 3){

      return Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16,8),
        child: Container(
          decoration: BoxDecoration(
            color: PlistoDynamic.cardBackground(),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          child: ListTile(
            title: Text(
              PlistoCore.getRank(index).toString() +' Runner Up',
              style: TextStyle(fontWeight: FontWeight.bold, color: PlistoDynamic.title()),
              // style: globals.titleText[globals.theme],
            ),
            leading: Container(
              height: 44,
              width: 44,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: _rankThumbnailColor(index),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              alignment: Alignment.center,
              child: Icon(_medalIcon(PlistoCore.getRank(index)), color: _rankIconColor(index),),
              // child: Text(globals.getRank(index).toString(), style: TextStyle(fontWeight: FontWeight.bold, color: globals.theme.getCardContentColor(index)),),
            ),
            subtitle: Text(
              _sub,
              style: TextStyle(fontSize: 15*MediaQuery.of(context).textScaleFactor, fontWeight: FontWeight.bold, color: PlistoDynamic.subtitle()),
            ),
          ),
        ),
      );
    }else{
      return Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16,8),
        child: Container(

          decoration: BoxDecoration(
            color: PlistoDynamic.cardBackground(),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          child: ListTile(
            title: Text(
              PlistoCore.getRank(index).toString() +' Runner Up',
              style: TextStyle(fontWeight: FontWeight.bold, color: PlistoDynamic.title()),
              // style: globals.titleText[globals.theme],
            ),
            leading: AspectRatio(
              aspectRatio: 1/1,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: _rankThumbnailColor(index),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                alignment: Alignment.center,
                child: Icon(EvaIcons.person, color: _rankIconColor(index),),
                // child: Text(globals.getRank(index).toString(), style: TextStyle(fontWeight: FontWeight.bold, color: globals.theme.getCardContentColor(index)),),
              ),
            ),
            subtitle: Text(
              _sub,
              style: TextStyle(fontSize: 15*MediaQuery.of(context).textScaleFactor, fontWeight: FontWeight.bold, color: PlistoDynamic.subtitle()),
            ),
          ),
        ),
      );
    }
  }
  static Widget next(int index, BuildContext context){
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16,8),
      child: Container(

        decoration: BoxDecoration(
          color: PlistoDynamic.cardBackground(),
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        child: ListTile(
          title: Text(
            'Next Person',
            style: TextStyle(fontWeight: FontWeight.bold, color: PlistoDynamic.subtitle()),
          ),
          leading: AspectRatio(
            aspectRatio: 1/1,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: PlistoDynamic.alt(index),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              alignment: Alignment.center,
              child: Icon(Icons.arrow_forward_ios, color: PlistoDynamic.icon(index),),
            ),
          ),
          subtitle: Text(
            PlistoCore.getName(index) + ' with ' + PlistoCore.getPoint(index).toString(),
            style: TextStyle(fontWeight: FontWeight.bold, color: PlistoDynamic.primary()),
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
}


