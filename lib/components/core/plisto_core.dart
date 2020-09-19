library plisto_core;

import 'package:eva_icons_flutter/eva_icons_flutter.dart';

import 'data/example_data.dart';
import 'data/personal_data.dart';
import 'plisto_theme.dart';

class PlistoCore {
  static List<PersonalData> _data = List();
  static List<PersonalData> _refData = List();

  static ranking() {
    _refData = _data;
    //sort
    quickSort(0, _refData.length - 1);
    //give a ranking number
    for (int i = 0; i < _refData.length; i++) {
      _data[findName(_refData[i].name)].rank = i + 1;
    }
  }

  static quickSort(int l, int r) {
    if (l < r) {
      PersonalData pivot = _refData[r];
      int cnt = l;
      for (int i = l; i <= r; i++) {
        if (_refData[i].point >= pivot.point) {
          swap(cnt, i);
          cnt++;
        }
      }
      quickSort(l, cnt - 2);
      quickSort(cnt, r);
    }
  }

  static swap(int a, int b) {
    PersonalData temp = _refData[a];
    _refData[a] = _refData[b];
    _refData[b] = temp;
  }

  static startWithExample() {
    for (int i = 0; i < ExampleData.point.length; i++) {
      _data.add(
          new PersonalData(ExampleData.name[i], ExampleData.point[i], i + 1));
      _data[i].customIndex = i + 1;
    }
    ranking();
  }

  static hasRank(int rank) {
    for (int i = 0; i < getLength(); i++) {
      if (_data[i].rank == rank) {
        return true;
      }
    }
    return false;
  }

  static int getPoint(int index) {
    return _data[index].point;
  }

  static String getName(int index) {
    return _data[index].name;
  }

  static int getRank(int index) {
    return _data[index].rank;
  }

  static int getLength() {
    return _data.length;
  }

  static int getUpperRank(int index) {
    if (index != 0) {
      return index - 1;
    } else
      return 0;
  }

  static int findName(String name) {
    for (int i = 0; i < _data.length; i++) {
      if (name == _data[i].name) {
        return i;
      }
    }
    return null;
  }

  static void rearrange(int old, int future) {
    // Widget row = _rows.removeAt(oldIndex);
    // _rows.insert(newIndex, row);
    var temp = _data.removeAt(old);
    _data.insert(future, temp);
  }

  static int findRank(int rank) {
    for (int i = 0; i < _data.length; i++) {
      if (rank == _data[i].rank) {
        return i;
      }
    }
    return null;
  }

  // Edit Personal Data
  static addNew(String name, int point) {
    _data.add(new PersonalData(name, point, 0));
    ranking();
  }

  static updatePoint(int index, int point) {
    _data[index].point = point;
    ranking();
  }

  static updateName(int index, String name) {
    _data[index].name = name;
    ranking();
  }

  static delete(int index) {
    List<PersonalData> temp = List();
    for (int i = 0; i < _data.length; i++) {
      if (index != i) {
        temp.add(_data[i]);
      }
    }
    _data = temp;
    ranking();
  }

  static brightnessIcon() {
    if (PlistoDynamic.getBrightness()) {
      return EvaIcons.moon;
    } else {
      return EvaIcons.sun;
    }
  }
}
