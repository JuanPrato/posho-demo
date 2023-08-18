import 'package:flutter/material.dart';
import 'package:posho/models/product.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key, required this.product});

  final Product product;

  TextStyle getMainPriceStyles() {
    if (product.offerPrice != null) {
      return const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w300,
          decoration: TextDecoration.lineThrough);
    }
    return const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Card(
            elevation: 4,
            clipBehavior: Clip.hardEdge,
            child: Image(
              image: AssetImage("assets/product.jpeg"),
              fit: BoxFit.cover,
            )),
        Text(
          product.name,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("\$${product.price.toStringAsFixed(2)}",
                style: getMainPriceStyles()),
            if (product.offerPrice != null)
              Text(
                "\$${product.offerPrice!.toStringAsFixed(2)}",
                style: const TextStyle(
                    fontSize: 20,
                    color: Colors.red,
                    fontWeight: FontWeight.w600),
              )
          ],
        )
      ],
    );
  }
}
