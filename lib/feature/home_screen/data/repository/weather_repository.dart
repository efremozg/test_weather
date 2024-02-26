import 'dart:convert';

import 'package:dio/dio.dart' as d;

import 'package:flutter_test_weather/components/constants/network_constants.dart';
import 'package:flutter_test_weather/core/storage/local_storage.dart';

import 'package:flutter_test_weather/feature/home_screen/data/models/weather_model.dart'
    as w;

import '../models/weather_hourly_model.dart';
import '../models/weather_model.dart';

class WeatherRepository {
  d.Dio dio = d.Dio(d.BaseOptions(
    receiveDataWhenStatusError: true,
  ));

  Future<dynamic> getWeather(double lat, double lon) async {
    try {
      var response = await dio.get(NetworkConstants.GETWEATHER,
          queryParameters: {
            "lat": "$lat",
            "lon": "$lon",
            "lang": "ru",
            "appid": APIKEY
          });
      if (response.statusCode == 200) {
        var weather = w.Weather.fromJson(response.data);

        Map<String, dynamic> dataWeather = jsonDecode(weatherToJson(weather));
        final weatherEncode = jsonEncode(dataWeather);

        LocalStorage.setWeather(weatherEncode);

        var test = await LocalStorage.getWeather();
        print(test);

        return weather;
      }
    } catch (e) {
      print(e);
      ERROR = 'Unable to load weather';
      return null;
    }
    return null;
  }

  Future<dynamic> getWeatherHourly(double lat, double lon) async {
    try {
      var response = await dio.get(NetworkConstants.GETWEATHER_HOURLY,
          queryParameters: {"lat": "$lat", "lon": "$lon", "appid": APIKEY});
      if (response.statusCode == 200) {
        var weatherResponse = WeatherHourly.fromJson(response.data);

        Map<String, dynamic> dataWeather =
            jsonDecode(weatherHourlyToJson(weatherResponse));
        final weatherEncode = jsonEncode(dataWeather);

        LocalStorage.setWeatherHourly(weatherEncode);

        var test = await LocalStorage.getWeatherHourly();
        print(test);

        // var weather = WeatherHourly.fromJson(response.data);
        return weatherResponse;
      }
    } catch (e) {
      print(e);
      ERROR = 'Unable to load weather';
      return null;
    }
    return null;
  }
}
