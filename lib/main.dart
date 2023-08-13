import 'package:flutter/material.dart';
import 'package:posho/components/drawer/drawer.dart';
import 'package:posho/screens/home_screen.dart';

import 'screens/menu_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String mainRoute = "/";
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'POSHO',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
          primaryColor: Colors.red,
          useMaterial3: true,
        ),
        home: Scaffold(
          key: scaffoldKey,
          drawer: DrawerMenu(
            onNavigation: (route) {
              setState(() {
                mainRoute = route;
              });
              scaffoldKey.currentState?.closeDrawer();
            },
          ),
          appBar: AppBar(
            backgroundColor: Colors.red,
            title: Text(
              getTitle(mainRoute),
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
            leading: OpenDrawerIcon(),
            elevation: 10,
          ),
          body: ScreenManager(route: mainRoute),
        ));
  }
}

String getTitle(String route) {
  final Map<String, String> titles = {
    '/': 'POSHO 🐔',
    '/menu': 'MENU',
  };
  return titles[route]!;
}

class ScreenManager extends StatelessWidget {
  ScreenManager({super.key, required this.route});
  final String route;
  final Map<String, Widget Function(BuildContext)> routes = {
    '/': (context) => const HomeScreen(title: 'Inicio'),
    '/menu': (context) => MenuScreen(title: 'Menu'),
  };

  @override
  Widget build(BuildContext context) {
    return routes[route]!(context);
  }
}
