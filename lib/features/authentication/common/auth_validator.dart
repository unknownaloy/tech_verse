import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tech_verse/enums/app_state.dart';
import 'package:tech_verse/features/home/screens/home_screen.dart';
import 'package:tech_verse/screens/sign_up_screen.dart';
import 'package:tech_verse/utilities/service_locator.dart';

class AuthValidator extends ConsumerWidget {
  const AuthValidator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appState = ref.watch(authViewModel);

    if (appState == AppState.authenticated) {
      return const HomeScreen();
    }

    if (appState == AppState.unAuthenticated) {
      return const SignUpScreen();
    }

    return Container(
      color: Colors.orange,
    );
  }
}
