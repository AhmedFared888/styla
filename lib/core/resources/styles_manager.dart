import 'package:flutter/widgets.dart';
import 'package:styla/core/resources/font_manager.dart';
import 'package:styla/core/resources/values_manager.dart';

abstract class StylesManager {
  static TextStyle textStyle10Med(Color color) {
    return TextStyle(
      fontSize: FontSizeManager.s10,
      fontWeight: FontWeightManager.medium,
      color: color,
    );
  }

  static TextStyle textStyle12Reg(Color color) {
    return TextStyle(
      fontSize: FontSizeManager.s12,
      fontWeight: FontWeightManager.regular,
      color: color,
    );
  }

  static TextStyle textStyle12Med(Color color) {
    return TextStyle(
      fontSize: FontSizeManager.s12,
      fontWeight: FontWeightManager.medium,
      color: color,
    );
  }

  static TextStyle textStyle12Sem(Color color) {
    return TextStyle(
      fontSize: FontSizeManager.s12,
      fontWeight: FontWeightManager.semiBold,
      color: color,
    );
  }

  static TextStyle textStyle14Reg(Color color) {
    return TextStyle(
      fontSize: FontSizeManager.s14,
      fontWeight: FontWeightManager.regular,
      color: color,
    );
  }

  static TextStyle textStyle14Med(Color color) {
    return TextStyle(
      fontSize: FontSizeManager.s14,
      fontWeight: FontWeightManager.medium,
      color: color,
    );
  }

  static TextStyle textStyle14Sem(Color color) {
    return TextStyle(
      fontSize: FontSizeManager.s14,
      fontWeight: FontWeightManager.semiBold,
      color: color,
    );
  }

  static TextStyle textStyle16Reg(Color color) {
    return TextStyle(
      fontSize: FontSizeManager.s16,
      fontWeight: FontWeightManager.regular,
      color: color,
    );
  }

  static TextStyle textStyle16Med(Color color) {
    return TextStyle(
      fontSize: FontSizeManager.s16,
      fontWeight: FontWeightManager.medium,
      color: color,
    );
  }

  static TextStyle textStyle16Sem(Color color) {
    return TextStyle(
      fontSize: FontSizeManager.s16,
      fontWeight: FontWeightManager.semiBold,
      color: color,
    );
  }

  static TextStyle textStyle20Med(Color color) {
    return TextStyle(
      fontSize: FontSizeManager.s20,
      fontWeight: FontWeightManager.medium,
      color: color,
    );
  }

  static TextStyle textStyle20Sem(Color color) {
    return TextStyle(
      fontSize: FontSizeManager.s20,
      fontWeight: FontWeightManager.semiBold,
      color: color,
    );
  }

  static TextStyle textStyle24Sem(Color color) {
    return TextStyle(
      fontSize: FontSizeManager.s24,
      fontWeight: FontWeightManager.semiBold,
      color: color,
    );
  }

  static TextStyle textStyle32Sem(Color color) {
    return TextStyle(
      fontSize: FontSizeManager.s32,
      fontWeight: FontWeightManager.semiBold,
      color: color,
    );
  }

  static TextStyle textStyle64Sem(Color color) {
    return TextStyle(
      fontSize: FontSizeManager.s64,
      fontWeight: FontWeightManager.semiBold,
      height: AppSize.s_8,
      color: color,
    );
  }
}
