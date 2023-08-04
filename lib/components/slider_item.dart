import 'package:flutter/material.dart';

class SliderItem extends StatelessWidget {
  const SliderItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      elevation: 4,
      clipBehavior: Clip.hardEdge,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Image(
            image: AssetImage("assets/product.jpeg"),
            fit: BoxFit.cover,
            height: 250,
            width: 350,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "\$1500",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.w500
                  )
                ),
                Text(
                  "Alitas picantes",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.w600
                  ),
                )
              ],
            ),
          )
        ],
      )
    );
  }
}
