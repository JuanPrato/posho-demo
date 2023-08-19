import 'package:flutter/material.dart';
import 'package:posho/components/item_card.dart';
import 'package:posho/components/menu/category.dart';
import 'package:posho/components/menu/category_selector.dart';
import 'package:posho/models/category.dart';
import 'package:posho/models/product.dart';

class Categories extends StatefulWidget {
  const Categories(
      {super.key, required this.categories, required this.products});

  final List<Product> products;
  final List<CategoryModel> categories;

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: widget.categories.length + 1,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var foodMap = getMapByCategory(widget.products);

    return Column(
      children: [
        CategorySelector(
          tabController: _tabController,
          categories: widget.categories,
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              Category(foods: getWidgetFromProducts(widget.products)),
              Category(foods: getWidgetFromProducts(foodMap['Bandejas'])),
              Category(foods: getWidgetFromProducts(foodMap['Para 2'])),
              Category(foods: getWidgetFromProducts(foodMap['Bebidas'])),
            ],
          ),
        ),
      ],
    );
  }
}

List<Widget> getWidgetFromProducts(List<Product>? products) {
  return products?.map<ItemCard>((p) => ItemCard(product: p)).toList() ?? [];
}

Map<String, List<Product>> getMapByCategory(List<Product> products) {
  Map<String, List<Product>> result = new Map();

  for (var product in products) {
    for (var category in product.categories) {
      result.putIfAbsent(category.name, () => []).add(product);
    }
  }

  return result;
}
