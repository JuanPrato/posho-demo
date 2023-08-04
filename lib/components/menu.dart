import 'package:flutter/material.dart';
import 'package:posho/components/item_card.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Nuestro menú",
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                height: 2
              ),
            ),
            TextButton(
              child: const Text("Ver más",
              style: TextStyle(
                fontSize: 16
              )),
              onPressed: () {  },
            )
          ],
        ),
        GridView.count(
          primary: false,
          crossAxisCount: 2,
          shrinkWrap: true,
          children: [
            ItemCard(),
            ItemCard(),
            ItemCard(),
            ItemCard(),
          ],
        ),

      ],
    );
  }
}
