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
  late List<Product> productsToShow = widget.products;

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
    var foodMap = getMapByCategory(productsToShow);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
          child: TextFormField(
            decoration: const InputDecoration(
              hintText: 'Busca tu plato favorito...',
              prefixIcon: Icon(Icons.search),
            ),
            onChanged: (value) {
              setState(() {
                if (value == '') {
                  productsToShow = widget.products;
                  return;
                }
                productsToShow = widget.products
                    .where((element) => element.name
                        .toLowerCase()
                        .contains(value.toLowerCase()))
                    .toList();
              });
            },
          ),
        ),
        CategorySelector(
          tabController: _tabController,
          categories: widget.categories,
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              Category(foods: getWidgetFromProducts(productsToShow)),
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
