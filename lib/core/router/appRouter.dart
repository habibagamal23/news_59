import 'package:go_router/go_router.dart';
import 'package:news_59/core/router/constantrouter.dart';
import 'package:news_59/features/home/ui/homeScreen.dart';
import 'package:news_59/features/loginscreen.dart';

class AppRouter {
  static final GoRouter router =
      GoRouter(
          initialLocation: ConstantRouter.homepath,
          
          routes: [
    // path home
    GoRoute(
        path: ConstantRouter.homepath,
        builder: (context, state) {
          return HomeScreen();
        }),

    // login
    GoRoute(
        path: ConstantRouter.loginscreen,
        builder: (context, state) {
          return Loginscreen();
        }),
  ]);
}
