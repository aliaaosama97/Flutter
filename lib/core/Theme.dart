import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taskawi_flutter/core/Colors.dart';


ThemeData lightTheme = ThemeData(
    //primaryColor: AppColors.primaryColor1,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.containerColorWhite,
    colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: AppColors.containerColorWhite,
        onPrimary: AppColors.containerColorWhite,
        secondary: AppColors.gpsOffColor,
        onSecondary: AppColors.primaryColor2,
        primaryContainer: AppColors.primaryColor1,
        error: Colors.grey,
        onError: Colors.white,
        background: AppColors.textFormFieldHintColorPurple,
        onBackground: AppColors.textFormFieldHintColorPurple,
        surface: AppColors.containerColorWhite,
        onSurface: AppColors.textFormFieldColorGps,
    ),
    appBarTheme: AppBarTheme(
        //backgroundColor: AppColors.darkModePrimaryColor1,

    ),

);

ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme: TextTheme(

    ),
    colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: Colors.black,
        onPrimary: Color(0xff232323),
        secondary: AppColors.darkGpsOffColor,
        onSecondary: Color(0xff232323),
        primaryContainer: Color(0xff44546F),
        error: Colors.grey,
        onError: Colors.white,
        background: Color(0xff464646),
        onBackground: Color(0xff44546F),
        surface: Color(0xff464646),
        onSurface: Colors.white,
    ),
    scaffoldBackgroundColor: AppColors.darkPrimaryColor1,
);