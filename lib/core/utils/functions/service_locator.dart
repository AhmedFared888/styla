import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:styla/features/auth/data/repos/auth_repo_impl.dart';
import 'package:styla/features/auth/domain/usecases/forget_password_usecase.dart';
import 'package:styla/features/auth/domain/usecases/login_usecase.dart';
import 'package:styla/features/auth/domain/usecases/register_usecase.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  // auth repo impl
  getIt.registerLazySingleton<AuthRepoImpl>(
    () => AuthRepoImpl(FirebaseAuth.instance),
  );

  // register
  getIt.registerLazySingleton<RegisterUsecase>(
    () => RegisterUsecase(getIt.get<AuthRepoImpl>()),
  );

  // login
  getIt.registerLazySingleton<LoginUsecase>(
    () => LoginUsecase(getIt.get<AuthRepoImpl>()),
  );

  // forget password
  getIt.registerLazySingleton<ForgetPasswordUsecase>(
    () => ForgetPasswordUsecase(getIt.get<AuthRepoImpl>()),
  );
}
