import 'package:tech_verse/domain/params/save_user_data_params.dart';

abstract class UserRepositoryInterface {
  Future<void> saveUserData({
    required SaveUserDataParams params,
  });
}
