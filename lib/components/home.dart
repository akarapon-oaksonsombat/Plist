import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plisto/components/add_name.dart';
import 'package:plisto/components/core/plisto_core.dart';
import 'package:plisto/components/core/plisto_theme.dart';
import 'package:plisto/components/detail.dart';
import 'package:reorderables/reorderables.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _onReorder(int old, int future) {
    setState(() {
      PlistoCore.rearrange(old, future);
    });
  }

  @override
  Widget build(BuildContext context) {
    double fontFactor = MediaQuery.of(context).textScaleFactor;
    return Scaffold(
      backgroundColor: PlistoDynamic.background(),
      body: SafeArea(
        child: CustomScrollView(slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 150.0,
            backgroundColor: PlistoDynamic.background(),
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.fromLTRB(32, 8, 0, 10),
              title: Text("Plisto",
                  style: GoogleFonts.sriracha(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: PlistoDynamic.primary()))),
            ),
            actions: [
              IconButton(
                icon: Icon(
                  PlistoCore.brightnessIcon(),
                  color: PlistoDynamic.primary(),
                ),
                onPressed: () {
                  setState(() {
                    PlistoDynamic.themeChange();
                  });
                },
              ),
              IconButton(
                icon: Icon(
                  EvaIcons.personAdd,
                  color: PlistoDynamic.primary(),
                ),
                onPressed: () {
                  _navigatorAdd(context);
                },
              ),
            ],
          ),
          ReorderableSliverList(
            delegate: ReorderableSliverChildBuilderDelegate(
                (BuildContext context, int index) => _tile(index, context),
                childCount: PlistoCore.getLength()),
            onReorder: _onReorder,
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      PlistoCore.startWithExample();
                    });
                  },
                  child: Container(
                    height: 10.0,
                    child: Center(
                      child: Text(
                        'Plisto 1.0 Beta 6',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: fontFactor * 12.0,
                            color: PlistoDynamic.subtitle()),
                      ),
                    ),
                  ),
                );
              },
              childCount: 1,
            ),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: MediaQuery.of(context).size.width,
              childAspectRatio: 20 / 3,
            ),
          ),
        ]),
      ),
    );
  }

  Widget _tile(int index, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Container(
        // height: 100.0,
        decoration: BoxDecoration(
          color: PlistoDynamic.cardBackground(),
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        child: ListTile(
          title: Text(
            PlistoCore.getName(index),
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
                color: PlistoDynamic.alt(PlistoCore.getRank(index)),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              alignment: Alignment.center,
              child: Text(
                PlistoCore.getRank(index).toString(),
                style: TextStyle(
                    fontSize: 20 * MediaQuery.of(context).textScaleFactor,
                    fontWeight: FontWeight.bold,
                    color: PlistoDynamic.onList(PlistoCore.getRank(index))),
              ),
            ),
          ),
          subtitle: Text(
            'Tap to see detail',
            style: TextStyle(
                fontSize: 12 * MediaQuery.of(context).textScaleFactor,
                color: PlistoDynamic.subtitle()),
          ),
          trailing: Text(
            PlistoCore.getPoint(index).toString(),
            style: TextStyle(
                fontSize: 15 * MediaQuery.of(context).textScaleFactor,
                fontWeight: FontWeight.bold,
                color: PlistoDynamic.primary()),
          ),
          onTap: () {
            _navigatorDetail(context, index);
          },
        ),
      ),
    );
  }

  _navigatorAdd(BuildContext context) async {
    final bool result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => AddName()));
    if (result) setState(() {});
  }

  _navigatorDetail(BuildContext context, int index) async {
    await Navigator.push(
        context, MaterialPageRoute(builder: (context) => Detail(index: index)));
    setState(() {});
  }
}
