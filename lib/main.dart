import 'package:flutter/material.dart';
import 'package:posho/components/best_menu.dart';
import 'package:posho/components/coupons.dart';
import 'package:posho/components/drawer/drawer.dart';
import 'package:posho/components/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'POSHO',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerMenu(),
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('POSHO 🐔',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        leading: OpenDrawerIcon(),
        elevation: 10,
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              BestOfMenu(),
              SizedBox(height: 10),
              Menu(),
              SizedBox(height: 10),
              Coupons(),
              SizedBox(height: 75),
            ],
          ),
        ),
      ),
    );
  }
}

class OpenDrawerIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.menu, color: Colors.white, size: 32),
      onPressed: () {
        Scaffold.of(context).openDrawer();
      },
    );
  }
}
