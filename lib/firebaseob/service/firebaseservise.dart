import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart'; // For file path utilities
import '../login/model.dart';
import '../register/moderrigister.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  /// Log in a user with their email and password.
  Future<User?> login(LoginRequestBody loginBody) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: loginBody.email,
        password: loginBody.password,
      );
      final user = userCredential.user;

      return user;
    } catch (e) {
      throw Exception('Login failed: $e');
    }
  }

  /// Register a new user with optional profile image upload.
  Future<User?> register(RegisterRequestBody registerBody,
      File? imageFile) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: registerBody.email,
        password: registerBody.password,
      );
      final user = userCredential.user;

      // Upload profile image if provided
      final uploadedImageUrl = imageFile != null ?
      await _uploadProfileImage(imageFile, user!.uid) : null;

      // Update user details
      if (user != null) {
        await user.updateDisplayName(registerBody.name);
        if (uploadedImageUrl != null) {
          await user.updatePhotoURL(uploadedImageUrl);
        }
        await user.reload();
      }

      return user;
    } catch (e) {
      throw Exception('Registration failed: $e');
    }
  }

  /// Upload a profile image to Firebase Storage and return the download URL.
  Future<String> _uploadProfileImage(File file, String userId) async {
    try {
      final fileExtension = file.path.split('.').last;
      final storagePath = 'users/$userId/profile_images/profile_image.$fileExtension';

      final ref = _firebaseStorage.ref().child(storagePath);
      await ref.putFile(file);

      return await ref.getDownloadURL();
    } catch (e) {
      throw Exception('Image upload failed: $e');
    }
  }

  /// Send a password reset email to the given email address.
  Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      throw Exception('Password reset failed: $e');
    }
  }
}
