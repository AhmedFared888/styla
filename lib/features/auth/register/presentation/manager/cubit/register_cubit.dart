import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:styla/features/auth/register/domain/entities/register_entity.dart';
import 'package:styla/features/auth/register/domain/params/register_params.dart';
import 'package:styla/features/auth/register/domain/usecases/register_usecase.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUsecase registerUsecase;

  RegisterCubit(this.registerUsecase) : super(RegisterInitial());

  Future<void> register({
    required String fullName,
    required String email,
    required String password,
  }) async {
    emit(RegisterLoading());

    final result = await registerUsecase.execute(
      RegisterParams(fullName: fullName, email: email, password: password),
    );
    result.fold(
      (faluire) => emit(RegisterFaluire(errorMessage: faluire.message)),
      (user) => emit(RegisterSuccess(registerEntity: user)),
    );
  }
}
