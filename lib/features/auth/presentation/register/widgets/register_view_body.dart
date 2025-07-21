import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:styla/core/resources/assets_manager.dart';
import 'package:styla/core/resources/color_manager.dart';
import 'package:styla/core/resources/routes_manager.dart';
import 'package:styla/core/resources/strings_manager.dart';
import 'package:styla/core/resources/styles_manager.dart';
import 'package:styla/core/resources/values_manager.dart';
import 'package:styla/core/widgets/custom_elevated_button.dart';
import 'package:styla/core/widgets/custom_loading_indicator.dart';
import 'package:styla/core/widgets/custom_text_form_feild.dart';
import 'package:styla/core/widgets/social_media_button.dart';
import 'package:styla/features/auth/presentation/register/manager/cubit/register_cubit.dart';
import 'package:styla/features/auth/presentation/register/widgets/agreeing_text.dart';
import 'package:styla/features/auth/presentation/register/widgets/or_divider.dart';

class RegisterViewBody extends StatelessWidget {
  RegisterViewBody({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _fullNameTextEditingController =
      TextEditingController();
  final TextEditingController _emailTextEditingController =
      TextEditingController();
  final TextEditingController _passwordTextEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => const CustomLoadingIndicator(),
          );
        } else if (state is RegisterSuccess) {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(StringsManager.accountCreatedSuccessfully),
            ),
          );
          GoRouter.of(context).pushReplacement(RoutesManager.homeRoute);
        } else if (state is RegisterFaluire) {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSize.s24),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        StringsManager.createAnAccount,
                        style: StylesManager.textStyle32Sem(
                          ColorManager.primaryColor,
                        ),
                      ),
                      const SizedBox(height: AppSize.s8),
                      Text(
                        StringsManager.letsCreateYourAccount,
                        style: StylesManager.textStyle16Reg(ColorManager.grey),
                      ),
                      const SizedBox(height: AppSize.s24),
                      Text(
                        StringsManager.fullName,
                        style: StylesManager.textStyle16Med(
                          ColorManager.primaryColor,
                        ),
                      ),
                      const SizedBox(height: AppSize.s6),
                      CustomTextFormField(
                        textEditingController: _fullNameTextEditingController,
                        hintText: StringsManager.fullName,
                        labelText: StringsManager.enterYourFullName,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Full Name cannot be empty';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: AppSize.s16),
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
                      const SizedBox(height: AppSize.s16),
                      Text(
                        StringsManager.password,
                        style: StylesManager.textStyle16Med(
                          ColorManager.primaryColor,
                        ),
                      ),
                      const SizedBox(height: AppSize.s6),
                      CustomTextFormField(
                        textEditingController: _passwordTextEditingController,
                        hintText: StringsManager.password,
                        labelText: StringsManager.enterYourPassword,
                        isPassword: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password cannot be empty';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: AppSize.s12),
                      const AgreeingText(),
                      const SizedBox(height: AppSize.s55),
                      CustomElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            BlocProvider.of<RegisterCubit>(context).register(
                              fullName: _fullNameTextEditingController.text
                                  .trim(),
                              email: _emailTextEditingController.text.trim(),
                              password: _passwordTextEditingController.text
                                  .trim(),
                            );
                          }
                        },
                        title: StringsManager.createAnAccountButton,
                      ),
                      const SizedBox(height: AppSize.s40),
                      const OrDivider(),
                      const SizedBox(height: AppSize.s48),
                      SocialMediaButton(
                        onPressed: () {},
                        backgroundColor: ColorManager.white,
                        foregroundColor: ColorManager.primaryColor,
                        title: StringsManager.signUpwithGoogle,
                        iconImage: AssetsManager.googleLogo,
                      ),
                      const SizedBox(height: AppSize.s16),
                      SocialMediaButton(
                        onPressed: () {},
                        backgroundColor: ColorManager.blue,
                        foregroundColor: ColorManager.white,
                        iconImage: AssetsManager.facebookLogo,
                        title: StringsManager.signUpwithFacebook,
                      ),
                      const SizedBox(height: AppSize.s10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            StringsManager.alreadyHaveAccount,
                            style: StylesManager.textStyle16Reg(
                              ColorManager.lightGrey,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              GoRouter.of(
                                context,
                              ).push(RoutesManager.loginRoute);
                            },
                            child: Text(
                              StringsManager.login,
                              style: StylesManager.textStyle16Med(
                                ColorManager.primaryColor,
                              ).copyWith(decoration: TextDecoration.underline),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: AppSize.s10),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
