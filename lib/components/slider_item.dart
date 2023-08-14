import 'package:flutter/material.dart';
import 'package:posho/models/product.dart';

class SliderItem extends StatelessWidget {
  const SliderItem({super.key, required this.item});

  final Product item;

  @override
  Widget build(BuildContext context) {
    print(item);
    return Card(
        elevation: 4,
        clipBehavior: Clip.hardEdge,
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            const Image(
              image: AssetImage("assets/product.jpeg"),
              fit: BoxFit.cover,
              height: 250,
              width: 350,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      "\$${item.price.toStringAsFixed(2).replaceAll(".", ",")}",
                      style: const TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.w500)),
                  Text(
                    item.name,
                    style: const TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
