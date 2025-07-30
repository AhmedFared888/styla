import 'package:styla/constants.dart';
import 'package:styla/core/utils/api_service.dart';
import 'package:styla/core/utils/functions/save_category_data.dart';
import 'package:styla/core/utils/functions/save_product_data.dart';
import 'package:styla/features/home/data/models/category_model/category_model.dart';
import 'package:styla/features/home/data/models/product_model/product_model.dart';
import 'package:styla/features/home/domain/entities/category_entity/category_entity.dart';
import 'package:styla/features/home/domain/entities/product_entity/product_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<CategoryEntity>> getAllCategory();
  Future<List<ProductEntity>> getAllProducts();
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

  @override
  Future<List<ProductEntity>> getAllProducts() async {
    final response = await apiService.get(endPoint: 'products');
    final List<dynamic> data = response as List<dynamic>;
    final products = data
        .map((item) => ProductModel.fromJson(item as Map<String, dynamic>))
        .toList();
    saveProductData(products, kProductBox);
    return products;
  }
}
