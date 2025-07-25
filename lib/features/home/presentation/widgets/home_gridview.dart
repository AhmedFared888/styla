import 'package:flutter/material.dart';
import 'package:styla/core/resources/values_manager.dart';
import 'package:styla/features/home/presentation/widgets/home_gridview_item.dart';

class HomeGridView extends StatelessWidget {
  const HomeGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, //  2 columns
          mainAxisSpacing: AppSize.s20,
          crossAxisSpacing: AppSize.s20,
          childAspectRatio: 2 / 3,
        ),
        itemBuilder: (context, index) {
          return const HomeGridViewItem();
        },
        itemCount: 10,
      ),
    );
  }
}
