import 'package:hive/hive.dart';
import 'package:styla/features/home/domain/entities/category_entity/category_entity.dart';

void saveCategoryData(List<CategoryEntity> categories, String boxName) {
  var box = Hive.box<CategoryEntity>(boxName);
  box.addAll(categories);
}
