import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../service/firebaseservise.dart';
import 'moderrigister.dart';

part 'regisetr_state.dart';

class RegisetrCubit extends Cubit<RegisetrState> {
  final FirebaseAuthService firebaseAuthService;

  RegisetrCubit(this.firebaseAuthService) : super(RegisetrInitial());

  /// Controllers for form fields
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  /// Form key for validation
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  /// Password visibility toggle
  bool isPasswordVisible = false;

  /// Toggles password visibility
  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    emit(RegisterPasswordVisibilityToggled(isPasswordVisible));
  }

  /// Handles user registration
  Future<void> register() async {
    if (!formKey.currentState!.validate()) {
      emit(RegisterFailure('Please fill all fields correctly.'));
      return;
    }

    emit(RegisterLoading());

    try {
      final registerRequestBody = RegisterRequestBody(
        email: emailController.text,
        password: passwordController.text,
        name: nameController.text,
        phoneNumber: phoneController.text,
      );

      final user = await firebaseAuthService.register(registerRequestBody);

      if (user != null) {
        emit(RegisterSuccess(user));
      } else {
        emit(RegisterFailure('Registration failed.'));
      }
    } catch (e) {
      emit(RegisterFailure('An error occurred: $e'));
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    phoneController.dispose();
    return super.close();
  }
}
