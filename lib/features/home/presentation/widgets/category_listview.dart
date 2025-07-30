import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:styla/core/resources/values_manager.dart';
import 'package:styla/core/utils/functions/service_locator.dart';
import 'package:styla/features/home/domain/usecases/home_usecase.dart';
import 'package:styla/features/home/presentation/manager/cubit/category_cubit.dart';
import 'package:styla/features/home/presentation/widgets/category_listview_item.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryCubit(getIt.get<HomeUsecase>()),
      child: SizedBox(
        height: AppSize.s40,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return const CategoryListViewItem();
          },
          itemCount: 10,
        ),
      ),
    );
  }
}
