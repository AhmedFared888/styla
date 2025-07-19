import 'package:flutter/material.dart';
import 'package:styla/core/resources/color_manager.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: ColorManager.white,
        backgroundColor: ColorManager.black,
      ),
    );
  }
}
