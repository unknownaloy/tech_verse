import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tech_verse/enums/app_state.dart';
import 'package:tech_verse/features/authentication/common/auth_view_model.dart';
import 'package:tech_verse/features/home/screens/home_screen.dart';
import 'package:tech_verse/features/authentication/login/screens/login_screen.dart';

class AuthValidator extends ConsumerWidget {
  const AuthValidator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appState = ref.watch(authViewModel);

    if (appState == AppState.authenticated) {
      return const HomeScreen();
    }

    if (appState == AppState.unAuthenticated) {
      return const LoginScreen();
    }

    return Container(
      color: Colors.orange,
    );
  }
}
