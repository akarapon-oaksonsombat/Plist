library special_theme;

import 'package:flutter/material.dart';
import 'package:plisto/components/core/plisto_theme.dart';

class SpecialThemeAdd {
  static Color getDoneButtonColor() {
    if (PlistoDynamic.getBrightness())
      return PlistoLightTheme.color[1];
    else
      return PlistoDarkTheme.alt[1];
  }

  static Color getAppBarColor() {
    if (PlistoDynamic.getBrightness())
      return PlistoLightTheme.background;
    else
      return PlistoDarkTheme.background;
  }

  static Color getAppBarContentColor() {
    if (PlistoDynamic.getBrightness())
      return PlistoLightTheme.title;
    else
      return PlistoDarkTheme.title;
  }

  static Color getBackgroundColor() {
    if (PlistoDynamic.getBrightness())
      return PlistoLightTheme.background;
    else
      return PlistoDarkTheme.background;
  }

  static Color getHeadColor() {
    if (PlistoDynamic.getBrightness())
      return PlistoLightTheme.subtitle3;
    else
      return PlistoDarkTheme.cardBackground;
  }

  static Color getHeadIconColor() {
    if (PlistoDynamic.getBrightness())
      return PlistoLightTheme.subtitle;
    else
      return PlistoDarkTheme.title;
  }
}
