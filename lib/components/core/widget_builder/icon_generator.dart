library icongenerator;
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import '../globals.dart' as globals;

brightness(){
  if(globals.theme.isLight){
    return EvaIcons.moon;
  }else{
    return EvaIcons.sun;
  }
}