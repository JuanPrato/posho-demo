import 'dart:async';

import 'package:flutter/material.dart';
import 'package:posho/models/coupon.dart';

class CouponCard extends StatefulWidget {
  const CouponCard({super.key, required this.coupon});

  final Coupon coupon;

  @override
  State<CouponCard> createState() => _CouponCard();
}

class _CouponCard extends State<CouponCard> {
  double scale = 1;
  late Timer t;

  @override
  void initState() {
    super.initState();
    t = Timer.periodic(const Duration(milliseconds: 800), (timer) {
      if (!mounted) return;
      setState(() {
        scale = scale == 1 ? 1.1 : 1;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    t.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.only(bottom: 10, right: 10),
        elevation: 8,
        clipBehavior: Clip.hardEdge,
        child: Stack(alignment: Alignment.centerLeft, children: [
          const Image(
            image: AssetImage("assets/coupons.png"),
            height: 600,
            fit: BoxFit.cover,
          ),
          Container(
            height: 500,
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text(
                    widget.coupon.title,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                              color: Colors.white,
                              offset: Offset(10, 10),
                              blurRadius: 15)
                        ]),
                  ),
                ),
                AnimatedScale(
                  scale: scale,
                  duration: const Duration(milliseconds: 800),
                  child: TextButton(
                    onPressed: () {},
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.red),
                      padding: MaterialStatePropertyAll(EdgeInsets.all(16)),
                    ),
                    child: const Text("OBTENER DESCUENTO",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          )
        ]));
  }
}
