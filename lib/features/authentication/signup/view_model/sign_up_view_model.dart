import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tech_verse/data/repositories/auth_repository.dart';
import 'package:tech_verse/domain/repositories/auth_repository_interface.dart';
import 'package:tech_verse/enums/request_state.dart';
import 'package:tech_verse/utilities/failure.dart';

final signUpViewModel =
    StateNotifierProvider<SignUpViewModel, RequestState>((ref) {
  final authService = ref.watch(authRepository);

  return SignUpViewModel(authRepositoryInterface: authService);
});

class SignUpViewModel extends StateNotifier<RequestState> {
  final AuthRepositoryInterface _authRepositoryInterface;

  SignUpViewModel({
    required AuthRepositoryInterface authRepositoryInterface,
  })  : _authRepositoryInterface = authRepositoryInterface,
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
      await _authRepositoryInterface.signupWithEmailAndPassword(
        email: email,
        password: password,
      );
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
