import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:styla/features/home/domain/entities/product_entity/product_entity.dart';
import 'package:styla/features/home/domain/usecases/allproducts_usecase.dart';

part 'all_product_state.dart';

enum FilterOption { none, lowToHigh, highToLow }

class AllProductCubit extends Cubit<AllProductState> {
  AllProductCubit(this.allproductsUsecase) : super(AllProductInitial());
  final AllproductsUsecase allproductsUsecase;
  List<ProductEntity> allProducts = [];
  List<ProductEntity> searchedProducts = [];

  Future<void> getAllProducts() async {
    try {
      //print("🔄 AllProductCubit: Getting all products");
      emit(AllProductLoading());
      var result = await allproductsUsecase.execute();
      result.fold(
        (failure) {
          //  print("❌ Product Error: $failure");
          emit(AllProductFailure(errorMessage: failure.message));
        },
        (products) {
          // print("✅ Products Loaded: ${products.length}");
          allProducts = products;
          // print(
          //   "🔍 Available categories in products: ${products.map((p) => p.category).toSet().toList()}",
          // );
          // print(
          //   "🔄 AllProductCubit: Emitting AllProductSuccess with ${products.length} products",
          // );
          emit(AllProductSuccess(products: products)); // default = all products
        },
      );
    } catch (e, stackTrace) {
      // print("❌ Unexpected error in AllProductCubit: $e");
      // print("Stack trace: $stackTrace");
      emit(AllProductFailure(errorMessage: "An unexpected error occurred"));
    }
  }

  void filterByCategory(String category) {
    // print("🔍 Filtering products by category: '$category'");
    // print("🔍 Total products available: ${allProducts.length}");

    // Show loading state while filtering
    emit(AllProductLoading());

    if (category == 'All') {
      // print("✅ Showing all products: ${allProducts.length}");
      // print("🔄 AllProductCubit: Emitting AllProductSuccess with all products");
      emit(AllProductSuccess(products: allProducts));
    } else {
      final filtered = allProducts
          .where(
            (p) =>
                p.category != null &&
                p.category!.toLowerCase() == category.toLowerCase(),
          )
          .toList();
      // print("✅ Filtered products for '$category': ${filtered.length}");
      // print(
      //   "🔍 Found products: ${filtered.map((p) => '${p.productName} (${p.category})').toList()}",
      // );
      // print(
      //   "🔄 AllProductCubit: Emitting AllProductSuccess with ${filtered.length} filtered products",
      // );
      emit(AllProductSuccess(products: filtered));
    }
  }

  void searchFunction(String keyword) {
    searchedProducts = allProducts.where((product) {
      final title = product.productName.toString().toLowerCase();
      final input = keyword.toLowerCase();
      return title.startsWith(input);
    }).toList();
    emit(AllProductSuccess(products: searchedProducts));
  }

  void sortByHighToLowPrice() {
    searchedProducts = List<ProductEntity>.from(allProducts);
    searchedProducts.sort((a, b) => b.productPrice.compareTo(a.productPrice));
    emit(AllProductSuccess(products: searchedProducts));
  }

  void sortByLowToHightPrice() {
    searchedProducts = List<ProductEntity>.from(allProducts);
    searchedProducts.sort((a, b) => a.productPrice.compareTo(b.productPrice));
    emit(AllProductSuccess(products: searchedProducts));
  }
}
