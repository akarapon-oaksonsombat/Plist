import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'objects/globals.dart' as globals;
import 'builder/tile_builder.dart';
import 'add_name.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _getThemeIcon(){
    if(globals.theme.isLight){
      return EvaIcons.moon;
    }else{
      return EvaIcons.sun;
    }
  }
  @override
  Widget build(BuildContext context) {
    globals.start();
    return Scaffold(
      backgroundColor: globals.theme.getBackgroundColor(),
      body: CustomScrollView(
          slivers:[
            SliverAppBar(
              pinned: true,
              expandedHeight: 150.0,
              backgroundColor: globals.theme.getBackgroundColor(),
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.fromLTRB(32, 8, 0, 10),
                title: Text("Dashboard", style: GoogleFonts.poppins(textStyle: TextStyle(fontWeight: FontWeight.bold, color: globals.theme.getPrimaryColor()))),
              ),
              actions: [
                IconButton(
                  icon: Icon(_getThemeIcon(), color: globals.theme.getPrimaryColor(),),
                  onPressed: (){
                    setState(() {
                      globals.theme.changeTheme();
                    });

                  },
                ),
                IconButton(
                  icon: Icon(EvaIcons.personAdd, color: globals.theme.getPrimaryColor(),),
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
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: globals.theme.getFloatingColor(),
      //   onPressed: () {
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(builder: (context) => Add()),
      //     );
      //   },
      //   child: Icon(
      //     Icons.add,
      //     color: Colors.white,
      //   ),
      // ), //// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
