import 'package:flutter/material.dart';
import 'package:styla/core/resources/values_manager.dart';
import 'package:styla/features/home/presentation/widgets/category_listview.dart';
import 'package:styla/features/home/presentation/widgets/home_gridview.dart';
import 'package:styla/features/home/presentation/widgets/search_section.dart';
import 'package:styla/features/home/presentation/widgets/title_section.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSize.s18),
          child: Column(
            children: [
              TitleSection(),
              SizedBox(height: AppSize.s8),
              SearchSection(),
              SizedBox(height: AppSize.s16),
              CategoryListView(),
              SizedBox(height: AppSize.s24),
              HomeGridView(),
            ],
          ),
        ),
      ),
    );
  }
}
