class Coupon {
  int id;
  String title;
  int uses;
  int maxUses;

  Coupon(this.id, this.title, this.uses, this.maxUses);

  static Coupon getCouponFromSnapshot(dynamic sp) {
    return Coupon(sp["id"], sp["title"].toString(), sp["uses"], sp["max_uses"]);
  }
}
