import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/artical_cubit.dart';

import 'newsBody.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("News App"),
          actions: [
            IconButton(icon: Icon(Icons.refresh), onPressed: () {}),
          ],
        ),
        body:
            BlocBuilder<ArticalCubit, ArticalState>(builder: (context, state) {
          if (state is ArticalsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ArticalsSucuess) {
            return ListView.builder(
                itemCount: state.articals.length,
                itemBuilder: (context, index) {
                  return NewsCard(article: state.articals[index]);
                });
          } else if (state is ArticalsFaliuere) {
            return Text(state.err);
          }
          return const Text("No articles available");
        }));
  }
}
