import 'package:flutter/material.dart';
import 'package:posho/components/drawer/drawer_header.dart';
import 'package:posho/components/drawer/drawer_options.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key, required this.onNavigation});

  final Function(String) onNavigation;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).primaryColor,
      child: Container(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top,
            bottom: MediaQuery.of(context).padding.bottom),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const DrawerProfileHeader(),
            const SizedBox(
              height: 10,
            ),
            Expanded(child: DrawerOptions(onNavigation: onNavigation)),
          ],
        ),
      ),
    );
  }
}
