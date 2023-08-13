import 'package:flutter/material.dart';
import 'package:posho/components/item_card.dart';
import 'package:posho/components/menu/category.dart';
import 'package:posho/components/menu/category_selector.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key, required this.title});

  final String title;

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen>
    with SingleTickerProviderStateMixin {
  final List<Widget> foods = [
    const ItemCard(),
    const ItemCard(),
    const ItemCard(),
    const ItemCard(),
    const ItemCard(),
    const ItemCard(),
    const ItemCard(),
  ];
  late TabController _tabController;

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
          child: TabBarView(
            controller: _tabController,
            children: [
              Category(foods: foods),
              Category(foods: foods),
              Category(foods: foods),
              Category(foods: foods),
            ],
          ),
        )
      ],
    );
  }
}
