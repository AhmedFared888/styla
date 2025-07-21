import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:styla/features/auth/domain/entities/user_entity.dart';
import 'package:styla/features/auth/domain/params/login_params.dart';
import 'package:styla/features/auth/domain/usecases/login_usecase.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUsecase loginUsecase;
  LoginCubit(this.loginUsecase) : super(LoginInitial());

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());
    final result = await loginUsecase.execute(
      LoginParams(email: email, password: password),
    );
    result.fold(
      (failure) => emit(LoginFailure(errorMessage: failure.message)),
      (user) => emit(LoginSuccess(userEntity: user)),
    );
  }
}
