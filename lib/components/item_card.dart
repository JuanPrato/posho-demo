import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Card(
            elevation: 4,
            clipBehavior: Clip.hardEdge,
            child: Image(
              image: AssetImage("assets/product.jpeg"),
              fit: BoxFit.cover,
            )),
        Text(
          "Alitas picantes",
          style: TextStyle(
            fontSize: 22,
          ),
        ),
        Text(
          "\$2000",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );
  }
}
