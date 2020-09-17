import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:plisto/components/core/plisto_core.dart';
import 'package:plisto/components/core/plisto_theme.dart';
import 'package:plisto/components/core/plisto_builder.dart';
import 'package:plisto/components/edit_name.dart';
import 'package:plisto/components/edit_point.dart';
import 'package:plisto/components/home.dart';

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
        backgroundColor: PlistoDynamic.background(),
        appBar: AppBar(
          iconTheme: IconThemeData(color: PlistoDynamic.primary()),
          backgroundColor: PlistoDynamic.background(),
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            PlistoCore.getName(index),
            style: GoogleFonts.poppins(textStyle: TextStyle(fontWeight: FontWeight.bold, color: PlistoDynamic.primary())),
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
                PlistoCore.delete(index);
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
                    color: PlistoDynamic.alt(index),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Icon(Icons.person, size: (MediaQuery.of(context).size.width*9/16)*0.7, color: PlistoDynamic.icon(index))),
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
                    color: PlistoDynamic.cardBackground(),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: ListTile(
                    title: Text('Name : '+PlistoCore.getName(index), style: TextStyle(fontWeight: FontWeight.bold, color: PlistoDynamic.title()),),
                    leading: Container(
                      height: 44,
                      width: 44,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: PlistoDynamic.alt(index),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      alignment: Alignment.center,
                      child: Icon(Icons.contacts, color: PlistoDynamic.icon(index),),
                      // child: Text(globals.getRank(index).toString(), style: TextStyle(fontWeight: FontWeight.bold, color: globals.theme.getCardContentColor(index)),),
                    ),
                    subtitle: Text(
                      'Tap to edit',
                      style: TextStyle(fontSize: 12*MediaQuery.of(context).textScaleFactor,fontWeight: FontWeight.bold, color: PlistoDynamic.subtitle()),
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
                    color: PlistoDynamic.cardBackground(),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: ListTile(
                    title: Text('Point : '+PlistoCore.getPoint(index).toString(), style: TextStyle(fontWeight: FontWeight.bold, color: PlistoDynamic.title()),),
                    leading: Container(
                      height: 44,
                      width: 44,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: PlistoDynamic.alt(index),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      alignment: Alignment.center,
                      child: Icon(Icons.book, color: PlistoDynamic.icon(index),),
                    ),
                    subtitle: Text(
                      'Tap to edit',
                      style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold, color: PlistoDynamic.subtitle()),
                    ),
                  ),
                ),
              ),
            ),
            PlistoBuilder.rank(index, context),
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
      return PlistoBuilder.next(index-1, context);
    }
  }
}

