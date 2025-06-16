import 'package:flutter/material.dart';

class AppThemes {
  static final lightTheme = ThemeData(
    pageTransitionsTheme: PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.iOS: CustomPageTransitionsBuilder(),
        TargetPlatform.android: CustomPageTransitionsBuilder(),
      },
    ),
  );
}

class CustomPageTransitionsBuilder extends PageTransitionsBuilder {
  @override
  Widget buildTransitions<T>(
      PageRoute<T> route,
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    return child;
  }
}
