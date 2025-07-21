import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:styla/features/auth/register/data/repos/register_repo_impl.dart';
import 'package:styla/features/auth/register/domain/usecases/register_usecase.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  // register
  getIt.registerLazySingleton<RegisterUsecase>(
    () => RegisterUsecase(RegisterRepoImpl(FirebaseAuth.instance)),
  );
}
