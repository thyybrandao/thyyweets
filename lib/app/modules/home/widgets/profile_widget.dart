import 'package:flutter/material.dart';

class ProfileWidget extends StatefulWidget {

  final String name;
  final String username;
  final String avatar;

  const ProfileWidget({Key key, this.name, this.username, this.avatar}) : super(key: key);
  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {

  

  @override
  Widget build(BuildContext context) {

    
    return Container(
            width: 300,
            height: 60,
            child: Row(
              children:[

                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Image.network(
                    widget.avatar,
                    scale: 1,
                    )
                ],),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text(
                      widget.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                      ),
                      ),
                    Text(
                      widget.username,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.grey
                      ),
                      )
                  ],),
                )
              ]
            ),
          );
  }
}