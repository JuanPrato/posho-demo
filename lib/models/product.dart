import 'package:supabase_flutter/supabase_flutter.dart';

class Product {
  int id;
  String name;
  double price;
  double? offerPrice;
  bool best;

  Product(this.id, this.name, this.price, this.offerPrice, this.best);

  static Product getProductFromSnapshot(dynamic sp) {
    return Product(
        sp["id"],
        sp["name"].toString(),
        toDouble(sp["price"]) ?? 0.0,
        toDouble(sp["offer_price"]),
        sp["best"] ?? false);
  }
}
