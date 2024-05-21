import 'package:nimbus_contacts/data/data_providers/user_dp.dart';

import '../models/user_model.dart';

class UserRepository {
  static User user = User();
  login(String email, String password) async {
    try {
      final userCredential = await UserDataProvider.login(email, password);
      user.uid = userCredential.user!.uid;
    } catch (e) {
      rethrow;
    }
  }

  Future addNewUser(String email, String password) async {
    try {
      await UserDataProvider.addNewUser(email, password);
    } catch (e) {
      rethrow;
    }
  }
}
