import 'package:styla/core/utils/api_service.dart';
import 'package:styla/features/home/data/models/category_model.dart';
import 'package:styla/features/home/domain/entities/category_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<CategoryEntity>> getAllCategory();
}

class HomeRemoteDataSourceImple extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImple(this.apiService);
  @override
  Future<List<CategoryEntity>> getAllCategory() async {
    var response = await apiService.get(endPoint: 'products/categories/');
    final List<dynamic> data = response as List<dynamic>;
    return CategoryModel.fromJsonList(data);
  }
}
