import 'package:flutter/material.dart';
import 'package:styla/core/resources/color_manager.dart';
import 'package:styla/core/resources/styles_manager.dart';

class AccountViewBody extends StatelessWidget {
  const AccountViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Account',
          style: StylesManager.textStyle24Sem(ColorManager.primaryColor),
        ),
      ),
    );
  }
}
