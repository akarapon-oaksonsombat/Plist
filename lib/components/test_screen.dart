import 'package:flutter/material.dart';

class BottomSheetBuilder extends StatefulWidget {
  @override
  _BottomSheetBuilderState createState() => _BottomSheetBuilderState();
}

class _BottomSheetBuilderState extends State<BottomSheetBuilder> {
  @override
  Widget build(BuildContext context) {
    print('call btm sheet');
    var dimension =  MediaQuery.of(context).size.height/2;
    return SizedBox.expand(
      child: DraggableScrollableSheet(
        builder: (BuildContext context, ScrollController scrollController){
          return Container(
            color: Colors.blue[100],
            height: dimension,
          );
        },
      ),
    );
  }
}
