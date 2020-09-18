library plisto_theme;
import 'package:flutter/material.dart';

class PlistoDynamic {
  static bool _isLight = true;
  static bool getBrightness(){
    return _isLight;
  }
  static themeChange(){
    if(_isLight) _isLight=false;
    else _isLight=true;
  }
  static Color primary(){
    if(_isLight) return PlistoLightTheme.primary;
    else return PlistoDarkTheme.primary;
  }
  static Color title(){
    if(_isLight) return PlistoLightTheme.title;
    else return PlistoDarkTheme.title;
  }
  static Color subtitle(){
    if(_isLight) return PlistoLightTheme.subtitle;
    else return PlistoDarkTheme.subtitle;
  }
  static Color subtitle2(){
    if(_isLight) return PlistoLightTheme.subtitle2;
    else return PlistoDarkTheme.subtitle2;
  }
  static Color subtitle3(){
    if(_isLight) return PlistoLightTheme.subtitle3;
    else return PlistoDarkTheme.subtitle3;
  }
  static Color cardBackground(){
    if(_isLight) return PlistoLightTheme.cardBackground;
    else return PlistoDarkTheme.cardBackground;
  }
  static Color background(){
    if(_isLight) return PlistoLightTheme.background;
    else return PlistoDarkTheme.background;
  }
  static int _choose(int index){
    return index%9;
  }
  static Color color(int index){
    index = _choose(index);
    if(_isLight) return PlistoLightTheme.color[index];
    else return PlistoDarkTheme.color[index];
  }
  static Color alt(int index){
    index = _choose(index);
    if(_isLight) return PlistoLightTheme.alt[index];
    else return PlistoDarkTheme.alt[index];
  }
  static Color icon(int index){
    index = _choose(index);
    if(_isLight) return PlistoLightTheme.icon[index];
    else return PlistoDarkTheme.background;
  }
  static Color onList(int index){
    index = _choose(index);
    if(_isLight) return PlistoLightTheme.icon[index];
    else return PlistoDarkTheme.background;
  }
}
class PlistoDarkTheme {
  static const Color primary = Color.fromRGBO(231, 231, 231, 1.0);
  static const Color title = Color.fromRGBO(231, 231, 231, 1.0);
  static const Color subtitle = Color.fromRGBO(141, 141, 147, 1.0);
  static const Color subtitle2 = Color.fromRGBO(50, 50, 52, 1.0);
  static const Color subtitle3 = Color.fromRGBO(41, 41, 43, 1.0);
  static const Color cardBackground = Color.fromRGBO(32, 32, 32, 1.0);
  static const Color background = Color.fromRGBO(0, 0, 0, 1.0);
  static const Color icon = Color.fromRGBO(231, 231, 231, 1.0);
  static const List<Color> color = [
    Color.fromRGBO(0, 79, 157, 1),
    Color.fromRGBO(10, 128, 40, 1),
    Color.fromRGBO(61, 59, 179, 1),
    Color.fromRGBO(167, 109, 17, 1),
    Color.fromRGBO(177, 51, 76, 1),
    Color.fromRGBO(126, 28, 175, 1),
    Color.fromRGBO(175, 31, 23, 1),
    Color.fromRGBO(68, 159, 195, 1),
    Color.fromRGBO(174, 153, 49, 1),
  ];
  static const List<Color> alt = [
    Color.fromRGBO(10, 132, 255, 1),
    Color.fromRGBO(48, 209, 88, 1),
    Color.fromRGBO(94, 92, 230, 1),
    Color.fromRGBO(255, 159, 10, 1),
    Color.fromRGBO(255, 55, 95, 1),
    Color.fromRGBO(191, 90, 242, 1),
    Color.fromRGBO(255, 69, 58, 1),
    Color.fromRGBO(100, 210, 255, 1),
    Color.fromRGBO(255, 214, 10, 1),
  ];
}
class PlistoLightTheme {
  static const Color primary = Color.fromRGBO(0, 0, 0, 1.0);
  static const Color title = Color.fromRGBO(0, 0, 0, 1.0);
  static const Color subtitle = Color.fromRGBO(142, 142, 146, 1.0);
  static const Color subtitle2 = Color.fromRGBO(199, 199, 201, 1.0);
  static const Color subtitle3 = Color.fromRGBO(220, 220, 221, 1.0);
  static const Color cardBackground = Color.fromRGBO(232, 232, 232, 1.0);
  static const Color background = Color.fromRGBO(245, 245, 245, 1.0);
  static const List<Color> color = [
    Color.fromRGBO(0, 122, 255, 1),
    Color.fromRGBO(0, 199, 89, 1),
    Color.fromRGBO(88, 86, 214, 1),
    Color.fromRGBO(255, 149, 0, 1),
    Color.fromRGBO(255, 45, 85, 1),
    Color.fromRGBO(175, 82, 222, 1),
    Color.fromRGBO(255, 59, 48, 1),
    Color.fromRGBO(90, 200, 250, 1),
    Color.fromRGBO(255, 204, 0, 1),
  ];
  static const List<Color> alt = [
    Color.fromRGBO(147, 197, 255, 1),
    Color.fromRGBO(154, 222, 171, 1),
    Color.fromRGBO(199, 198, 255, 1),
    Color.fromRGBO(255, 204, 132, 1),
    Color.fromRGBO(255, 163, 181, 1),
    Color.fromRGBO(231, 184, 255, 1),
    Color.fromRGBO(255, 178, 173, 1),
    Color.fromRGBO(181, 232, 255, 1),
    Color.fromRGBO(255, 229, 129, 1),
  ];
  static const List<Color> icon = [
    Color.fromRGBO(0, 79, 157, 1),
    Color.fromRGBO(10, 128, 40, 1),
    Color.fromRGBO(61, 59, 179, 1),
    Color.fromRGBO(167, 109, 17, 1),
    Color.fromRGBO(177, 51, 76, 1),
    Color.fromRGBO(126, 28, 175, 1),
    Color.fromRGBO(175, 31, 23, 1),
    Color.fromRGBO(68, 159, 195, 1),
    Color.fromRGBO(174, 153, 49, 1),
  ];
}