import 'package:flutter/material.dart';
import 'package:posho/components/drawer/drawer_header.dart';
import 'package:posho/components/drawer/drawer_options.dart';
import 'package:posho/main.dart';
import 'package:provider/provider.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});
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
            Expanded(
              child: DrawerOptions(onNavigation: (String newRoute) {
                context.read<Navigation>().navigate(newRoute);
              }),
            ),
          ],
        ),
      ),
    );
  }
}
