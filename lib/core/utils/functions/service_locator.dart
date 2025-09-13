import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:styla/core/utils/api_service.dart';
import 'package:styla/features/auth/data/repos/auth_repo_impl.dart';
import 'package:styla/features/auth/domain/usecases/forget_password_usecase.dart';
import 'package:styla/features/auth/domain/usecases/login_usecase.dart';
import 'package:styla/features/auth/domain/usecases/register_usecase.dart';
import 'package:styla/features/home/data/data_sources/home_local_data_source.dart';
import 'package:styla/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:styla/features/home/data/repos/home_repo_impl.dart';
import 'package:styla/features/home/domain/usecases/allproducts_usecase.dart';
import 'package:styla/features/home/domain/usecases/categories_usecase.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  try {
    //print("🔧 Setting up service locator...");

    // auth repo impl
    getIt.registerLazySingleton<AuthRepoImpl>(
      () => AuthRepoImpl(FirebaseAuth.instance),
    );
    //print("✅ AuthRepoImpl registered");

    // register
    getIt.registerLazySingleton<RegisterUsecase>(
      () => RegisterUsecase(getIt.get<AuthRepoImpl>()),
    );
    //print("✅ RegisterUsecase registered");

    // login
    getIt.registerLazySingleton<LoginUsecase>(
      () => LoginUsecase(getIt.get<AuthRepoImpl>()),
    );
    //print("✅ LoginUsecase registered");

    // forget password
    getIt.registerLazySingleton<ForgetPasswordUsecase>(
      () => ForgetPasswordUsecase(getIt.get<AuthRepoImpl>()),
    );
    //print("✅ ForgetPasswordUsecase registered");

    // home
    getIt.registerLazySingleton<CategoriesUsecase>(
      () => CategoriesUsecase(
        HomeRepoImpl(
          homeLocalDataSource: HomeLocalDataSourceImpl(),
          homeRemoteDataSource: HomeRemoteDataSourceImple(ApiService(Dio())),
        ),
      ),
    );
    //print("✅ CategoriesUsecase registered");

    getIt.registerLazySingleton<AllproductsUsecase>(
      () => AllproductsUsecase(
        HomeRepoImpl(
          homeLocalDataSource: HomeLocalDataSourceImpl(),
          homeRemoteDataSource: HomeRemoteDataSourceImple(ApiService(Dio())),
        ),
      ),
    );
    // print("✅ AllproductsUsecase registered");

    //print("✅ Service locator setup completed successfully");
  } catch (e, stackTrace) {
    // print("❌ Error setting up service locator: $e");
    // print("Stack trace: $stackTrace");
    rethrow;
  }
}
