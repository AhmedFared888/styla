import 'package:flutter/material.dart';
import 'package:styla/core/resources/color_manager.dart';
import 'package:styla/core/resources/styles_manager.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Cart',
          style: StylesManager.textStyle24Sem(ColorManager.primaryColor),
        ),
      ),
    );
  }
}
