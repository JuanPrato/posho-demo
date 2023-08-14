import 'package:flutter/material.dart';
import 'package:posho/components/drawer/drawer.dart';
import 'package:posho/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'screens/menu_screen.dart';

class Navigation with ChangeNotifier {
  String _route = "/";

  String get route => _route;

  void navigate(String newRoute) {
    _route = newRoute;
    notifyListeners();
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
      url: "https://tczhmpjaswycuergjiiq.supabase.co",
      anonKey:
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRjemhtcGphc3d5Y3VlcmdqaWlxIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTE5ODEyMjIsImV4cCI6MjAwNzU1NzIyMn0.WT78w5r_ZQogaskP2jTfTsjWhpza9C6d4NGF3LZS-wk");

  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => Navigation())],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    context.watch<Navigation>().addListener(
      () {
        scaffoldKey.currentState?.closeDrawer();
      },
    );
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
          drawer: const DrawerMenu(),
          appBar: AppBar(
            backgroundColor: Colors.red,
            title: Text(
              getTitle(context.watch<Navigation>().route),
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
            leading: OpenDrawerIcon(),
            elevation: 10,
          ),
          body: ScreenManager(),
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
  ScreenManager({super.key});
  final Map<String, Widget Function(BuildContext)> routes = {
    '/': (context) => const HomeScreen(title: 'Inicio'),
    '/menu': (context) => const MenuScreen(title: 'Menu'),
  };

  @override
  Widget build(BuildContext context) {
    return routes[context.watch<Navigation>().route]!(context);
  }
}
