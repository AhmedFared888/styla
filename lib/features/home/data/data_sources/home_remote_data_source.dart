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
        // print('❌ Categories API returned null response');
        return [];
      }

      if (response is! List) {
        // print(
        //   '❌ Categories API returned unexpected format: ${response.runtimeType}',
        // );
        return [];
      }

      final List<dynamic> data = response;
      //print('🔍 Raw categories API response: $data');
      final categories = CategoryModel.fromJsonList(data);
      // print(
      //   '🔍 Parsed categories: ${categories.map((c) => c.categoryName).toList()}',
      // );
      saveCategoryData(categories, kCategoryBox);
      return categories;
    } catch (e) {
      // print('❌ Error fetching categories: $e');
      return [];
    }
  }

  @override
  Future<List<ProductEntity>> getAllProducts() async {
    try {
      final response = await apiService.get(endPoint: 'products');

      if (response == null) {
        // print('❌ Products API returned null response');
        return [];
      }

      if (response is! List) {
        // print(
        //   '❌ Products API returned unexpected format: ${response.runtimeType}',
        // );
        return [];
      }

      final List<dynamic> data = response;
      //print('🔍 Raw products API response sample: ${data.take(2).toList()}');

      // Debug the first product structure
      if (data.isNotEmpty) {
        final firstProduct = data.first as Map<String, dynamic>;
        // print('🔍 First product structure: $firstProduct');
        // print('🔍 First product keys: ${firstProduct.keys.toList()}');
        // print('🔍 First product category value: ${firstProduct['category']}');
        // print(
        //   '🔍 First product category type: ${firstProduct['category']?.runtimeType}',
        // );
      }

      final products = data
          .where((item) => item != null)
          .map((item) {
            try {
              return ProductModel.fromJson(item as Map<String, dynamic>);
            } catch (e) {
              //print('❌ Error parsing product: $e');
              return null;
            }
          })
          .where((product) => product != null)
          .cast<ProductEntity>()
          .toList();

      // Temporary fix: If products don't have categories, assign them based on index
      // This is a workaround until we figure out the actual API structure
      if (products.isNotEmpty && products.first.category == null) {
        // print(
        //   '⚠️ Products don\'t have category information, assigning categories based on index',
        // );
        final categories = [
          'electronics',
          'jewelery',
          'men\'s clothing',
          'women\'s clothing',
        ];
        for (int i = 0; i < products.length; i++) {
          final categoryIndex = i % categories.length;
          // Create a new ProductEntity with the assigned category
          final product = products[i];
          products[i] = ProductEntity(
            productImage: product.productImage,
            productName: product.productName,
            productPrice: product.productPrice,
            productId: product.productId,
            category: categories[categoryIndex],
            description: product.description,
          );
        }
        //print('✅ Assigned categories to products');
      }

      // print(
      //   '🔍 Parsed products sample: ${products.take(2).map((p) => '${p.productName} (${p.category})').toList()}',
      // );
      saveProductData(products, kProductBox);
      return products;
    } catch (e) {
      //print('❌ Error fetching products: $e');
      return [];
    }
  }
}
