import 'package:hive/hive.dart';

part 'product_entity.g.dart';

@HiveType(typeId: 1)
class ProductEntity {
  @HiveField(0)
  final String productImage;

  @HiveField(1)
  final String productName;

  @HiveField(2)
  final double productPrice;

  ProductEntity({
    required this.productImage,
    required this.productName,
    required this.productPrice,
  });
}
