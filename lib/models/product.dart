import 'package:supabase_flutter/supabase_flutter.dart';

class Product {
  int id;
  String name;
  double price;
  double offerPrice;
  bool best;

  Product(this.id, this.name, this.price, this.offerPrice, this.best);

  static Product getProductFromSnapshot(dynamic sp) {
    print(sp);
    return Product(
        sp["id"],
        sp["name"].toString(),
        toDouble(sp["price"]) ?? 0.0,
        toDouble(["offer_price"]) ?? 0.0,
        sp["best"] ?? false);
  }
}
