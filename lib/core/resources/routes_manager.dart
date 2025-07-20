import 'package:go_router/go_router.dart';
import 'package:styla/features/auth/login/presentation/views/login_view.dart';
import 'package:styla/features/auth/register/presentation/views/register_view.dart';
import 'package:styla/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:styla/features/splash/presentation/views/splash_view.dart';

class RoutesManager {
  static const String splashRoute = '/';
  static const String onBoardingRoute = '/onBoarding';
  static const String registerRoute = '/register';
  static const String loginRoute = '/login';

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
        builder: (context, state) => const RegisterView(),
      ),
      GoRoute(path: loginRoute, builder: (context, state) => const LoginView()),
    ],
  );
}
