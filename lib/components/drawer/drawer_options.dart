import 'package:flutter/material.dart';
import 'package:posho/components/drawer/drawer_item.dart';

class DrawerOptions extends StatelessWidget {
  DrawerOptions({super.key, required this.onNavigation});

  final Function(String) onNavigation;

  Function() createFunction(BuildContext context, String route) {
    return () {
      onNavigation(route);
    };
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DrawerItem(
          title: "INICIO",
          icon: Icons.home,
          onPressed: createFunction(context, '/'),
        ),
        const Divider(),
        DrawerItem(
          title: "MENÚ",
          icon: Icons.menu_book,
          onPressed: createFunction(context, '/menu'),
        ),
        DrawerItem(
          title: "PROMOCIONES",
          icon: Icons.money_rounded,
          onPressed: createFunction(context, '/coupons'),
        ),
        const DrawerItem(
          title: "PEDIDOS",
          icon: Icons.history,
        ),
        const DrawerItem(title: "PERFIL", icon: Icons.person),
        const Spacer(),
        const Divider(),
        const DrawerItem(title: "SALIR", icon: Icons.logout)
      ],
    );
  }
}
