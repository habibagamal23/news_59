import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_59/features/home/logic/news_cubit.dart';

import 'newsBody.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("News App"),
        ),
        body: BlocBuilder<NewsCubit, NewsState>(builder: (context, state) {
          if (state is NewsLoading) {
            return CircularProgressIndicator();
          }
          if (state is NewsSucces) {
            return ListView.builder(
                itemCount: state.articals.length,
                itemBuilder: (context, index) {
                  return  NewsCard(article: state.articals[index]);
                });
          }
          if (state is NewsFauiler) {
            return Text(state.msg);
          }
          return Container();
        }));
  }
}
