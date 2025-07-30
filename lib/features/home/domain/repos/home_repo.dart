import 'package:dartz/dartz.dart';
import 'package:styla/core/errors/failure.dart';
import 'package:styla/features/home/domain/entities/category_entity/category_entity.dart';
import 'package:styla/features/home/domain/entities/product_entity/product_entity.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<CategoryEntity>>> getAllCategory();
  Future<Either<Failure, List<ProductEntity>>> getAllProducts();
}
