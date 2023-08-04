import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:posho/components/coupon.dart';

class Coupons extends StatelessWidget {
  const Coupons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Cupones",
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
        CarouselSlider(
            items: [Coupon(), Coupon()],
            options: CarouselOptions(
              height: 500,
            )
        )
      ],
    );
  }
}
