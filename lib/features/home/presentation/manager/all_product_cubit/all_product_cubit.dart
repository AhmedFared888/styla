import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:styla/features/home/domain/entities/product_entity/product_entity.dart';
import 'package:styla/features/home/domain/usecases/allproducts_usecase.dart';

part 'all_product_state.dart';

class AllProductCubit extends Cubit<AllProductState> {
  AllProductCubit(this.allproductsUsecase) : super(AllProductInitial());
  final AllproductsUsecase allproductsUsecase;

  Future<void> getAllProducts() async {
    try {
      emit(AllProductLoading());
      var result = await allproductsUsecase.execute();
      result.fold(
        (failure) {
          print("❌ Product Error: $failure");
          emit(AllProductFailure(errorMessage: failure.message));
        },
        (products) {
          print("✅ Products Loaded: ${products.length}");
          emit(AllProductSuccess(products: products));
        },
      );
    } catch (e, stackTrace) {
      print("❌ Unexpected error in AllProductCubit: $e");
      print("Stack trace: $stackTrace");
      emit(AllProductFailure(errorMessage: "An unexpected error occurred"));
    }
  }
}
