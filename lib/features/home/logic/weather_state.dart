part of 'weather_cubit.dart';

@immutable
sealed class WeatherState {}

final class WeatherInitial extends WeatherState {}
final class WeatherLoading extends WeatherState {}
final class WeatherSuccess extends WeatherState {
  Location ? location;
  Current ? currentweather;
  WeatherSuccess(this.location , this.currentweather);
}
final class WeatherError extends WeatherState {
 String err;
 WeatherError(this.err);
}