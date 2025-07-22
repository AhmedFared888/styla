import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:styla/core/resources/color_manager.dart';
import 'package:styla/core/resources/routes_manager.dart';
import 'package:styla/core/resources/strings_manager.dart';
import 'package:styla/core/resources/styles_manager.dart';
import 'package:styla/core/resources/values_manager.dart';
import 'package:styla/core/widgets/custom_elevated_button.dart';
import 'package:styla/core/widgets/custom_loading_indicator.dart';
import 'package:styla/core/widgets/custom_text_form_feild.dart';
import 'package:styla/features/auth/presentation/forget_password/manager/cubit/forget_password_cubit.dart';

class ForgetPasswordViewBody extends StatelessWidget {
  ForgetPasswordViewBody({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailTextEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, state) {
        if (state is ForgetPasswordLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => const CustomLoadingIndicator(),
          );
        } else if (state is ForgetPasswordSuccess) {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('تم إرسال رابط إلى ${state.email}')),
          );
          GoRouter.of(context).pushReplacement(RoutesManager.loginRoute);
        } else if (state is ForgetPasswordFailure) {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
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
                        if (_formKey.currentState!.validate()) {
                          BlocProvider.of<ForgetPasswordCubit>(
                            context,
                          ).forgetPassword(
                            email: _emailTextEditingController.text.trim(),
                          );
                        }
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
      },
    );
  }
}
