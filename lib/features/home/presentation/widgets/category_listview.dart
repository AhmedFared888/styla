import 'package:flutter/material.dart';
import 'package:styla/core/resources/values_manager.dart';
import 'package:styla/features/home/presentation/widgets/category_listview_item.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.s40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const CategoryListViewItem();
        },
        itemCount: 10,
      ),
    );
  }
}
