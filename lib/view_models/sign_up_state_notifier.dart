import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tech_verse/domain/repositories/auth_repository_interface.dart';
import 'package:tech_verse/enums/request_state.dart';
import 'package:tech_verse/utilities/failure.dart';

class SignUpStateNotifier extends StateNotifier<RequestState> {
  final AuthRepositoryInterface _authRepositoryInterface;

  SignUpStateNotifier({
    required AuthRepositoryInterface authRepositoryInterface,
  })  : _authRepositoryInterface = authRepositoryInterface,
        super(
          const RequestState.idle(),
        );

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  void signUp({
    required String email,
    required String password,
    required String fullName,
    required String username,
  }) async {
    state = const RequestState.loading();
    try {
      await _authRepositoryInterface.signupWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on Failure catch (e) {
      state = const RequestState.error();
      _errorMessage = e.message;
    } finally {
      Future.delayed(const Duration(milliseconds: 100), () {
        state = const RequestState.idle();
      });
    }
  }
}
