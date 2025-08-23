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
          if (state is AllProductSuccess) {
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
            return Center(
              child: Text(state.errorMessage),
            );
          } else {
            return const CustomLoadingIndicator();
          }
        },
      ),
    );
  }
}
