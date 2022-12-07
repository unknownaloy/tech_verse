import 'package:tech_verse/data/models/tech_verse_user.dart';

abstract class AuthRepositoryInterface {
  Future<TechVerseUser?> signupWithEmailAndPassword({
    required String email,
    required String password,
  });

  bool isSignedIn();

  Future<void> logOut();

  Stream<TechVerseUser?> user();
}
