import 'package:flutter/material.dart';
import 'package:styla/core/resources/color_manager.dart';
import 'package:styla/core/resources/styles_manager.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Search',
          style: StylesManager.textStyle24Sem(ColorManager.primaryColor),
        ),
      ),
    );
  }
}
