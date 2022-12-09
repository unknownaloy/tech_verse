import 'package:tech_verse/data/models/tech_verse_user.dart';

abstract class AuthRepositoryInterface {
  Future<TechVerseUser?> signupWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<void> logOut();

  Stream<TechVerseUser?> getUser();
}
