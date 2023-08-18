import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:posho/components/coupon.dart';
import 'package:posho/main.dart';
import 'package:posho/models/coupon.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Coupons extends StatelessWidget {
  Coupons({super.key});
  final Stream<List<dynamic>> _coupons = Supabase.instance.client
      .from("coupons")
      .select<List<dynamic>>()
      .eq("active", true)
      .asStream();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Cupones",
              style: TextStyle(
                  fontSize: 24, fontWeight: FontWeight.bold, height: 2),
            ),
            TextButton(
              child: const Text("Ver más", style: TextStyle(fontSize: 16)),
              onPressed: () {
                context.read<Navigation>().navigate("/coupons");
              },
            )
          ],
        ),
        StreamBuilder<List<dynamic>>(
            stream: _coupons,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const CouponsSkeleton();
              }
              return CarouselSlider(
                  items: snapshot.data
                      ?.map<Coupon>((c) => Coupon.getCouponFromSnapshot(c))
                      .map((c) => CouponCard(coupon: c))
                      .toList(),
                  options: CarouselOptions(
                    height: 500,
                  ));
            })
      ],
    );
  }
}

class CouponsSkeleton extends StatelessWidget {
  const CouponsSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: const SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(
                height: 500,
                width: 300,
                child: const Card(),
              ),
              const SizedBox(
                height: 500,
                width: 300,
                child: Card(),
              ),
            ],
          ),
        ));
  }
}
