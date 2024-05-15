import 'package:firebase_auth/firebase_auth.dart';

class UserDataProvider {
  static Future<UserCredential> login(String email, String password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } catch (e) {
      rethrow;
    }
  }
}
