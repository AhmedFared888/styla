import 'package:flutter/material.dart';
import 'package:styla/core/resources/assets_manager.dart';
import 'package:styla/core/resources/color_manager.dart';
import 'package:styla/core/resources/strings_manager.dart';
import 'package:styla/features/account/presentation/views/account_view.dart';
import 'package:styla/features/cart/presentation/views/cart_view.dart';
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
    const HomeView(),
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
          const BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(AssetsManager.home)),
            label: StringsManager.home,
          ),
          const BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(AssetsManager.search)),
            label: StringsManager.search,
          ),
          const BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(AssetsManager.saved)),
            label: StringsManager.saved,
          ),
          const BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(AssetsManager.cart)),
            label: StringsManager.cart,
          ),
          const BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(AssetsManager.account)),
            label: StringsManager.account,
          ),
        ],
      ),
    );
  }
}
