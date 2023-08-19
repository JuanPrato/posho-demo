import 'package:flutter/material.dart';
import 'package:posho/models/category.dart';

class CategorySelector extends StatelessWidget {
  const CategorySelector(
      {super.key, required this.tabController, required this.categories});
  final TabController tabController;
  final List<CategoryModel> categories;
  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      tabs: [CategoryModel("Todo"), ...categories]
          .map((category) => SelectItem(category: category.name))
          .toList(),
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
