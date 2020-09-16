import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'core/widget_builder/next_tile_builder.dart';
import 'core/widget_builder/top_three_check.dart';
import 'edit_name.dart';
import 'edit_point.dart';
import 'home.dart';
import 'core/globals.dart' as globals;
import 'package:google_fonts/google_fonts.dart';

class Detail extends StatefulWidget {
  Detail({Key key, this.index}) : super(key: key);
  final int index;
  @override
  _DetailState createState() => _DetailState(index);
}

class _DetailState extends State<Detail> {
  _DetailState(this.index);
  final int index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: globals.theme.dynamicBackgroundColor(),
        appBar: AppBar(
          iconTheme: IconThemeData(color: globals.theme.dynamicPrimaryColor()),
          backgroundColor: globals.theme.dynamicBackgroundColor(),
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            globals.getName(index),
            style: GoogleFonts.poppins(textStyle: TextStyle(fontWeight: FontWeight.bold, color: globals.theme.dynamicPrimaryColor())),
          ),
          leading: IconButton(
            icon: Icon(EvaIcons.arrowCircleLeft),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
          actions: [
            IconButton(
              icon: Icon(EvaIcons.personDelete),
              onPressed: (){
                globals.delete(index);
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                    ModalRoute.withName('')
                );
              },
            ),
          ],
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width*9/16,
                  decoration: BoxDecoration(
                    color: globals.theme.dynamicCardAltColor(index),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Icon(Icons.person, size: (MediaQuery.of(context).size.width*9/16)*0.7, color: globals.theme.dynamicCardIconColor(index))),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16,8),
              child: InkWell(
                onTap: (){
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => EditName(index)),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: globals.theme.dynamicCardColor(),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: ListTile(
                    title: Text('Name : '+globals.getName(index), style: TextStyle(fontWeight: FontWeight.bold, color: globals.theme.dynamicTitleColor()),),
                    leading: Container(
                      height: 44,
                      width: 44,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: globals.theme.dynamicCardAltColor(index),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      alignment: Alignment.center,
                      child: Icon(Icons.contacts, color: globals.theme.dynamicCardIconColor(index),),
                      // child: Text(globals.getRank(index).toString(), style: TextStyle(fontWeight: FontWeight.bold, color: globals.theme.getCardContentColor(index)),),
                    ),
                    subtitle: Text(
                      'Tap to edit',
                      style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold, color: globals.theme.dynamicSubtitleColor()),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16,8),
              child: InkWell(
                onTap: (){
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => EditPoint(index)),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: globals.theme.dynamicCardColor(),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: ListTile(
                    title: Text('Point : '+globals.getPoint(index).toString(), style: TextStyle(fontWeight: FontWeight.bold, color: globals.theme.dynamicTitleColor()),),
                    leading: Container(
                      height: 44,
                      width: 44,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: globals.theme.dynamicCardAltColor(index),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      alignment: Alignment.center,
                      child: Icon(Icons.book, color: globals.theme.dynamicCardIconColor(index),),
                      // child: Text(globals.getRank(index).toString(), style: TextStyle(fontWeight: FontWeight.bold, color: globals.theme.getCardContentColor(index)),),
                    ),
                    subtitle: Text(
                      'Tap to edit',
                      style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold, color: globals.theme.dynamicSubtitleColor()),
                    ),
                  ),
                ),
              ),
            ),
            topThreeBuilder(index, context),
            NextPerson(index),
          ],
        )
    );
  }
}
class NextPerson extends StatelessWidget {
  final int index;
  NextPerson(this.index);
  @override
  Widget build(BuildContext context) {
    if(index == 0){
      return Container();
    }else{
      return nextPersonTileBuilder(index-1, context);
    }
  }
}

