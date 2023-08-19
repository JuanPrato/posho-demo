class CategoryModel {
  String name;

  CategoryModel(this.name);

  static CategoryModel getCategoryFromSnapshot(dynamic snapshot) {
    return CategoryModel(snapshot["name"]);
  }
}
