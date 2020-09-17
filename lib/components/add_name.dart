import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:plisto/components/core/plisto_theme.dart';
import 'package:plisto/components/core/special_theme_add.dart';
import 'package:plisto/components/add_point.dart';

class AddName extends StatefulWidget {
  @override
  _AddNameState createState() => _AddNameState();
}

class _AddNameState extends State<AddName> {
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
        backgroundColor: SpecialThemeAdd.getBackgroundColor(),
        appBar: AppBar(
          iconTheme: IconThemeData(color: PlistoDynamic.primary()),
          backgroundColor: SpecialThemeAdd.getAppBarColor(),
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            'Enter Name',
            style: GoogleFonts.poppins(textStyle: TextStyle(fontWeight: FontWeight.bold, color: SpecialThemeAdd.getAppBarContentColor())),
          ),
          leading: IconButton(
            icon: Icon(EvaIcons.closeCircle, color: SpecialThemeAdd.getAppBarContentColor(),),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
          actions: [
            IconButton(
              icon: Icon(EvaIcons.arrowCircleRight, color: SpecialThemeAdd.getAppBarContentColor(),),
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddPoint(_controller.text)),
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
                      color: SpecialThemeAdd.getHeadColor(),
                      shape: BoxShape.circle,
                      // borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: Icon(Icons.person, size: (MediaQuery.of(context).size.width)*0.4, color: SpecialThemeAdd.getHeadIconColor())),
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
                      style: GoogleFonts.poppins(fontSize: 24,textStyle: TextStyle(fontWeight: FontWeight.bold, color: PlistoDynamic.primary())),
                      decoration: InputDecoration(
                        // icon: Icon(EvaIcons.person, color: globals.theme.getPrimaryColor(),),
                          hintText: 'Enter here',
                          hintStyle: GoogleFonts.poppins(fontSize: 24,textStyle: TextStyle(fontWeight: FontWeight.bold, color: PlistoDynamic.subtitle())),
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
