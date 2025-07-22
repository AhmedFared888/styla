import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:styla/core/utils/functions/service_locator.dart';
import 'package:styla/features/auth/domain/usecases/forget_password_usecase.dart';
import 'package:styla/features/auth/domain/usecases/login_usecase.dart';
import 'package:styla/features/auth/domain/usecases/register_usecase.dart';
import 'package:styla/features/auth/presentation/forget_password/manager/cubit/forget_password_cubit.dart';
import 'package:styla/features/auth/presentation/forget_password/views/forget_password_view.dart';
import 'package:styla/features/auth/presentation/login/manager/cubit/login_cubit.dart';
import 'package:styla/features/auth/presentation/login/views/login_view.dart';
import 'package:styla/features/auth/presentation/register/manager/cubit/register_cubit.dart';
import 'package:styla/features/auth/presentation/register/views/register_view.dart';
import 'package:styla/features/home/presentation/views/home_view.dart';
import 'package:styla/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:styla/features/splash/presentation/views/splash_view.dart';

class RoutesManager {
  static const String splashRoute = '/';
  static const String onBoardingRoute = '/onBoarding';
  static const String registerRoute = '/register';
  static const String loginRoute = '/login';
  static const String forgetPasswordRoute = '/forgetPassword';
  static const String homeRoute = '/home';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: splashRoute,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: onBoardingRoute,
        builder: (context, state) => const OnboardingView(),
      ),
      GoRoute(
        path: registerRoute,
        builder: (context, state) => BlocProvider(
          create: (context) => RegisterCubit(getIt.get<RegisterUsecase>()),
          child: const RegisterView(),
        ),
      ),
      GoRoute(
        path: loginRoute,
        builder: (context, state) => BlocProvider(
          create: (context) => LoginCubit(getIt.get<LoginUsecase>()),
          child: const LoginView(),
        ),
      ),
      GoRoute(
        path: forgetPasswordRoute,
        builder: (context, state) => BlocProvider(
          create: (context) =>
              ForgetPasswordCubit(getIt.get<ForgetPasswordUsecase>()),
          child: const ForgetPasswordView(),
        ),
      ),
      GoRoute(path: homeRoute, builder: (context, state) => const HomeView()),
    ],
  );
}
