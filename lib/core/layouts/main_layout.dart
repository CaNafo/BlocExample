import 'package:flutter/material.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: child));
  }
}
