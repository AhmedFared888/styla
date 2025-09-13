import 'package:styla/features/home/domain/entities/product_entity/product_entity.dart';

import 'rating.dart';

class ProductModel extends ProductEntity {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;

  ProductModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  }) : super(
         productImage: image ?? 'There is no product',
         productName: title ?? 'There is no product',
         productPrice: price ?? 0.0,
         description: description ?? 'There is no product',
         productId: id ?? 0,
         category: category ?? 'There is no product',
       );

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    // print('🔍 Parsing product JSON: $json');
    // print('🔍 Category field value: ${json['category']}');
    // print('🔍 Category field type: ${json['category']?.runtimeType}');

    final product = ProductModel(
      id: json['id'] as int?,
      title: json['title'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      description: json['description'] as String?,
      category: json['category'] as String?,
      image: json['image'] as String?,
      rating: json['rating'] == null
          ? null
          : Rating.fromJson(json['rating'] as Map<String, dynamic>),
    );

    // print('🔍 Parsed product category: ${product.category}');
    return product;
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'price': price,
    'description': description,
    'category': category,
    'image': image,
    'rating': rating?.toJson(),
  };
}
