import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tech_verse/domain/params/save_user_data_params.dart';
import 'package:tech_verse/domain/repositories/user_repository_interface.dart';
import 'package:tech_verse/utilities/failure.dart';
import 'package:tech_verse/utilities/strings.dart';

class UserRepository implements UserRepositoryInterface {
  final _db = FirebaseFirestore.instance;
  @override
  Future<void> saveUserData({
    required SaveUserDataParams params,
  }) async {
    try {
      await _db.collection("users").doc(params.id).set(params.toJson());
    } on FirebaseException catch (e) {
      throw Failure(e.message ?? kFirebaseExceptionMessage);
    } on SocketException {
      throw Failure(kSocketExceptionMessage);
    } catch (e) {
      throw Failure(kCatchErrorMessage);
    }
  }
}
