import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plisto/components/add_point.dart';
import 'package:plisto/components/core/plisto_core.dart';
import 'package:plisto/components/core/plisto_theme.dart';
import 'package:plisto/components/core/special_theme_add.dart';

class AddName extends StatefulWidget {
  @override
  _AddNameState createState() => _AddNameState();
}

class _AddNameState extends State<AddName> {
  int _point = 0;
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
            style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: SpecialThemeAdd.getAppBarContentColor())),
          ),
          leading: IconButton(
            icon: Icon(
              EvaIcons.closeCircle,
              color: SpecialThemeAdd.getAppBarContentColor(),
            ),
            onPressed: () {
              Navigator.pop(context, false);
            },
          ),
          actions: [
            IconButton(
              icon: Icon(
                EvaIcons.checkmarkCircle2,
                color: SpecialThemeAdd.getAppBarContentColor(),
              ),
              onPressed: () {
                if (_controller.text == '') {
                  showDialog<void>(
                    context: context,
                    barrierDismissible: false, // user must tap button!
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Warning'),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: <Widget>[
                              Text('Complete name before save.'),
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
                } else {
                  PlistoCore.addNew(_controller.text, _point);
                  Navigator.pop(context, true);
                }
              },
            ),
          ],
        ),
        body: SafeArea(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 64, 16, 8),
                child: AspectRatio(
                  aspectRatio: 18 / 9,
                  child: Container(
                      decoration: BoxDecoration(
                        color: SpecialThemeAdd.getHeadColor(),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.person,
                          size: (MediaQuery.of(context).size.width) * 0.3,
                          color: SpecialThemeAdd.getHeadIconColor())),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: TextField(
                      controller: _controller,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          fontSize: 24,
                          textStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: PlistoDynamic.primary())),
                      decoration: InputDecoration(
                        hintText: 'Enter here',
                        hintStyle: GoogleFonts.poppins(
                            fontSize: 24,
                            textStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: PlistoDynamic.subtitle())),
                        border: UnderlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      _navigatorAddPoint(context);
                    },
                    child: Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        decoration: BoxDecoration(
                          color: PlistoDynamic.subtitle3(),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                _point.toString(),
                                style: GoogleFonts.poppins(
                                    fontSize: 24,
                                    textStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: PlistoDynamic.subtitle())),
                              ),
                              Container(
                                  child: Text(
                                'tap to edit',
                                style: GoogleFonts.roboto(
                                    fontSize: 12,
                                    textStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: PlistoDynamic.subtitle())),
                              ))
                            ],
                          ),
                        )),
                  ),
                ],
              ),
            ],
          ),
        ));
  }

  _navigatorAddPoint(BuildContext context) async {
    String text;
    if (_controller.text == '' || _controller.text == null)
      text = 'Unknown';
    else
      text = _controller.text;
    final int result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => AddPoint(text)));
    if (result != null) {
      setState(() {
        _point = result;
      });
    }
  }
}
