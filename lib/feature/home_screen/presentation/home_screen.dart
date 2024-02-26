import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_weather/feature/home_screen/presentation/cubit/weather_cubit.dart';
import 'package:flutter_test_weather/feature/home_screen/presentation/cubit/weather_state.dart';
import 'package:flutter_test_weather/feature/home_screen/presentation/widgets/home_image.dart';
import 'package:flutter_test_weather/feature/home_screen/presentation/widgets/home_main_info.dart';
import 'package:flutter_test_weather/feature/home_screen/presentation/widgets/home_topbar.dart';
import 'package:flutter_test_weather/feature/home_screen/presentation/widgets/home_weather_calendar.dart';
import 'package:flutter_test_weather/feature/home_screen/presentation/widgets/home_weather_wind.dart';

import '../../../components/constants/app_constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) => false,
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppConstants.blueColor, AppConstants.blackColor],
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
              child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: BlocBuilder<WeatherCubit, WeatherState>(
                      builder: (context, state) {
                    if (state is LoadingState) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is ErrorState) {
                      return const Center(
                        child: Icon(
                          Icons.close,
                          color: Colors.red,
                        ),
                      );
                    } else if (state is LoadedState) {
                      return ListView(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          HomeTopBar(
                            name: state.weather.name.toString(),
                          ),
                          const SizedBox(height: 20),
                          const Center(child: HomeImage()),
                          const SizedBox(height: 10),
                          HomeMainInfo(
                              mainDegree: toCelsius(state.weather.main!.temp!),
                              description:
                                  state.weather.weather!.first.main.toString(),
                              maxDegree:
                                  toCelsius(state.weather.main!.tempMax!),
                              minDegree:
                                  toCelsius(state.weather.main!.tempMin!)),
                          SizedBox(height: 20),
                          HomeWeatherCalendar(
                            weathers: state.weatherHourly.list ?? [],
                          ),
                          SizedBox(height: 20),
                          HomeWeatherWind(
                            weather: state.weather,
                          )
                        ],
                      );
                    } else {
                      return Container();
                    }
                  }))),
        ),
      ),
    );
  }
}
