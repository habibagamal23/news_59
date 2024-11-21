import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:news_59/core/network/apiService.dart';
import 'package:news_59/features/home/model/weatherModel.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());

  APiService aPiService = APiService();

  TextEditingController searchcontroller = TextEditingController();

  getCurrentweather() async {
    emit(WeatherLoading());

    try {
      var response = await aPiService.getCurrentWeather(searchcontroller.text);
      if (response != null) {
        emit(WeatherSuccess(response.location!, response.current!));
      }
    } catch (e) {
      emit(WeatherError(e.toString()));
    }
  }
}
