import 'package:flutter/material.dart';
import 'package:task_open_api/routes.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    var currentRouteName = ModalRoute.of(context)?.settings.name;
    bool isCurrentRouteActive(String routeName) {
      return currentRouteName == routeName;
    }

    int getCurrentRouteIndex() {
      return bottomNavigation.entries.toList().indexWhere(
        (route) => route.key == currentRouteName,
      );
    }

    return SafeArea(
      child: Scaffold(
        body: child,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: getCurrentRouteIndex(),
          onTap: (index) {
            var selectedScreenRoute = bottomNavigation.entries
                .toList()[index]
                .key;
            if (!isCurrentRouteActive(selectedScreenRoute)) {
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
