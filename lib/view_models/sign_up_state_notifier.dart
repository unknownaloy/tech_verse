import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tech_verse/data/models/tech_verse_user.dart';
import 'package:tech_verse/domain/repositories/auth_repository_interface.dart';
import 'package:tech_verse/enums/auth_state.dart';
import 'package:tech_verse/utilities/failure.dart';

class SignUpStateNotifier extends StateNotifier<AuthState> {
  final AuthRepositoryInterface _authRepositoryInterface;

  SignUpStateNotifier({
    required AuthRepositoryInterface authRepositoryInterface,
  })  : _authRepositoryInterface = authRepositoryInterface,
        super(
          const AuthState.idle(),
        );

  TechVerseUser? _techVerseUser;
  TechVerseUser? get techVerseUser => _techVerseUser;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  void signUp({
    required String email,
    required String password,
    required String fullName,
    required String username,
  }) async {
    state = const AuthState.loading();
    try {
      final user = await _authRepositoryInterface.signupWithEmailAndPassword(
        email: email,
        password: password,
      );

      _techVerseUser = user;
    } on Failure catch (e) {
      state = const AuthState.error();
      _errorMessage = e.message;
    } finally {
      Future.delayed(const Duration(milliseconds: 100), () {
        state = const AuthState.idle();
      });
    }
  }
}
