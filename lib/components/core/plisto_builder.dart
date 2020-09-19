library plisto_builder;

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plisto/components/core/plisto_core.dart';
import 'package:plisto/components/core/plisto_theme.dart';

class PlistoBuilder {
  static IconData _medalIcon(int rank) {
    if (rank == 1) {
      return EvaIcons.star;
    } else if (rank == 2) {
      return EvaIcons.award;
    } else if (rank == 3) {
      return EvaIcons.award;
    } else
      return null;
  }

  static Color _rankThumbnailColor(int rank) {
    if (rank == 1) {
      return PlistoDynamic.alt(8);
    } else if (rank == 2) {
      if (PlistoDynamic.getBrightness()) {
        return Color.fromRGBO(199, 199, 201, 1.0);
      } else {
        return Color.fromRGBO(141, 141, 147, 1.0);
      }
    } else if (rank == 3) {
      return PlistoDynamic.alt(4);
    } else
      return PlistoDynamic.alt(rank);
  }

  static Color _rankIconColor(int rank) {
    if (rank == 1) {
      return PlistoDynamic.icon(8);
    } else if (rank == 2) {
      return Colors.black;
    } else if (rank == 3) {
      return PlistoDynamic.icon(4);
    } else
      return PlistoDynamic.icon(rank);
  }

  static Widget rank(int index, BuildContext context) {
    String _sub;
    if (PlistoCore.hasRank(PlistoCore.getRank(index) + 1)) {
      int indexLower = PlistoCore.findRank(PlistoCore.getRank(index) + 1);
      int dif = PlistoCore.getPoint(index) - PlistoCore.getPoint(indexLower);
      _sub = PlistoCore.getName(indexLower) +
          ' with ' +
          dif.toString() +
          ' point(s) behind.';
    } else {
      _sub = 'No one behind.';
    }
    if (PlistoCore.getRank(index) <= 3) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
        child: Container(
          decoration: BoxDecoration(
            color: PlistoDynamic.cardBackground(),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          child: ListTile(
            title: Text(
              PlistoCore.getRank(index).toString() + ' Runner Up',
              style: TextStyle(
                  fontSize: 15 * MediaQuery.of(context).textScaleFactor,
                  fontWeight: FontWeight.bold,
                  color: PlistoDynamic.title()),
            ),
            leading: AspectRatio(
              aspectRatio: 1 / 1,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: _rankThumbnailColor(PlistoCore.getRank(index)),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                alignment: Alignment.center,
                child: Icon(
                  _medalIcon(PlistoCore.getRank(index)),
                  color: _rankIconColor(PlistoCore.getRank(index)),
                ),
              ),
            ),
            subtitle: Text(
              _sub,
              style: TextStyle(
                  fontSize: 12 * MediaQuery.of(context).textScaleFactor,
                  fontWeight: FontWeight.bold,
                  color: PlistoDynamic.subtitle()),
            ),
          ),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
        child: Container(
          decoration: BoxDecoration(
            color: PlistoDynamic.cardBackground(),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          child: ListTile(
            title: Text(
              PlistoCore.getRank(index).toString() + ' Runner Up',
              style: TextStyle(
                  fontSize: 15 * MediaQuery.of(context).textScaleFactor,
                  fontWeight: FontWeight.bold,
                  color: PlistoDynamic.title()),
              // style: globals.titleText[globals.theme],
            ),
            leading: AspectRatio(
              aspectRatio: 1 / 1,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: _rankThumbnailColor(PlistoCore.getRank(index)),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                alignment: Alignment.center,
                child: Icon(
                  EvaIcons.person,
                  color: _rankIconColor(PlistoCore.getRank(index)),
                ),
              ),
            ),
            subtitle: Text(
              _sub,
              style: TextStyle(
                  fontSize: 12 * MediaQuery.of(context).textScaleFactor,
                  fontWeight: FontWeight.bold,
                  color: PlistoDynamic.subtitle()),
            ),
          ),
        ),
      );
    }
  }

  static Widget next(int rank, BuildContext context) {
    final int index = PlistoCore.findRank(rank);
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Container(
        decoration: BoxDecoration(
          color: PlistoDynamic.cardBackground(),
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        child: ListTile(
          title: Text(
            'Next Person',
            style: TextStyle(
                fontSize: 15 * MediaQuery.of(context).textScaleFactor,
                fontWeight: FontWeight.bold,
                color: PlistoDynamic.subtitle()),
          ),
          leading: AspectRatio(
            aspectRatio: 1 / 1,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: PlistoDynamic.alt(PlistoCore.getRank(index)),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              alignment: Alignment.center,
              child: Icon(
                Icons.arrow_forward_ios,
                color: PlistoDynamic.icon(PlistoCore.getRank(index)),
              ),
            ),
          ),
          subtitle: Text(
            PlistoCore.getName(index) +
                ' with ' +
                PlistoCore.getPoint(index).toString(),
            style: TextStyle(
                fontSize: 12 * MediaQuery.of(context).textScaleFactor,
                fontWeight: FontWeight.bold,
                color: PlistoDynamic.primary()),
          ),
        ),
      ),
    );
  }
}
