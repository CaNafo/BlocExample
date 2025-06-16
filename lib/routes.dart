import 'package:flutter/material.dart';

import '/screens/screens.dart';

//Application routes are defined in this file,
//and grouped based on the application UI/UX

Map<String, Widget Function(BuildContext)> bottomNavigation = {
  HomeScreen.routeName: (_) => const HomeScreen(),
  FavoritesScreen.routeName: (_) => const FavoritesScreen(),
};
