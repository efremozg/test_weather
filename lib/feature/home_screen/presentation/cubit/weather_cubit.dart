import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_weather/core/storage/local_storage.dart';
import 'package:flutter_test_weather/feature/home_screen/data/models/weather_hourly_model.dart';
import 'package:flutter_test_weather/feature/home_screen/data/models/weather_model.dart'
    as w;
import 'package:flutter_test_weather/feature/home_screen/data/repository/weather_repository.dart';
import 'package:flutter_test_weather/feature/home_screen/presentation/cubit/weather_state.dart';
import 'package:geolocator/geolocator.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit({required this.repository}) : super(InitialState()) {
    getWeather();
  }

  final WeatherRepository repository;

  void getWeather() async {
    try {
      emit(LoadingState());
      var position = await determinePosition();
      final weather =
          await repository.getWeather(position.latitude, position.longitude);
      WeatherHourly weatherHourly = await repository.getWeatherHourly(
          position.latitude, position.longitude);
      emit(LoadedState(weather, weatherHourly));
    } catch (e) {
      var dataWeather = await LocalStorage.getWeather();
      var dataWeatherHourly = await LocalStorage.getWeatherHourly();
      if (dataWeather != null && dataWeatherHourly != null) {
        var weather = w.Weather.fromJson(jsonDecode(dataWeather));
        var weatherHourly =
            WeatherHourly.fromJson(jsonDecode(dataWeatherHourly));

        emit(LoadedState(weather, weatherHourly));
      } else {
        emit(ErrorState());
      }
    }
  }

  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }
}
