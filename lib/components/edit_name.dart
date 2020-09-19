import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plisto/components/core/plisto_theme.dart';
import 'package:plisto/components/core/special_theme_add.dart';

class EditName extends StatefulWidget {
  EditName(this.name);

  final String name;

  @override
  _EditNameState createState() => _EditNameState(name);
}

class _EditNameState extends State<EditName> {
  _EditNameState(this.name);

  final String name;
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
            'Edit Name',
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
              Navigator.pop(context, null);
            },
          ),
          actions: [
            IconButton(
              icon: Icon(
                EvaIcons.checkmarkCircle2,
                color: SpecialThemeAdd.getAppBarContentColor(),
              ),
              onPressed: () {
                Navigator.pop(context, _controller.text);
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
                        hintText: name,
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
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'tap name to edit',
                    style: GoogleFonts.roboto(
                        fontSize: 12,
                        textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: PlistoDynamic.subtitle())),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
