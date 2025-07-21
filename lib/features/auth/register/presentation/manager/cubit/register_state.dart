part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterLoading extends RegisterState {}

final class RegisterSuccess extends RegisterState {
  final RegisterEntity registerEntity;

  RegisterSuccess({required this.registerEntity});
}

final class RegisterFaluire extends RegisterState {
  final String errorMessage;

  RegisterFaluire({required this.errorMessage});
}
