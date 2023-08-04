import 'package:flutter/material.dart';
import 'package:posho/components/item_card.dart';
import 'package:posho/components/slider_item.dart';

class BestOfMenu extends StatelessWidget {
  const BestOfMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Platos más pedidos",
        style: TextStyle(
          fontSize: 24,
          color: Colors.black,
          fontWeight: FontWeight.bold,
          height: 2
        ),),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children:[
              SliderItem(),
              SliderItem(),
              SliderItem(),
            ]
          )
        ),
      ],
    );
  }
}
