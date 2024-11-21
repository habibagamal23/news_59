import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_59/features/home/logic/weather_cubit.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather App"),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller:  context.read<WeatherCubit> ().searchcontroller,
                ),
              ),
              Expanded(
                child: IconButton(onPressed: (){
                  context.read<WeatherCubit>().getCurrentweather();
                }, icon: Icon(Icons.search)),
              )
            ],
          ),

          Expanded(
            child: BlocBuilder<WeatherCubit, WeatherState>(builder: (context, state) {
              if (state is WeatherLoading) {
                return CircularProgressIndicator();
              }
              if (state is WeatherSuccess) {
                return Column(
                  children: [
                    Text("location : ${state.location!.name??""}"),
                    Text("tem : ${state.currentweather!.tempC??""}"),

                  ],
                );
              }

              if (state is WeatherError) {
                return Text(state.err);
              }

              return Text("Search to get weather ");
            }),
          ),
        ],
      ),
    );
  }
}
