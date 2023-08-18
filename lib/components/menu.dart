import 'package:flutter/material.dart';
import 'package:posho/components/item_card.dart';
import 'package:posho/models/product.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  final _products =
      Supabase.instance.client.from("products").select().order("best");

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Nuestro menú",
              style: TextStyle(
                  fontSize: 24, fontWeight: FontWeight.bold, height: 2),
            ),
            TextButton(
              child: const Text("Ver más", style: TextStyle(fontSize: 16)),
              onPressed: () {},
            )
          ],
        ),
        FutureBuilder(
          future: _products,
          builder: (context, snapshot) {
            return GridView.count(
              primary: false,
              crossAxisCount: 2,
              shrinkWrap: true,
              childAspectRatio: 90 / 100,
              children: snapshot.hasData
                  ? snapshot.data
                      .map(Product.getProductFromSnapshot)
                      .map<ItemCard>((p) => ItemCard(product: p))
                      .take(4)
                      .toList()
                  : [Text("loading")],
            );
          },
        ),
      ],
    );
  }
}
