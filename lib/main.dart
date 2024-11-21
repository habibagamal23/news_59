import 'package:flutter/material.dart';
import 'package:news_59/features/home/logic/weather_cubit.dart';
import 'package:news_59/features/home/ui/homeScreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'myapp.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => WeatherCubit(),
      child: MyApp(),
    ),
  );
}
