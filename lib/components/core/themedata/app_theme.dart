library apptheme;
import 'package:flutter/material.dart';
import 'theme_light.dart';
import 'theme_dark.dart';
class AppTheme{
  // fields
  DarkTheme darkTheme;
  LightTheme lightTheme;
  bool isLight = true;
  int themeNumber = 9;
  // constructor
  AppTheme(){
    darkTheme = DarkTheme();
    lightTheme = LightTheme();
  }
  bool change(){
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
  Color dynamicPrimaryColor(){
    if(isLight){
      return lightTheme.primary;
    }else return darkTheme.primary;
  }
  Color dynamicTitleColor(){
    if(isLight){
      return lightTheme.title;
    }else return darkTheme.title;
  }
  Color dynamicSubtitleColor(){
    if(isLight){
      return lightTheme.subtitle;
    }else return darkTheme.subtitle;
  }
  Color dynamicBackgroundColor(){
    if(isLight){
      return lightTheme.background;
    }else return darkTheme.background;
  }
  // Get card theme
  int _choose(int index){
    if(index%themeNumber==themeNumber) return 0;
    else return index%themeNumber;
  }
  Color dynamicCardContentColor(int index){
    if(isLight){
      return lightTheme.primary;
    }else return darkTheme.primary;
  }
  Color dynamicCardColor(){
    if(isLight){
      return lightTheme.cardBackground;
    }else return darkTheme.cardBackground;
  }
  Color dynamicCardIconColor(int index){
    if(isLight){
      return lightTheme.card[_choose(index)].icon;
    }else return darkTheme.background;
  }
  Color dynamicCardMainColor(int index){
    if(isLight){
      return lightTheme.card[_choose(index)].main;
    }else{
      return darkTheme.card[_choose(index)].main;
    }
  }
  Color dynamicCardAltColor(int index){
    if(isLight){
      return lightTheme.card[_choose(index)].alt;
    }else{
      return darkTheme.card[_choose(index)].alt;
    }
  }
  Color dynamicCloseButtonColor(){
    if(isLight){
      return lightTheme.card[6].main;
    }else{
      return darkTheme.card[6].alt;
    }
  }


}