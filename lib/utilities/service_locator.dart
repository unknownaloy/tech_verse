import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tech_verse/data/repositories/auth_repository.dart';
import 'package:tech_verse/domain/repositories/auth_repository_interface.dart';
import 'package:tech_verse/enums/auth_state.dart';
import 'package:tech_verse/view_models/sign_up_state_notifier.dart';

/// Providers
final authRepository = Provider<AuthRepositoryInterface>(
  (ref) => AuthRepository(),
);

/// StateProvider
final signUpStateNotifier =
    StateNotifierProvider<SignUpStateNotifier, AuthState>((ref) {
  final authService = ref.watch(authRepository);

  return SignUpStateNotifier(authRepositoryInterface: authService);
});
