import 'package:flutter/material.dart';
import 'card_color.dart';
class LightTheme{
  //fields
  Color primary = Color.fromRGBO(0, 0, 0, 1.0);
  Color title = Color.fromRGBO(0, 0, 0, 1.0);
  Color subtitle = Color.fromRGBO(142, 142, 146, 1.0);
  Color subtitle2 = Color.fromRGBO(199, 199, 201, 1.0);
  Color subtitle3 = Color.fromRGBO(220, 220, 221, 1.0);
  Color cardBackground = Color.fromRGBO(232, 232, 232, 1.0);
  Color background = Color.fromRGBO(245, 245, 245, 1.0);
  List<CardColor> card = List();
  //constructor
  LightTheme(){
    // Blue
    card.add(CardColor(
        Color.fromRGBO(0, 122, 255, 1),
        Color.fromRGBO(147, 197, 255, 1),
        Color.fromRGBO(0, 79, 157, 1),
    ));
    // Green
    card.add(CardColor(
        Color.fromRGBO(0, 199, 89, 1),
        Color.fromRGBO(154, 222, 171, 1),
        Color.fromRGBO(10, 128, 40, 1),
    ));
    // Indigo
    card.add(CardColor(
        Color.fromRGBO(88, 86, 214, 1),
        Color.fromRGBO(199, 198, 255, 1),
        Color.fromRGBO(61, 59, 179, 1),
    ));
    // Orange
    card.add(CardColor(
        Color.fromRGBO(255, 149, 0, 1),
        Color.fromRGBO(255, 204, 132, 1),
        Color.fromRGBO(167, 109, 17, 1),
    ));
    // Pink
    card.add(CardColor(
        Color.fromRGBO(255, 45, 85, 1),
        Color.fromRGBO(255, 163, 181, 1),
        Color.fromRGBO(177, 51, 76, 1),
    ));
    // Purple
    card.add(CardColor(
        Color.fromRGBO(175, 82, 222, 1),
        Color.fromRGBO(231, 184, 255, 1),
        Color.fromRGBO(126, 28, 175, 1),
    ));
    // Red
    card.add(CardColor(
        Color.fromRGBO(255, 59, 48, 1),
        Color.fromRGBO(255, 178, 173, 1),
        Color.fromRGBO(175, 31, 23, 1),
    ));
    // Teal
    card.add(CardColor(
        Color.fromRGBO(90, 200, 250, 1),
        Color.fromRGBO(181, 232, 255, 1),
        Color.fromRGBO(68, 159, 195, 1),
    ));
    // Yellow
    card.add(CardColor(
        Color.fromRGBO(255, 204, 0, 1),
        Color.fromRGBO(255, 229, 129, 1),
        Color.fromRGBO(174, 153, 49, 1),
    ));
  }
}