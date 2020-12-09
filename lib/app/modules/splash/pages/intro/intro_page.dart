import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'intro_controller.dart';

class IntroPage extends StatefulWidget {
  final String title;
  const IntroPage({Key key, this.title = "Intro"}) : super(key: key);

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends ModularState<IntroPage, IntroController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {  

        return SafeArea(
            child: Container(
            color: Colors.white,
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[

              Text(
                "Seja bem-vindo ao conteúdo irônico de Tweets.",
                style: TextStyle(
                    color:Color(0xff00acee),
                    fontSize: 24,
                  ),
                  textAlign: TextAlign.center
                ),
              
              Image.asset("assets/images/content.png"),

              Container(
              width: constraints.maxWidth,
              //height: constraints.maxHeight,
              decoration: BoxDecoration(
                color:Color(0xff00acee),
                borderRadius: BorderRadius.circular(50)
              ),
              child: FlatButton(
                child: Text(
                  "Listar Tweets",
                  style: TextStyle(
                    color:Colors.white,
                    fontSize:16
                  ),
                  ),
                onPressed: () => Modular.to.pushReplacementNamed("/home"),

              ),


              )

            


            ],),

          ),
        );},
        
      )
    );
  }
}
