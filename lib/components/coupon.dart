import 'dart:async';

import 'package:flutter/material.dart';

class Coupon extends StatefulWidget {
  const Coupon({super.key});

  @override
  State<Coupon> createState() => _Coupon();
}

class _Coupon extends State<Coupon> {

  double scale = 1;

  @override
  void initState() {
    super.initState();
    Timer t = Timer.periodic(const Duration(milliseconds: 800), (timer) {
      setState(() {
        scale = scale == 1 ? 1.1 : 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10, right: 10),
      elevation: 8,
      clipBehavior: Clip.hardEdge,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Image(
            image: AssetImage("assets/coupons.png"),
            height: 600,
            fit: BoxFit.cover,
          ),
          Container(
            height: 500,
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Text(
                    "2x1 EN POLLOS",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          color: Colors.white,
                          offset: Offset(10, 10),
                          blurRadius: 15
                        )
                      ]
                    ),
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
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                      )
                    ),
                  ),
                ),
              ],
            ),
          )
        ]
      )
    );
  }
}
