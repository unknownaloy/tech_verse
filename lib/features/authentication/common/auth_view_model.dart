import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tech_verse/data/models/tech_verse_user.dart';
import 'package:tech_verse/domain/repositories/auth_repository_interface.dart';
import 'package:tech_verse/enums/app_state.dart';

class AuthViewModel extends StateNotifier<AppState> {
  final AuthRepositoryInterface _authRepository;
  late final StreamSubscription _streamSubscription;

  AuthViewModel({required AuthRepositoryInterface authRepository})
      : _authRepository = authRepository,
        super(AppState.idle) {
    _streamSubscription = _authRepository.getUser().listen(
          (user) => _onUserChanged(user),
        );
  }

  AppState get value => state;

  void _onUserChanged(TechVerseUser? user) {
    if (user == null) {
      state = AppState.unAuthenticated;
      return;
    }
    // TODO: Make call to get extra user's data here
    state = AppState.authenticated;
  }

  void signOut() {
    state = AppState.unAuthenticated;
    _authRepository.logOut();
  }

  @override
  void dispose() {
    _streamSubscription.cancel();
    super.dispose();
  }
}
