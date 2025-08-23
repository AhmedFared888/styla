import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:styla/core/resources/assets_manager.dart';
import 'package:styla/core/resources/color_manager.dart';
import 'package:styla/core/resources/strings_manager.dart';
import 'package:styla/core/utils/functions/service_locator.dart';
import 'package:styla/features/account/presentation/views/account_view.dart';
import 'package:styla/features/cart/presentation/views/cart_view.dart';
import 'package:styla/features/home/domain/usecases/allproducts_usecase.dart';
import 'package:styla/features/home/domain/usecases/categories_usecase.dart';
import 'package:styla/features/home/presentation/manager/all_product_cubit/all_product_cubit.dart';
import 'package:styla/features/home/presentation/manager/category_cubit/category_cubit.dart';
import 'package:styla/features/home/presentation/views/home_view.dart';
import 'package:styla/features/saved/presentation/views/saved_view.dart';
import 'package:styla/features/search/presentation/views/search_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _currentIndex = 0;

  final List<Widget> _views = [
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            try {
              final cubit = CategoryCubit(getIt.get<CategoriesUsecase>());
              cubit.getAllCategories();
              return cubit;
            } catch (e) {
              print("❌ Error creating CategoryCubit: $e");
              return CategoryCubit(getIt.get<CategoriesUsecase>());
            }
          },
        ),
        BlocProvider(
          create: (context) {
            try {
              final cubit = AllProductCubit(getIt.get<AllproductsUsecase>());
              cubit.getAllProducts();
              return cubit;
            } catch (e) {
              print("❌ Error creating AllProductCubit: $e");
              return AllProductCubit(getIt.get<AllproductsUsecase>());
            }
          },
        ),
      ],
      child: const HomeView(),
    ),
    const SearchView(),
    const SavedView(),
    const CartView(),
    const AccountView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _views[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: ColorManager.primaryColor,
        unselectedItemColor: ColorManager.lightGrey,

        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AssetsManager.home,
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                _currentIndex == 0
                    ? ColorManager.primaryColor
                    : ColorManager.lightGrey,
                BlendMode.srcIn,
              ),
            ),
            label: StringsManager.home,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AssetsManager.search,
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                _currentIndex == 1
                    ? ColorManager.primaryColor
                    : ColorManager.lightGrey,
                BlendMode.srcIn,
              ),
            ),
            label: StringsManager.search,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AssetsManager.favorite,
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                _currentIndex == 2
                    ? ColorManager.primaryColor
                    : ColorManager.lightGrey,
                BlendMode.srcIn,
              ),
            ),
            label: StringsManager.saved,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AssetsManager.cart,
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                _currentIndex == 3
                    ? ColorManager.primaryColor
                    : ColorManager.lightGrey,
                BlendMode.srcIn,
              ),
            ),
            label: StringsManager.cart,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AssetsManager.account,
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                _currentIndex == 4
                    ? ColorManager.primaryColor
                    : ColorManager.lightGrey,
                BlendMode.srcIn,
              ),
            ),
            label: StringsManager.account,
          ),
        ],
      ),
    );
  }
}
