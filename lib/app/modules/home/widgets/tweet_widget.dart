import 'package:flutter/material.dart';

class TweetWidget extends StatefulWidget {
  final text;

  const TweetWidget({Key key, this.text}) : super(key: key);

  @override
  _TweetWidgetState createState() => _TweetWidgetState();
}

class _TweetWidgetState extends State<TweetWidget> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
            child: Text(
              widget.text,
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 16
              ),
              ),
          );
  }
}