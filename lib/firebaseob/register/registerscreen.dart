import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:news_59/firebaseob/register/regisetr_cubit.dart';

import '../customfeild.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final registerCubit = context.read<RegisetrCubit>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Register', style: TextStyle(fontSize: 20.sp)),
      ),
      body: Form(
        key: registerCubit.formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Profile Image Picker
                _buildProfileImagePicker(registerCubit),
                SizedBox(height: 16.h),
                // Name Field
                CustomTextField(
                  controller: registerCubit.nameController,
                  label: 'Full Name',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your full name.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.h),
                // Email Field
                CustomTextField(
                  controller: registerCubit.emailController,
                  label: 'Email',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.h),
                // Phone Field
                CustomTextField(
                  controller: registerCubit.phoneController,
                  label: 'Phone Number',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.h),
                // Password Field
                _buildPasswordField(registerCubit),
                SizedBox(height: 32.h),
                // Register Button
                _buildRegisterButton(registerCubit),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileImagePicker(RegisetrCubit registerCubit) {
    return BlocBuilder<RegisetrCubit, RegisetrState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () async {
            final picker = ImagePicker();
            final pickedFile =
                await picker.pickImage(source: ImageSource.camera);
            if (pickedFile != null) {
              registerCubit.setProfileImage(File(pickedFile.path));
            }
          },
          child: CircleAvatar(
            radius: 40.w,
            backgroundImage: registerCubit.profileImage != null
                ? FileImage(registerCubit.profileImage!)
                : null,
            child: registerCubit.profileImage == null
                ? Icon(Icons.camera_alt, size: 30.sp)
                : null,
          ),
        );
      },
    );
  }

  Widget _buildPasswordField(RegisetrCubit registerCubit) {
    return BlocBuilder<RegisetrCubit, RegisetrState>(
      builder: (context, state) {
        return CustomTextField(
          controller: registerCubit.passwordController,
          label: 'Password',
          obscureText: !registerCubit.isPasswordVisible,
          suffixIcon: IconButton(
            icon: Icon(
              registerCubit.isPasswordVisible
                  ? Icons.visibility
                  : Icons.visibility_off,
              size: 24.sp,
            ),
            onPressed: registerCubit.togglePasswordVisibility,
          ),
          validator: (value) => value == null || value.isEmpty
              ? 'Please enter your password.'
              : null,
        );
      },
    );
  }

  Widget _buildRegisterButton(RegisetrCubit registerCubit) {
    return BlocConsumer<RegisetrCubit, RegisetrState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Registration Successful!')),
          );
          context.go('/login');
        } else if (state is RegisterFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error)),
          );
        }
      },
      builder: (context, state) {
        if (state is RegisterLoading) {
          return const CircularProgressIndicator();
        }
        return ElevatedButton(
          onPressed: registerCubit.register,
          child: Text('Register', style: TextStyle(fontSize: 18.sp)),
        );
      },
    );
  }
}
