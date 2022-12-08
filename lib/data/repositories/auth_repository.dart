import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tech_verse/data/models/tech_verse_user.dart';
import 'package:tech_verse/domain/repositories/auth_repository_interface.dart';
import 'package:tech_verse/utilities/failure.dart';
import 'package:tech_verse/utilities/strings.dart';

final authRepository = Provider<AuthRepositoryInterface>(
  (ref) => AuthRepository(),
);

class AuthRepository implements AuthRepositoryInterface {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<void> signupWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseException catch (e) {
      throw Failure(e.message ?? kFirebaseExceptionMessage);
    } on SocketException {
      throw Failure(kSocketExceptionMessage);
    } catch (e) {
      throw Failure(kCatchErrorMessage);
    }
  }

  @override
  Future<void> logOut() async {
    await _auth.signOut();
  }

  @override
  Stream<TechVerseUser?> getUser() {
    return _auth.authStateChanges().map((firebaseUser) {
      if (firebaseUser == null) {
        return null;
      }

      return TechVerseUser(
        id: firebaseUser.uid,
        email: firebaseUser.email,
      );
    });
  }

  @override
  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseException catch (e) {
      throw Failure(e.message ?? kFirebaseExceptionMessage);
    } on SocketException {
      throw Failure(kSocketExceptionMessage);
    } catch (_) {
      throw Failure(kCatchErrorMessage);
    }
  }
}
