import 'package:styla/features/home/domain/entities/category_entity.dart';

class CategoryModel extends CategoryEntity {
  final String category;
  CategoryModel({required this.category}) : super(categoryName: category);

  factory CategoryModel.fromJson(String json) {
    return CategoryModel(category: json);
  }
  static List<CategoryModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((e) => CategoryModel.fromJson(e)).toList();
  }
}
