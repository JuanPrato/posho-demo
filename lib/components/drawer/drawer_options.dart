import 'package:flutter/material.dart';
import 'package:posho/components/drawer/drawer_item.dart';

class DrawerOptions extends StatelessWidget {
  const DrawerOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        DrawerItem(title: "INICIO", icon: Icons.home),
        const Divider(),
        DrawerItem(title: "MENÚ", icon: Icons.menu_book),
        DrawerItem(title: "PROMOCIONES", icon: Icons.money_rounded),
        DrawerItem(title: "PERFIL", icon: Icons.person)
      ],
    );
  }
}
