import 'package:flutter/material.dart';
import 'package:flutterexam/components/add_name.dart';
import 'components/add_point.dart';
import 'components/home.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Plist',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      // home: HomePage(),
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => HomePage(),


      },
    );
  }
}
