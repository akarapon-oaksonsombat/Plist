library addscreentheme;

import 'package:flutter/material.dart';
import 'package:plisto/components/core/globals.dart' as globals;

Color getDoneButtonColor(){
  if(globals.theme.isLight){
    return globals.theme.lightTheme.card[1].main;
  }else{
    return globals.theme.darkTheme.card[1].alt;
  }
}
Color getAppBarColor(){
  if(globals.theme.isLight){
    return globals.theme.lightTheme.background;
  }else{
    return globals.theme.darkTheme.background;
  }
}
Color getAppBarContentColor(){
  if(globals.theme.isLight){
    return globals.theme.lightTheme.title;
  }else{
    return globals.theme.darkTheme.title;
  }
}
Color getBackgroundColor(){
  if(globals.theme.isLight){
    return globals.theme.lightTheme.background;
  }else{
    return globals.theme.darkTheme.subtitle3;
  }
}
Color getHeadColor(){
  if(globals.theme.isLight){
    return globals.theme.lightTheme.subtitle3;
  }else{
    return globals.theme.darkTheme.cardBackground;
  }
}
Color getHeadIconColor(){
  if(globals.theme.isLight){
    return globals.theme.lightTheme.subtitle;
  }else{
    return globals.theme.darkTheme.title;
  }
}