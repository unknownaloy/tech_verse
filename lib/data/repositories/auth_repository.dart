import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:tech_verse/data/models/tech_verse_user.dart';
import 'package:tech_verse/domain/repositories/auth_repository_interface.dart';
import 'package:tech_verse/utilities/failure.dart';
import 'package:tech_verse/utilities/strings.dart';


class AuthRepository implements AuthRepositoryInterface {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<TechVerseUser?> signupWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = userCredential.user;

      TechVerseUser? techVerseUser = TechVerseUser(
        id: user?.uid,
        email: user?.email,
      );
      return techVerseUser;
    } on FirebaseException catch (e) {
      throw Failure(e.message ?? kFirebaseExceptionMessage);
    } on SocketException {
      throw Failure(kSocketExceptionMessage);
    } catch (_) {
      throw Failure(kCatchErrorMessage);
    }
  }
}
