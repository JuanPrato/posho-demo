import 'package:flutter/material.dart';
import 'package:posho/components/slider_item.dart';
import 'package:posho/models/product.dart';
import 'package:shimmer/shimmer.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class BestOfMenu extends StatelessWidget {
  BestOfMenu({super.key});

  final _products =
      Supabase.instance.client.from("products").select().eq("best", true);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Platos más pedidos",
          style: TextStyle(
              fontSize: 24,
              color: Colors.black,
              fontWeight: FontWeight.bold,
              height: 2),
        ),
        FutureBuilder(
          future: _products,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const BestMenuSliderSkeleton();
            }
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  children: snapshot.data
                      .map<Product>(Product.getProductFromSnapshot)
                      .map<SliderItem>((p) => SliderItem(item: p))
                      .toList()),
            );
          },
        ),
      ],
    );
  }
}

class BestMenuSliderSkeleton extends StatelessWidget {
  const BestMenuSliderSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: const SingleChildScrollView(
        child: Row(
          children: [
            SizedBox(
              height: 250,
              width: 350,
              child: Card(),
            ),
            SizedBox(
              height: 250,
              width: 350,
              child: Card(),
            ),
          ],
        ),
      ),
    );
  }
}
