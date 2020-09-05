library globals;

import 'package:flutter/material.dart';

int index = 0;
int theme = 0;

List<int> _point = [
  90,
  85,
  84,
  86,
  85,
  87,
  88,
  98,
  90,
  85,
  84,
  86,
  85,
  87,
  88,
  98,
  90,
  85,
  84,
  86,
  85,
  87,
  88,
  98,
];
List<String> _name = [
  'Harry Potter',
  'Ronald Weasley',
  'Hermione Granger',
  'Draco Malfoy',
  'Lord Voldermort',
  'Rubeus Hagrid',
  'Albus Dumbledore',
  'Minerva McGonnagall',
  'Severus Snape',
  'Harry Potter',
  'Ronald Weasley',
  'Hermione Granger',
  'Draco Malfoy',
  'Lord Voldermort',
  'Rubeus Hagrid',
  'Albus Dumbledore',
  'Minerva McGonnagall',
  'Severus Snape',
  'Harry Potter',
  'Ronald Weasley',
  'Hermione Granger',
  'Draco Malfoy',
  'Lord Voldermort',
  'Rubeus Hagrid',
  'Albus Dumbledore',
  'Minerva McGonnagall',
  'Severus Snape',
];

List<TextStyle> headText = [
  TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Color.fromRGBO(49, 53, 61, 1)),
  TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Color.fromRGBO(242, 242, 247, 1)),
];
List<Color> headColor = [
  Color.fromRGBO(0, 0, 0, 1),
  Color.fromRGBO(242, 242, 247, 1),
];
List<TextStyle> titleText = [
  TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black),
  TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.bold,
      color: Color.fromRGBO(251, 251, 252, 1)),
];
List<TextStyle> subtitleText = [
  TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.bold,
      color: Color.fromRGBO(131, 136, 156, 1)),
  TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.bold,
      color: Color.fromRGBO(131, 136, 156, 1)),
];
List<Color> backgroundColor = [
  Color.fromRGBO(253, 253, 253, 1),
  Color.fromRGBO(46, 46, 65, 1),
];
List<Color> tileColor = [
  Colors.white,
  Color.fromRGBO(68, 72, 92, 1),
];
List<Color> boxTileColor = [Colors.white, Colors.white];
List<Color> iconColor = [
  Color.fromRGBO(149, 149, 149, 1),
  Color.fromRGBO(251, 251, 252, 1),
];
List<Color> accentColor = [
  Color.fromRGBO(0, 99, 255, 1),
  Color.fromRGBO(0, 99, 255, 1),
];
List<Color> unactiveColor = [
  Color.fromRGBO(230, 230, 230, 1),
  Color.fromRGBO(68, 72, 92, 1),
];
Color shadowColor = Color.fromRGBO(0, 0, 0, 1).withOpacity(0.1);

getPoint(int inDex) {
  print('get point ${_point[inDex]}');
  return _point[inDex].toString();
}

getName(int inDex) {
  print('get name $inDex ${_name[inDex]}');
  return _name[inDex];
}

getLength() {
  return _point.length;
}

addNew(String input, int number) {
  _name.add(input);
  _point.add(number);
}

updatePoint(int inDex, int number) {
  _point[inDex] = number;
}

updateName(int inDex, String input) {
  _name[inDex] = input;
}
