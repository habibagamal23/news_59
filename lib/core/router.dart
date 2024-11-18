import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:news_59/firebaseob/login/login_cubit.dart';
import 'package:news_59/firebaseob/register/regisetr_cubit.dart';
import 'package:news_59/firebaseob/register/registerscreen.dart';
import '../firebaseob/login/loginscreen.dart';
import '../firebaseob/service/firebaseservise.dart';

class AppRoutes {
  static const String home = '/';
  static const String details = '/details';
  static const String login = '/login';
  static const String register = '/register';
}

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.login,
    routes: [
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) {
          return BlocProvider(
              create: (context) => LoginCubit(FirebaseAuthService()),
              child: LoginScreen());
        },
      ),
      // Register Screen Route
      GoRoute(
        path: AppRoutes.register,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => RegisetrCubit(FirebaseAuthService()),
            child: RegisterScreen(),
          );
        },
      ),
    ],
  );
}
