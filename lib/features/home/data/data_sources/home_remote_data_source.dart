import 'package:styla/constants.dart';
import 'package:styla/core/utils/api_service.dart';
import 'package:styla/core/utils/functions/save_category_data.dart';
import 'package:styla/features/home/data/models/category_model/category_model.dart';
import 'package:styla/features/home/domain/entities/category_entity/category_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<CategoryEntity>> getAllCategory();
}

class HomeRemoteDataSourceImple extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImple(this.apiService);
  @override
  Future<List<CategoryEntity>> getAllCategory() async {
    final response = await apiService.get(endPoint: 'products/categories/');
    final List<dynamic> data = response as List<dynamic>;
    final categories = CategoryModel.fromJsonList(data);
    saveCategoryData(categories, kCategoryBox);
    return categories;
  }
}
