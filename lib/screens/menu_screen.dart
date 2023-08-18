import 'package:flutter/material.dart';
import 'package:posho/components/item_card.dart';
import 'package:posho/components/menu/category.dart';
import 'package:posho/components/menu/category_selector.dart';
import 'package:posho/models/product.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key, required this.title});

  final String title;

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final _products = Supabase.instance.client.from("products").select();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: categories.length,
      vsync: this,
    );
    _tabController.addListener(() {
      print(_tabController.index);
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
          child: TextFormField(
            decoration: const InputDecoration(
              hintText: 'Busca tu plato favorito...',
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),
        CategorySelector(tabController: _tabController),
        Expanded(
          child: FutureBuilder(
            future: _products,
            builder: (context, snapshot) {
              final List<Widget> foods = snapshot.hasData
                  ? snapshot.data
                      .map<Product>(Product.getProductFromSnapshot)
                      .map<ItemCard>((p) => ItemCard(product: p))
                      .toList()
                  : [];
              return TabBarView(
                controller: _tabController,
                children: [
                  Category(foods: foods),
                  Category(foods: foods),
                  Category(foods: foods),
                  Category(foods: foods),
                ],
              );
            },
          ),
        )
      ],
    );
  }
}
