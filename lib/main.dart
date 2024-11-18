import 'package:flutter/material.dart';
import 'package:news_59/features/home/logic/news_cubit.dart';
import 'package:news_59/features/home/model/newsmode.dart';
import 'package:news_59/features/home/ui/homeScreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => NewsCubit()..getdata(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter Demo', home: HomeScreen());
  }
}
