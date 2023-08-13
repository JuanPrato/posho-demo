import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  const Category({super.key, required this.foods});

  final List<Widget> foods;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      primary: true,
      shrinkWrap: false,
      crossAxisCount: 2,
      childAspectRatio: 90 / 100,
      children: foods,
    );
  }
}
