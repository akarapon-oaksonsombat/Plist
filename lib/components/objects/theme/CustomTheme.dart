import 'package:flutter/material.dart';
import 'theme_light.dart';
import 'theme_dark.dart';
class CustomTheme{
  // fields
  DarkTheme darkTheme;
  LightTheme lightTheme;
  bool isLight = true;
  int themeNumber = 9;
  // constructor
  CustomTheme(){
    darkTheme = DarkTheme();
    lightTheme = LightTheme();
  }
  bool changeTheme(){
    try{
      if(isLight==true) isLight=false;
      else isLight=true;
      // print('theme was changed to'+ isLight.toString());
      return true;
    }catch(e){
      // print('Error : theme wasn\'t change');
      return false;
    }
  }
  // Get theme color
  Color getPrimaryColor(){
    if(isLight){
      return lightTheme.primary;
    }else return darkTheme.primary;
  }
  Color getTitleColor(){
    if(isLight){
      return lightTheme.title;
    }else return darkTheme.title;
  }
  Color getSubtitleColor(){
    if(isLight){
      return lightTheme.subtitle;
    }else return darkTheme.subtitle;
  }
  Color getBackgroundColor(){
    if(isLight){
      return lightTheme.background;
    }else return darkTheme.background;
  }
  // Get card theme
  int _choose(int index){
    if(index%themeNumber==themeNumber) return 0;
    else return index%themeNumber;
  }
  Color getCardContentColor(int index){
    if(isLight){
      return lightTheme.primary;
    }else return darkTheme.primary;
  }
  Color getCardColor(){
    if(isLight){
      return lightTheme.cardBackground;
    }else return darkTheme.cardBackground;
  }
  Color getCardIconColor(int index){
    if(isLight){
      return lightTheme.card[_choose(index)].icon;
    }else return darkTheme.background;
  }
  Color getCardMainColor(int index){
    if(isLight){
      return lightTheme.card[_choose(index)].main;
    }else{
      return darkTheme.card[_choose(index)].main;
    }
  }
  Color getCardAltColor(int index){
    if(isLight){
      return lightTheme.card[_choose(index)].alt;
    }else{
      return darkTheme.card[_choose(index)].alt;
    }
  }
  Color getCloseButtonColor(){
    if(isLight){
      return lightTheme.card[6].main;
    }else{
      return darkTheme.card[6].alt;
    }
  }


}