import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:styla/core/resources/values_manager.dart';
import 'package:styla/core/widgets/custom_loading_indicator.dart';
import 'package:styla/features/home/presentation/manager/all_product_cubit/all_product_cubit.dart';
import 'package:styla/features/home/presentation/widgets/home_gridview_item.dart';

class HomeGridView extends StatelessWidget {
  const HomeGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<AllProductCubit, AllProductState>(
        builder: (context, state) {
          // print("🔄 HomeGridView rebuilding with state: ${state.runtimeType}");

          if (state is AllProductSuccess) {
            // print(
            //   "✅ HomeGridView: Success state with ${state.products.length} products",
            // );
            // print(
            //   "🔍 Products in grid: ${state.products.take(3).map((p) => '${p.productName} (${p.category})').toList()}",
            // );

            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, //  2 columns
                mainAxisSpacing: AppSize.s20,
                crossAxisSpacing: AppSize.s20,
                childAspectRatio: 2.5 / 3.5,
              ),
              itemBuilder: (context, index) {
                return HomeGridViewItem(
                  productEntity: state.products[index],
                );
              },
              itemCount: state.products.length,
            );
          } else if (state is AllProductFailure) {
            // print(
            //   "❌ HomeGridView: Failure state with error: ${state.errorMessage}",
            // );
            return Center(
              child: Text(state.errorMessage),
            );
          } else {
            //print("⏳ HomeGridView: Loading/Initial state");
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomLoadingIndicator(),
                  SizedBox(height: 16),
                  Text(
                    "Loading products...",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
