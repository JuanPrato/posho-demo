import 'package:flutter/material.dart';
import 'package:posho/components/drawer/drawer_header.dart';
import 'package:posho/components/drawer/drawer_options.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
      color: Colors.red,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
      ),
      child: const Column(
        children: [
          DrawerProfileHeader(),
          SizedBox(
            height: 10,
          ),
          DrawerOptions(),
        ],
      ),
    ));
  }
}
