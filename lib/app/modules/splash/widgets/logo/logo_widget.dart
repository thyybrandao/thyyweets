import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Image.asset("assets/images/logo.png", width: size.width/2),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Ironics Theets",
                style: TextStyle( 
                  fontSize: 20,
                  color: Color(0xff00acee)
                  )
                ),
            )


          ],);
  }
}
