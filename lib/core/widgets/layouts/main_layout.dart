import 'package:flutter/material.dart';
import 'package:task_open_api/routes.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    bool isCurrentRouteActive(BuildContext context, String routeName) {
      return ModalRoute.of(context)?.settings.name == routeName;
    }

    int getCurrentRouteIndex(){
      return bottomNavigation.entries.toList().indexWhere((route)=>route.key == ModalRoute.of(context)?.settings.name);
    }

    return SafeArea(
      child: Scaffold(
        body: child,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: getCurrentRouteIndex(),
          onTap: (index) {
            var selectedScreenRoute = bottomNavigation.entries.toList()[index].key;
            if(!isCurrentRouteActive(context, selectedScreenRoute)) {
              Navigator.of(context).pushNamed(selectedScreenRoute);
            }
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.local_bar),
              label: 'Cocktails',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              label: 'Favorites',
            ),
          ],
        ),
      ),
    );
  }
}
