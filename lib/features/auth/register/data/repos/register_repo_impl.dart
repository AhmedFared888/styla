import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:styla/core/errors/failure.dart';
import 'package:styla/features/auth/register/domain/entities/register_entity.dart';
import 'package:styla/features/auth/register/domain/repos/register_repo.dart';

class RegisterRepoImpl extends RegisterRepo {
  final FirebaseAuth firebaseAuth;

  RegisterRepoImpl(this.firebaseAuth);

  @override
  Future<Either<Failure, RegisterEntity>> register({
    required String fullName,
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      final user = userCredential.user!;
      return right(RegisterEntity(uid: user.uid, email: user.email ?? ''));
    } on FirebaseAuthException catch (e) {
      final errorMessage = _mapFirebaseAuthError(e.code);
      return left(Failure(errorMessage));
    }
  }

  String _mapFirebaseAuthError(String code) {
    switch (code) {
      case 'user-not-found':
        return 'This email is not registered.';
      case 'wrong-password':
        return 'Incorrect password.';
      case 'invalid-email':
        return 'Invalid email format.';
      case 'user-disabled':
        return 'This account has been disabled.';
      case 'too-many-requests':
        return 'Too many attempts. Please try again later.';
      case 'network-request-failed':
        return 'No internet connection.';
      case 'email-already-in-use':
        return 'This email is already in use.';
      case 'weak-password':
        return 'Weak password. Please choose a stronger one.';
      case 'operation-not-allowed':
        return 'Email/password sign-in is not enabled.';
      default:
        return 'An error occurred while creating the account. Please try again.';
    }
  }
}
