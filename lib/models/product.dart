import 'package:posho/models/category.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Product {
  int id;
  String name;
  double price;
  double? offerPrice;
  bool best;
  List<CategoryModel> categories;

  Product(this.id, this.name, this.price, this.offerPrice, this.best,
      this.categories);

  static Product getProductFromSnapshot(dynamic sp) {
    return Product(
        sp["id"],
        sp["name"].toString(),
        toDouble(sp["price"]) ?? 0.0,
        toDouble(sp["offer_price"]),
        sp["best"] ?? false,
        sp["categories"]
                ?.map<CategoryModel>((c) => CategoryModel(c["name"]))
                .toList() ??
            []);
  }
}
