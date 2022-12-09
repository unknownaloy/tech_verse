import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tech_verse/data/repositories/auth_repository.dart';
import 'package:tech_verse/data/repositories/user_repository.dart';
import 'package:tech_verse/domain/params/save_user_data_params.dart';
import 'package:tech_verse/domain/repositories/auth_repository_interface.dart';
import 'package:tech_verse/domain/repositories/user_repository_interface.dart';
import 'package:tech_verse/enums/request_state.dart';
import 'package:tech_verse/utilities/failure.dart';

final signUpViewModel =
    StateNotifierProvider<SignUpViewModel, RequestState>((ref) {
  final authService = ref.watch(authRepository);
  final userService = ref.watch(userRepository);

  return SignUpViewModel(
    authRepositoryInterface: authService,
    userRepositoryInterface: userService,
  );
});

class SignUpViewModel extends StateNotifier<RequestState> {
  final AuthRepositoryInterface _authRepositoryInterface;
  final UserRepositoryInterface _userRepositoryInterface;

  SignUpViewModel({
    required AuthRepositoryInterface authRepositoryInterface,
    required UserRepositoryInterface userRepositoryInterface,
  })  : _authRepositoryInterface = authRepositoryInterface,
        _userRepositoryInterface = userRepositoryInterface,
        super(
          const RequestState.idle(),
        );

  RequestState get value => state;

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
      final user = await _authRepositoryInterface.signupWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (user != null) {
        final saveUserDataParams = SaveUserDataParams(
          id: user.id!,
          email: user.email!,
          fullName: fullName,
          username: username,
        );

        unawaited(
            _userRepositoryInterface.saveUserData(params: saveUserDataParams));
      }
      state = const RequestState.success();
    } on Failure catch (e) {
      state = const RequestState.error();
      _errorMessage = e.message;
    } finally {
      Future.delayed(const Duration(milliseconds: 100), () {
        // state = RequestState.idle;
        _errorMessage = null;
      });
    }
  }
}
