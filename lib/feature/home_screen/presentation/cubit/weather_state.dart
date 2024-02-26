import 'package:equatable/equatable.dart';

import 'package:flutter_test_weather/feature/home_screen/data/models/weather_hourly_model.dart'
    as w;
import 'package:flutter_test_weather/feature/home_screen/data/models/weather_model.dart';

abstract class WeatherState extends Equatable {}

class InitialState extends WeatherState {
  @override
  List<Object> get props => [];
}

class LoadingState extends WeatherState {
  @override
  List<Object> get props => [];
}

class LoadedState extends WeatherState {
  LoadedState(this.weather, this.weatherHourly);

  final Weather weather;
  final w.WeatherHourly weatherHourly;

  @override
  List<Object> get props => [weather, weatherHourly];
}

class ErrorState extends WeatherState {
  @override
  List<Object> get props => [];
}

class NoInternetState extends WeatherState {
  NoInternetState(this.weather, this.weatherHourly);

  final Weather weather;
  final w.WeatherHourly weatherHourly;
  @override
  List<Object> get props => [weather, weatherHourly];
}
