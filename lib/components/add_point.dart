import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:plisto/components/core/plisto_core.dart';
import 'package:plisto/components/core/plisto_theme.dart';
import 'package:plisto/components/home.dart';
import 'package:plisto/components/core/special_theme_add.dart';

class AddPoint extends StatefulWidget {
  AddPoint(this.name);
  final String name;
  @override
  _AddPointState createState() => _AddPointState(name);
}

class _AddPointState extends State<AddPoint> {
  _AddPointState(this.name);
  final String name;
  String _input = '0';
  _checkPoint(String input){
    if(int.tryParse(input)==null) return false;
    else return true;
  }
  _check(String input){
    setState(() {
      int number = int.tryParse(_input+input);
      if(number > 100 || number == null){
        _input = 'ERROR';
      }else{
        if(int.tryParse(_input)!=0){
          _input += input;
        }else{
          _input = input;
        }
      }
    });
  }
  _backspace(){
    setState(() {
      if(_input != 'ERROR'){
        String temp = '';
        for(int i=0;i<_input.length-1;i++){
          temp+=_input[i];
        }
        _input = temp;
      }
      if(_input=='' || _input=='ERROR') _input='0';
    });
  }
  Widget numberButton(String input){
    return InkWell(
      highlightColor: Colors.grey,
      borderRadius: BorderRadius.all(Radius.circular(100)),
      child: Container(
          // width: 50.0, height: 50.0,
          child: Center(child: Text(input, style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: SpecialThemeAdd.getAppBarContentColor())),),)),
      onTap: (){
        setState(() {
          _check(input);
        });
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: SpecialThemeAdd.getHeadColor(),
        appBar: AppBar(
          iconTheme: IconThemeData(color: PlistoDynamic.primary()),
          backgroundColor: SpecialThemeAdd.getAppBarColor(),
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            name+'\'s Point',
            style: GoogleFonts.poppins(textStyle: TextStyle(fontWeight: FontWeight.bold, color: SpecialThemeAdd.getAppBarContentColor())),
          ),
          leading: IconButton(
            icon: Icon(EvaIcons.arrowCircleLeft, color: SpecialThemeAdd.getAppBarContentColor(),),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
          actions: [
            IconButton(
              icon: Icon(EvaIcons.checkmarkCircle2, color: SpecialThemeAdd.getAppBarContentColor(),),
              onPressed: (){
                if(_checkPoint(_input)){
                  PlistoCore.addNew(name, int.tryParse(_input));
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                      ModalRoute.withName('')
                  );
                }else{
                  showDialog<void>(
                    context: context,
                    barrierDismissible: false, // user must tap button!
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Warning'),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: <Widget>[
                              Text('Wrong number! Please type again.'),
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
                }
              },
            ),
          ],
        ),
        body: SafeArea(
          child: Column(
            children: [
              Flexible(
                flex: 1,
                child: Container(
                    decoration: BoxDecoration(
                      color: SpecialThemeAdd.getBackgroundColor(),
                      shape: BoxShape.rectangle,
                    ),
                    child: Center(child: Text(_input, style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 56, fontWeight: FontWeight.bold, color: SpecialThemeAdd.getAppBarContentColor())),)),
                ),
              ),
              Flexible(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(32, 32, 32, 32),
                  child: Container(
                    color: SpecialThemeAdd.getHeadColor(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Flexible(flex:1, child: numberButton('1')),
                              Flexible(flex:1, child: numberButton('2'),),
                              Flexible(flex:1, child: numberButton('3'),),
                            ],
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                            Flexible(flex:1, child: numberButton('4'),),
                            Flexible(flex:1, child: numberButton('5'),),
                            Flexible(flex:1, child: numberButton('6'),),
                            ],
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Flexible(flex:1, child: numberButton('7'),),
                              Flexible(flex:1, child: numberButton('8'),),
                              Flexible(flex:1, child: numberButton('9'),),
                            ],
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Flexible(
                                flex:1,
                                child: InkWell(
                                  highlightColor: Colors.grey,
                                  borderRadius: BorderRadius.all(Radius.circular(100)),
                                  child: Container(
                                      // width: 50.0, height: 50.0,
                                      child: Center(child: Text('CLR', style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: SpecialThemeAdd.getAppBarContentColor())),),)),
                                  onTap: (){
                                    setState(() {
                                      _input = '0';
                                    });
                                  },
                                ),
                              ),
                              Flexible(flex:1, child: numberButton('0'),),
                              Flexible(
                                flex: 1,
                                child: InkWell(
                                  highlightColor: Colors.grey,
                                  borderRadius: BorderRadius.all(Radius.circular(100)),
                                  child: Container(
                                      // width: 50.0, height: 50.0,
                                      child: Center(child: Icon(EvaIcons.backspace, color: SpecialThemeAdd.getAppBarContentColor(),),)),
                                  onTap: (){
                                    setState(() {
                                      _backspace();
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        )
    );
  }
}
