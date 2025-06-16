import 'package:flutter/material.dart';

import '/core/core.dart';
import '/routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppThemes.lightTheme,
      title: 'Task Open API',
      routes: {...bottomNavigation},
    );
  }
}
