import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:news_59/core/router.dart';
import 'package:news_59/firebaseob/register/regisetr_cubit.dart';
import '../customfeild.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final registerCubit = context.read<RegisetrCubit>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Register',
          style: TextStyle(fontSize: 20.sp),
        ),
      ),
      body: Form(
        key: registerCubit.formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
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
                // email
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
                BlocBuilder<RegisetrCubit, RegisetrState>(
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password.';
                        }

                        return null;
                      },
                    );
                  },
                ),
                SizedBox(height: 32.h),

                // Register Button
                _buildRegisterButton(registerCubit),

                TextButton(
                    onPressed: () => context.go(AppRoutes.login),
                    child: Text("HAva Acc"))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRegisterButton(RegisetrCubit registerCubit) {
    return BlocConsumer<RegisetrCubit, RegisetrState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          context.go(AppRoutes.login);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Registration Successful!')),
          );
        } else if (state is RegisterFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error)),
          );
        }
      },
      builder: (context, state) {
        if (state is RegisterLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return ElevatedButton(
          onPressed: registerCubit.register,
          child: Text(
            'Register',
            style: TextStyle(fontSize: 18.sp),
          ),
        );
      },
    );
  }
}
