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

  @HiveField(3)
  final int? productId;

  @HiveField(4)
  final String? category;

  @HiveField(5)
  final String? description;

  ProductEntity({
    required this.productImage,
    required this.productName,
    required this.productPrice,
    this.productId,
    this.category,
    this.description,
  });
}
