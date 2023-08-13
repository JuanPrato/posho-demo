import 'package:flutter/material.dart';

final categories = ["Todo", "Bandejas", "Para 2", "Bebidas"];

class CategorySelector extends StatelessWidget {
  const CategorySelector({super.key, required this.tabController});
  final TabController tabController;
  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      tabs:
          categories.map((category) => SelectItem(category: category)).toList(),
    );
  }
}

class SelectItem extends StatelessWidget {
  const SelectItem({super.key, required this.category});

  final String category;

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Text(
        category,
        textAlign: TextAlign.center,
      ),
    );
  }
}
