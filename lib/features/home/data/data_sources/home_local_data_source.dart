import 'package:hive_flutter/hive_flutter.dart';
import 'package:styla/constants.dart';
import 'package:styla/features/home/domain/entities/category_entity/category_entity.dart';
import 'package:styla/features/home/domain/entities/product_entity/product_entity.dart';

abstract class HomeLocalDataSource {
  List<CategoryEntity> getAllCategory();
  List<ProductEntity> getAllProducts();
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<CategoryEntity> getAllCategory() {
    var box = Hive.box<CategoryEntity>(kCategoryBox);
    return box.values.toList();
  }

  @override
  List<ProductEntity> getAllProducts() {
    var box = Hive.box<ProductEntity>(kProductBox);
    return box.values.toList();
  }
}
