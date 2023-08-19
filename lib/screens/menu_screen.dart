import 'package:flutter/material.dart';
import 'package:posho/components/item_card.dart';
import 'package:posho/components/menu/categories.dart';
import 'package:posho/components/menu/category.dart';
import 'package:posho/components/menu/category_selector.dart';
import 'package:posho/models/category.dart';
import 'package:posho/models/product.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key, required this.title});

  final String title;

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final _products = Supabase.instance.client.from("products").select('''
              *,
              categories (
                name
              )
              ''');

  final _categories = Supabase.instance.client
      .from("categories")
      .select()
      .order("order", ascending: true);

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
        Expanded(
          child: FutureBuilder(
            future: Future.wait([_categories, _products]),
            builder: (context, futures) {
              if (!futures.hasData || futures.data == null) {
                return const Text("loading");
              }
              var [categoriesRaw, productsRaw] = futures.data!;

              final List<Product> products = productsRaw
                  .map<Product>(Product.getProductFromSnapshot)
                  .toList();
              final List<CategoryModel> categories = categoriesRaw
                  .map<CategoryModel>(CategoryModel.getCategoryFromSnapshot)
                  .toList();

              return Categories(categories: categories, products: products);
            },
          ),
        ),
      ],
    );
  }
}
