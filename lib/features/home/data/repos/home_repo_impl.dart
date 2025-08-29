import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:styla/core/errors/failure.dart';
import 'package:styla/features/home/data/data_sources/home_local_data_source.dart';
import 'package:styla/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:styla/features/home/domain/entities/category_entity/category_entity.dart';
import 'package:styla/features/home/domain/entities/product_entity/product_entity.dart';
import 'package:styla/features/home/domain/repos/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepoImpl({
    required this.homeRemoteDataSource,
    required this.homeLocalDataSource,
  });

  @override
  Future<Either<Failure, List<CategoryEntity>>> getAllCategory() async {
    try {
      var categoryLocal = homeLocalDataSource.getAllCategory();
      print("🔍 Categories from local storage: ${categoryLocal.length}");
      if (categoryLocal.isNotEmpty) {
        print("✅ Using categories from local storage");
        return right(categoryLocal);
      }
      print("🔄 Fetching categories from remote API");
      var categories = await homeRemoteDataSource.getAllCategory();
      return right(categories);
    } catch (e, s) {
      print(e);
      print(s);
      if (e is DioException) {
        return left(ServerFailre.fromDioException(e));
      } else {
        return left(ServerFailre(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getAllProducts() async {
    try {
      var productLocal = homeLocalDataSource.getAllProducts();
      print("🔍 Products from local storage: ${productLocal.length}");
      if (productLocal.isNotEmpty) {
        print("✅ Using products from local storage");
        print(
          "🔍 Sample local product categories: ${productLocal.take(3).map((p) => p.category).toList()}",
        );
        return right(productLocal);
      }
      print("🔄 Fetching products from remote API");
      var products = await homeRemoteDataSource.getAllProducts();
      return right(products);
    } catch (e, s) {
      print(e);
      print(s);
      if (e is DioException) {
        return left(ServerFailre.fromDioException(e));
      } else {
        return left(ServerFailre(e.toString()));
      }
    }
  }

  // Method to clear local storage and force fresh API calls
  Future<void> clearLocalStorage() async {
    print("🧹 Clearing local storage to force fresh API calls");
    await homeLocalDataSource.clearAllData();
  }
}
