import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'splash_controller.dart';
import 'widgets/logo/logo_widget.dart';

class SplashPage extends StatefulWidget {
  final String title;
  const SplashPage({Key key, this.title = "Splash"}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends ModularState<SplashPage, SplashController> {
  //use 'controller' variable to access controller

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Timer(Duration(seconds: 4),()=> Modular.to.pushReplacementNamed("/intro"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {  

        return Container(
          width: constraints.maxWidth,
          height: constraints.maxHeight,
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

           LogoWidget()


          ],),
        );
         },
        
      )
    );
  }
}
