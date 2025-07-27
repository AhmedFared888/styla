class CategoryModel {
  final List<String> categories;

  CategoryModel({required this.categories});

  factory CategoryModel.fromJson(List<dynamic> json) {
    return CategoryModel(categories: List<String>.from(json));
  }
}
