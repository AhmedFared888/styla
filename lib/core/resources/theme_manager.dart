import 'package:flutter/material.dart';
import 'package:styla/constants.dart';
import 'package:styla/core/resources/color_manager.dart';
import 'package:styla/core/resources/styles_manager.dart';
import 'package:styla/core/resources/values_manager.dart';

ThemeData getApptheme() {
  return ThemeData(
    // main colors
    primaryColor: ColorManager.primaryColor,
    scaffoldBackgroundColor: ColorManager.white,
    fontFamily: kGeneralSans,

    // appbar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      titleTextStyle: StylesManager.textStyle24Sem(ColorManager.primaryColor),
    ),

    // elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: ColorManager.white,
        textStyle: StylesManager.textStyle16Med(ColorManager.white),
        backgroundColor: ColorManager.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s10),
        ),
      ),
    ),

    // input decoration theme (text form field)
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: ColorManager.white,

      // input padding
      contentPadding: const EdgeInsets.all(AppPadding.p8),

      // hint style
      hintStyle: StylesManager.textStyle16Reg(ColorManager.lightGrey),

      //lable style
      labelStyle: StylesManager.textStyle14Med(ColorManager.grey),

      // error style
      errorStyle: StylesManager.textStyle14Med(ColorManager.error),

      // enabled border style
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.lightGrey,
          width: AppSize.s1_5,
        ),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s10)),
      ),

      // focused border style
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.primaryColor,
          width: AppSize.s1_5,
        ),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s10)),
      ),

      // error border style
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.error, width: AppSize.s1_5),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s10)),
      ),

      // error border style
      focusedErrorBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.primaryColor,
          width: AppSize.s1_5,
        ),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s10)),
      ),
    ),

    // textTheme: TextTheme(
    //   bodyLarge: StylesManager.textStyle17(ColorManager.primaryColor),
    // ),
  );
}
