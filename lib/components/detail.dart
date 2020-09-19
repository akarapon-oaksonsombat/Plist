import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plisto/components/core/plisto_builder.dart';
import 'package:plisto/components/core/plisto_core.dart';
import 'package:plisto/components/core/plisto_theme.dart';
import 'package:plisto/components/edit_name.dart';
import 'package:plisto/components/edit_point.dart';

class Detail extends StatefulWidget {
  Detail({Key key, this.index}) : super(key: key);
  final int index;

  @override
  _DetailState createState() => _DetailState(index);
}

class _DetailState extends State<Detail> {
  _DetailState(this._index);

  int _index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: PlistoDynamic.background(),
        appBar: AppBar(
          iconTheme: IconThemeData(color: PlistoDynamic.primary()),
          backgroundColor: PlistoDynamic.background(),
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            PlistoCore.getName(_index),
            style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: PlistoDynamic.primary())),
          ),
          leading: IconButton(
            icon: Icon(EvaIcons.arrowCircleLeft),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            IconButton(
              icon: Icon(EvaIcons.personDelete),
              onPressed: () {
                PlistoCore.delete(_index);
                Navigator.pop(context);
              },
            ),
          ],
        ),
        body: ListView(
          children: [
            AspectRatio(
              aspectRatio: 6 / 4,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Container(
                    decoration: BoxDecoration(
                      color: PlistoDynamic.alt(PlistoCore.getRank(_index)),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: Icon(Icons.person,
                        size:
                            (MediaQuery.of(context).size.width * 9 / 16) * 0.7,
                        color: PlistoDynamic.icon(PlistoCore.getRank(_index)))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: InkWell(
                onTap: () {
                  _editName(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: PlistoDynamic.cardBackground(),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: ListTile(
                    title: Text(
                      'Name : ' + PlistoCore.getName(_index),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: PlistoDynamic.title()),
                    ),
                    leading: AspectRatio(
                      aspectRatio: 1 / 1,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: PlistoDynamic.alt(PlistoCore.getRank(_index)),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.contacts,
                          color: PlistoDynamic.icon(PlistoCore.getRank(_index)),
                        ),
                      ),
                    ),
                    subtitle: Text(
                      'Tap to edit',
                      style: TextStyle(
                          fontSize: 12 * MediaQuery.of(context).textScaleFactor,
                          fontWeight: FontWeight.bold,
                          color: PlistoDynamic.subtitle()),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: InkWell(
                onTap: () {
                  _editPoint(context, _index);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: PlistoDynamic.cardBackground(),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: ListTile(
                    title: Text(
                      'Point : ' + PlistoCore.getPoint(_index).toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: PlistoDynamic.title()),
                    ),
                    leading: AspectRatio(
                      aspectRatio: 1 / 1,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: PlistoDynamic.alt(PlistoCore.getRank(_index)),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.book,
                          color: PlistoDynamic.icon(PlistoCore.getRank(_index)),
                        ),
                      ),
                    ),
                    subtitle: Text(
                      'Tap to edit',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: PlistoDynamic.subtitle()),
                    ),
                  ),
                ),
              ),
            ),
            PlistoBuilder.rank(_index, context),
            NextPerson(PlistoCore.getRank(_index)),
          ],
        ));
  }

  _editName(BuildContext context) async {
    final String result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => EditName(PlistoCore.getName(_index))));
    if (result != '' && result != null) {
      setState(() {
        PlistoCore.updateName(_index, result);
      });
    }
  }

  _editPoint(BuildContext context, int index) async {
    final int result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => EditPoint(index)));
    if (result != null) {
      setState(() {
        String temp = PlistoCore.getName(index);
        PlistoCore.updatePoint(index, result);
        _index = PlistoCore.findName(temp);
      });
    }
  }
}

class NextPerson extends StatelessWidget {
  final int rank;

  NextPerson(this.rank);

  @override
  Widget build(BuildContext context) {
    if (rank == 1) {
      return Container();
    } else {
      return PlistoBuilder.next(rank - 1, context);
    }
  }
}
