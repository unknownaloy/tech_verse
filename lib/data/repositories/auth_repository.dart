import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
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
          await _auth.createUserWithEmailAndPassword(
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
    } catch (e) {
      throw Failure(kCatchErrorMessage);
    }
  }

  @override
  bool isSignedIn() {
    final currentUser = _auth.currentUser;

    debugPrint("AuthRepository - isSignedIn -- currentUser -> $currentUser");

    return currentUser != null;
  }



  @override
  Future<void> logOut() async {
    await _auth.signOut();
  }

  @override
  Stream<TechVerseUser?> user() {
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
}
