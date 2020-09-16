import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:plisto/components/detail.dart';

import 'home.dart';
import 'core/globals.dart' as globals;
import 'core/widget_builder/numpad.dart';
import 'core/themedata//add_screen_theme.dart' as theme;

class EditPoint extends StatefulWidget {
  EditPoint(this.index);
  final int index;

  @override
  _EditPointState createState() => _EditPointState(index);
}

class _EditPointState extends State<EditPoint> {
  _EditPointState(this.index){
    _input = globals.getPoint(index).toString();
  }
  final int index;
  String _input;
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
          child: Center(child: Text(input, style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: theme.getAppBarContentColor())),),)),
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
        backgroundColor: theme.getHeadColor(),
        appBar: AppBar(
          iconTheme: IconThemeData(color: globals.theme.dynamicPrimaryColor()),
          backgroundColor: theme.getAppBarColor(),
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            globals.getName(index)+'\'s Point',
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
                if(_checkPoint(_input)){
                  globals.updatePoint(index, int.tryParse(_input));
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Detail(index: index,)),
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
                      color: theme.getBackgroundColor(),
                      shape: BoxShape.rectangle,
                    ),
                    child: Center(child: Text(_input, style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 56, fontWeight: FontWeight.bold, color: theme.getAppBarContentColor())),)),
                ),
              ),
              Flexible(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(32, 32, 32, 32),
                  child: Container(
                    color: theme.getHeadColor(),
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
                                      child: Center(child: Text('CLR', style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: theme.getAppBarContentColor())),),)),
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
                                      child: Center(child: Icon(EvaIcons.backspace, color: theme.getAppBarContentColor(),),)),
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
