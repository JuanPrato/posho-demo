import 'package:flutter/material.dart';

import '../components/best_menu.dart';
import '../components/coupons.dart';
import '../components/menu.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            BestOfMenu(),
            const SizedBox(height: 10),
            const Coupons(),
            const SizedBox(height: 10),
            const Menu(),
            const SizedBox(height: 10),
          ],
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
