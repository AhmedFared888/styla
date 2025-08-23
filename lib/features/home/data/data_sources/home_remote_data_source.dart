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
    try {
      final response = await apiService.get(endPoint: 'products/categories/');

      if (response == null) {
        print('❌ Categories API returned null response');
        return [];
      }

      if (response is! List) {
        print(
          '❌ Categories API returned unexpected format: ${response.runtimeType}',
        );
        return [];
      }

      final List<dynamic> data = response;
      final categories = CategoryModel.fromJsonList(data);
      saveCategoryData(categories, kCategoryBox);
      return categories;
    } catch (e) {
      print('❌ Error fetching categories: $e');
      return [];
    }
  }

  @override
  Future<List<ProductEntity>> getAllProducts() async {
    try {
      final response = await apiService.get(endPoint: 'products');

      if (response == null) {
        print('❌ Products API returned null response');
        return [];
      }

      if (response is! List) {
        print(
          '❌ Products API returned unexpected format: ${response.runtimeType}',
        );
        return [];
      }

      final List<dynamic> data = response;
      final products = data
          .where((item) => item != null)
          .map((item) {
            try {
              return ProductModel.fromJson(item as Map<String, dynamic>);
            } catch (e) {
              print('❌ Error parsing product: $e');
              return null;
            }
          })
          .where((product) => product != null)
          .cast<ProductEntity>()
          .toList();

      saveProductData(products, kProductBox);
      return products;
    } catch (e) {
      print('❌ Error fetching products: $e');
      return [];
    }
  }
}
