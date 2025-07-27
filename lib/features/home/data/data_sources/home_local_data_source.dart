import 'package:hive_flutter/hive_flutter.dart';
import 'package:styla/constants.dart';
import 'package:styla/features/home/domain/entities/category_entity.dart';

abstract class HomeLocalDataSource {
  List<CategoryEntity> getAllCategory();
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<CategoryEntity> getAllCategory() {
    var box = Hive.box<CategoryEntity>(kCategoryBox);
    return box.values.toList();
  }
}
