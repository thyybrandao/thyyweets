import 'package:flutter/material.dart';

class DateWidget extends StatefulWidget {
  final date;

  const DateWidget({Key key, this.date}) : super(key: key);
  @override
  _DateWidgetState createState() => _DateWidgetState();
}

class _DateWidgetState extends State<DateWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
            child:Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [

                Text(
                  widget.date,
                  style:TextStyle(
                    fontSize:10,
                    color:Colors.grey
                  )
                  ),
              ],)
          );
  }
}