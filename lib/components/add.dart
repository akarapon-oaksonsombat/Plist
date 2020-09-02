import 'package:flutter/material.dart';
import 'globals.dart' as globals;

class Add extends StatefulWidget {
  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
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
      appBar: AppBar(
        title: Text('Add new'),
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () {
              globals.addNew('hello', 20);
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: Column(
        children: [
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              hintText: 'Name',
            ),
          )
        ],
      ),
    );
  }
}
