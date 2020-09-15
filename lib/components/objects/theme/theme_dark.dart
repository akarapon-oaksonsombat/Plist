import 'package:flutter/material.dart';
import 'card_color.dart';
class DarkTheme{
  //fields
  Color primary = Color.fromRGBO(231, 231, 231, 1.0);
  Color title = Color.fromRGBO(231, 231, 231, 1.0);
  Color subtitle = Color.fromRGBO(141, 141, 147, 1.0);
  Color subtitle2 = Color.fromRGBO(50, 50, 52, 1.0);
  Color subtitle3 = Color.fromRGBO(41, 41, 43, 1.0);
  Color cardBackground = Color.fromRGBO(32, 32, 32, 1.0);
  Color background = Color.fromRGBO(0, 0, 0, 1.0);
  Color _icon = Color.fromRGBO(231, 231, 231, 1.0);
  List<CardColor> card = List();
  //constructor
  DarkTheme(){
    // Blue
    card.add(CardColor(
        Color.fromRGBO(0, 79, 157, 1), //card
        Color.fromRGBO(10, 132, 255, 1), //thumbnail
        _icon //content
    ));
    // Green
    card.add(CardColor(
        Color.fromRGBO(10, 128, 40, 1), //card
        Color.fromRGBO(48, 209, 88, 1), //thumbnail
        _icon //content
    ));
    // Indigo
    card.add(CardColor(
        Color.fromRGBO(61, 59, 179, 1), //card
        Color.fromRGBO(94, 92, 230, 1), //thumbnail
        _icon //content
    ));
    // Orange
    card.add(CardColor(
        Color.fromRGBO(167, 109, 17, 1), //card
        Color.fromRGBO(255, 159, 10, 1), //thumbnail
        _icon //content
    ));
    // Pink
    card.add(CardColor(
        Color.fromRGBO(177, 51, 76, 1), //card
        Color.fromRGBO(255, 55, 95, 1), //thumbnail
        _icon
    ));
    // Purple
    card.add(CardColor(
        Color.fromRGBO(126, 28, 175, 1),
        Color.fromRGBO(191, 90, 242, 1),
        _icon
    ));
    // Red
    card.add(CardColor(
        Color.fromRGBO(175, 31, 23, 1),
        Color.fromRGBO(255, 69, 58, 1),
        _icon
    ));
    // Teal
    card.add(CardColor(
        Color.fromRGBO(68, 159, 195, 1),
        Color.fromRGBO(100, 210, 255, 1),
        _icon
    ));
    // Yellow
    card.add(CardColor(
        Color.fromRGBO(174, 153, 49, 1),
        Color.fromRGBO(255, 214, 10, 1),
        _icon
    ));
  }
}