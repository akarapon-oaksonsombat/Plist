import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'core/globals.dart' as globals;
import 'core/widget_builder/icon_generator.dart' as icon;
import 'core/widget_builder/tile_builder.dart';
import 'add_name.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    globals.start();
    return Scaffold(
      backgroundColor: globals.theme.dynamicBackgroundColor(),
      body: SafeArea(
        child: CustomScrollView(
            slivers:[
              SliverAppBar(
                pinned: true,
                expandedHeight: 150.0,
                backgroundColor: globals.theme.dynamicBackgroundColor(),
                flexibleSpace: FlexibleSpaceBar(
                  titlePadding: EdgeInsets.fromLTRB(32, 8, 0, 10),
                  title: Text("Plist", style: GoogleFonts.poppins(textStyle: TextStyle(fontWeight: FontWeight.bold, color: globals.theme.dynamicPrimaryColor()))),
                ),
                actions: [
                  IconButton(
                    icon: Icon(icon.brightness(), color: globals.theme.dynamicPrimaryColor(),),
                    onPressed: (){
                      setState(() {
                        globals.theme.change();
                      });

                    },
                  ),
                  IconButton(
                    icon: Icon(EvaIcons.personAdd, color: globals.theme.dynamicPrimaryColor(),),
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AddName())
                      );

                    },
                  ),
                ],
              ),
              SliverGrid(
                delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return tileBuilder(index, context);
                      },
                  childCount: globals.getLength(),
                ), gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: MediaQuery.of(context).size.width,
                childAspectRatio: 4.0,
              ),

              ),
            ]
        ),
      ),
    );
  }
}
