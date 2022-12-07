import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tech_verse/data/repositories/auth_repository.dart';
import 'package:tech_verse/domain/repositories/auth_repository_interface.dart';
import 'package:tech_verse/enums/request_state.dart';
import 'package:tech_verse/utilities/failure.dart';

final loginViewModel =
    StateNotifierProvider<LoginViewModel, RequestState>((ref) {
  final authService = ref.watch(authRepository);

  return LoginViewModel(authRepository: authService);
});

class LoginViewModel extends StateNotifier<RequestState> {
  final AuthRepositoryInterface _authRepository;

  LoginViewModel({
    required AuthRepositoryInterface authRepository,
  })  : _authRepository = authRepository,
        super(
          const RequestState.idle(),
        );

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  void login({
    required String email,
    required String password,
  }) async {
    state = const RequestState.loading();

    try {
      await _authRepository.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on Failure catch (e) {
      state = const RequestState.error();
      _errorMessage = e.message;
    }
    // finally {
    //   Future.delayed(const Duration(milliseconds: 100), () {
    //     state = const RequestState.idle();
    //   });
    // }
  }
}
