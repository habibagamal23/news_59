import 'package:firebase_auth/firebase_auth.dart';

import '../login/model.dart';
import '../register/moderrigister.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Log in a user with a LoginBody model.
  Future<User?> login(LoginRequestBody loginBody) async {
    try {
      final UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
        email: loginBody.email,
        password: loginBody.password,
      );
      return userCredential.user;
    } catch (e) {
      throw Exception('An unexpected error occurred: $e');
    }
  }

  /// Register a user with a RegisterBody model.
  Future<User?> register(RegisterRequestBody registerBody) async {
    try {
      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: registerBody.email,
        password: registerBody.password,
      );
      final user = userCredential.user;

      if (user != null) {
        // Update the display name for the new user
        await user.updateDisplayName(registerBody.name);
        await user.reload();
      }

      return user;
    } catch (e) {
      throw Exception('An unexpected error occurred: $e');
    }
  }

  /// Send a password reset email.
  Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      throw Exception('An unexpected error occurred: $e');
    }
  }
}
