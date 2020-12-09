import 'package:flutter/material.dart';

class CounterWidget extends StatefulWidget {
  final title;
  final valor;

  const CounterWidget({Key key, this.title, this.valor}) : super(key: key);
  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
          child:Column(
            children: [

              Text(
                widget.title,
                style:TextStyle(
                  fontSize:10,
                  color:Colors.grey
                )
                ),

              Text(
                widget.valor,
                style:TextStyle(
                  fontSize:14,
                  color:Color(0xff00acee),
                  fontWeight: FontWeight.bold,
                )
                ),

            ],)
        );
  }
}