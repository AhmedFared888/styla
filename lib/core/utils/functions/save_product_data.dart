import 'package:hive/hive.dart';
import 'package:styla/features/home/domain/entities/product_entity/product_entity.dart';

void saveProductData(List<ProductEntity> products, String boxName) {
  var box = Hive.box<ProductEntity>(boxName);
  box.addAll(products);
}
