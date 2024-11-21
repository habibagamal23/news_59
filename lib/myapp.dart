
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_59/core/router/appRouter.dart';

import 'features/home/ui/homeScreen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(430, 932),
        minTextAdapt: true,
        builder: (context, child) {
          return MaterialApp.router(
              title: 'Flutter Demo',
            routerConfig: AppRouter.router,
              );
        });
  }
}
