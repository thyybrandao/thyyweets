import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import 'app_colors.dart';


class AppTheme {

  AppTheme(this.context);

  final BuildContext context;

  ThemeData get defaultTheme => ThemeData(
    primaryColor: AppColors.primary,
    accentColor: AppColors.accent,
    textTheme: TextTheme( 
      headline1: TextStyle(fontFamily: "Roboto")),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: AppBarTheme(
      color: AppColors.primary.withOpacity(0),
      iconTheme: IconThemeData(
        color: AppColors.primary
      ),
      
      elevation: 0,
      textTheme: TextTheme(
        headline6: TextStyle(
          fontFamily: "Roboto",
          color: AppColors.primary,
          fontSize: 19,
          fontWeight: FontWeight.bold
          ),
      )
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: AppColors.primary,
    )
    
  );
}