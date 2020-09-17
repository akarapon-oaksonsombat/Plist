import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plisto/components/core/plisto_core.dart';
import 'package:plisto/components/core/plisto_theme.dart';
import 'package:plisto/components/core/plisto_builder.dart';
import 'add_name.dart';
import 'detail_sheet.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    double fontFactor = MediaQuery.of(context).textScaleFactor;
    return Scaffold(
      backgroundColor: PlistoDynamic.background(),
      body: SafeArea(
        child: CustomScrollView(
            slivers:[
              SliverAppBar(
                pinned: true,
                expandedHeight: 150.0,
                backgroundColor: PlistoDynamic.background(),
                flexibleSpace: FlexibleSpaceBar(
                  titlePadding: EdgeInsets.fromLTRB(32, 8, 0, 10),
                  title: Text(
                      "Plisto",
                      style: GoogleFonts.sriracha(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: PlistoDynamic.primary()
                          )
                      )
                  ),
                ),
                actions: [
                  IconButton(
                    icon: Icon(PlistoCore.brightnessIcon(), color: PlistoDynamic.primary(),),
                    onPressed: (){
                      setState(() {
                        PlistoDynamic.themeChange();
                      });

                    },
                  ),
                  IconButton(
                    icon: Icon(EvaIcons.personAdd, color: PlistoDynamic.primary(),),
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AddName())
                      );
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.control_point, color: PlistoDynamic.primary(),),
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => BottomSheetBuilder())
                      );
                    },
                  ),
                ],
              ),
              SliverGrid(
                delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return PlistoBuilder.tile(index, context);
                      },
                  childCount: PlistoCore.getLength(),
                ), gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: MediaQuery.of(context).size.width,
                childAspectRatio: 4.0,
                ),
              ),
              SliverGrid(
                delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    return InkWell(
                      onTap: (){
                        setState(() {
                          PlistoCore.startWithExample();
                        });
                      },
                      child: Container(
                        height: 10.0,
                        child: Center(
                          child: Text('Plisto 1.0 Beta 6', textAlign: TextAlign.center ,style: TextStyle(fontSize: fontFactor*12.0,color: PlistoDynamic.subtitle()),),
                        ),
                      ),
                    );
                  },
                  childCount: 1,
                ), gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: MediaQuery.of(context).size.width,
                childAspectRatio: 20/3,
              ),
              ),
            ]
        ),
      ),
    );
  }
}
