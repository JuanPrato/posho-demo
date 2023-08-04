import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 8,
          clipBehavior: Clip.hardEdge,
          child: const Image(
              image: AssetImage("assets/product.jpeg"),
              fit: BoxFit.cover,
          )
        ),
        Text("Alitas picantes",
        style: TextStyle(fontSize: 22, ),),
        Text("\$2000", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),)
      ],
    );
  }
}
