import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'add_point.dart';
import 'detail.dart';
import 'objects/globals.dart' as globals;
import 'objects/theme/add_screen_theme.dart' as theme;

class EditName extends StatefulWidget {
  EditName(this.index);
  final int index;
  @override
  _EditNameState createState() => _EditNameState(index);
}

class _EditNameState extends State<EditName> {
  _EditNameState(this.index);
  final int index;
  TextEditingController _controller;
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: theme.getBackgroundColor(),
        appBar: AppBar(
          iconTheme: IconThemeData(color: globals.theme.getPrimaryColor()),
          backgroundColor: theme.getAppBarColor(),
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            'Edit Name',
            style: GoogleFonts.poppins(textStyle: TextStyle(fontWeight: FontWeight.bold, color: theme.getAppBarContentColor())),
          ),
          leading: IconButton(
            icon: Icon(EvaIcons.closeCircle, color: theme.getAppBarContentColor(),),
            onPressed: (){
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Detail(index: index,)),
              );
            },
          ),
          actions: [
            IconButton(
              icon: Icon(EvaIcons.checkmarkCircle2, color: theme.getAppBarContentColor(),),
              onPressed: (){
                if(_controller.text == ''){
                  showDialog<void>(
                    context: context,
                    barrierDismissible: false, // user must tap button!
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Warning'),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: <Widget>[
                              Text('Text box is empty.'),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          FlatButton(
                            child: Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                }else{
                  globals.updateName(index, _controller.text);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Detail(index: index,)),
                  );
                }
              },
            ),
          ],
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 64, 16, 8),
                child: Container(
                    width: MediaQuery.of(context).size.width*0.5,
                    height: MediaQuery.of(context).size.width*0.5,
                    decoration: BoxDecoration(
                      color: theme.getHeadColor(),
                      shape: BoxShape.circle,
                      // borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: Icon(Icons.person, size: (MediaQuery.of(context).size.width)*0.4, color: theme.getHeadIconColor())),
              ),
              SizedBox(height: 16,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Text('" ', style: GoogleFonts.poppins(fontSize: 34,textStyle: TextStyle(fontWeight: FontWeight.bold, color: globals.theme.getPrimaryColor())),),
                  Container(
                    width: MediaQuery.of(context).size.width*0.7,
                    decoration: BoxDecoration(
                      // color: globals.theme.getCardColor(),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: TextField(
                      controller: _controller,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(fontSize: 24,textStyle: TextStyle(fontWeight: FontWeight.bold, color: globals.theme.getPrimaryColor())),
                      decoration: InputDecoration(
                        // icon: Icon(EvaIcons.person, color: globals.theme.getPrimaryColor(),),
                        hintText: globals.getName(index),
                        hintStyle: GoogleFonts.poppins(fontSize: 24,textStyle: TextStyle(fontWeight: FontWeight.bold, color: globals.theme.getSubtitleColor())),
                        border: UnderlineInputBorder(),

                        // fillColor: globals.theme.getBackgroundColor(),
                        // filled: true
                      ),
                    ),
                  ),
                  // Text(' "', style: GoogleFonts.poppins(fontSize: 34,textStyle: TextStyle(fontWeight: FontWeight.bold, color: globals.theme.getPrimaryColor())),),
                ],
              ),
            ],
          ),
        )
    );
  }
}
