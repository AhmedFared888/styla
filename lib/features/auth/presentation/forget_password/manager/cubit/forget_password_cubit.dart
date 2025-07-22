import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:styla/features/auth/domain/params/forget_password_params.dart';
import 'package:styla/features/auth/domain/usecases/forget_password_usecase.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final ForgetPasswordUsecase forgetPasswordUsecase;
  ForgetPasswordCubit(this.forgetPasswordUsecase)
    : super(ForgetPasswordInitial());

  Future<void> forgetPassword({required String email}) async {
    emit(ForgetPasswordLoading());
    final result = await forgetPasswordUsecase.execute(
      ForgetPasswordParams(email: email),
    );
    result.fold(
      (failure) => emit(ForgetPasswordFailure(errorMessage: failure.message)),
      (_) => emit(ForgetPasswordSuccess(email: email)),
    );
  }
}
