import 'package:flutter/material.dart';
import 'package:styla/core/resources/color_manager.dart';
import 'package:styla/core/resources/strings_manager.dart';
import 'package:styla/core/resources/styles_manager.dart';
import 'package:styla/core/resources/values_manager.dart';
import 'package:styla/core/widgets/custom_elevated_button.dart';
import 'package:styla/core/widgets/custom_text_form_feild.dart';

class ForgetPasswordViewBody extends StatelessWidget {
  ForgetPasswordViewBody({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailTextEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSize.s24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  StringsManager.forgotPassword,
                  style: StylesManager.textStyle32Sem(
                    ColorManager.primaryColor,
                  ),
                ),
                const SizedBox(height: AppSize.s8),
                Text(
                  StringsManager.ressetPasswordText,
                  style: StylesManager.textStyle16Reg(ColorManager.grey),
                ),
                const SizedBox(height: AppSize.s24),
                Text(
                  StringsManager.email,
                  style: StylesManager.textStyle16Med(
                    ColorManager.primaryColor,
                  ),
                ),
                const SizedBox(height: AppSize.s6),
                CustomTextFormField(
                  textEditingController: _emailTextEditingController,
                  hintText: StringsManager.emailAdress,
                  labelText: StringsManager.enterYourEmailAdress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email cannot be empty';
                    } else if (!value.contains('@')) {
                      return 'Enter a valid email';
                    }
                    return null;
                  },
                ),
                const Spacer(),
                CustomElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {}
                  },
                  title: StringsManager.send,
                ),
                const SizedBox(height: AppSize.s24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
