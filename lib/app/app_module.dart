import 'package:thyyweets/app/modules/home/home_controller.dart';
import 'package:thyyweets/app/modules/splash/pages/intro/intro_controller.dart';
import 'package:thyyweets/app/modules/splash/pages/intro/intro_page.dart';
import 'package:thyyweets/app/modules/splash/splash_controller.dart';
import 'package:thyyweets/app/modules/splash/splash_module.dart';

import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:thyyweets/app/app_widget.dart';
import 'package:thyyweets/app/modules/home/home_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        $AppController,
        $SplashController,
        $IntroController,
        $HomeController
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, module: SplashModule()),
        ModularRouter("/intro", child:(_, args) => IntroPage()),
        ModularRouter("/home", module: HomeModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
