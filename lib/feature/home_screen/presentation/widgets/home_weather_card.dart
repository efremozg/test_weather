import 'package:flutter/material.dart';
import 'package:flutter_test_weather/components/constants/app_constants.dart';
import 'package:flutter_test_weather/components/entities/animated_button.dart';

import 'package:intl/intl.dart';

import '../../data/models/weather_hourly_model.dart';

class HomeWeatherCard extends StatefulWidget {
  final WeatherHourlyElement weatherElement;
  const HomeWeatherCard({required this.weatherElement, super.key});

  @override
  State<HomeWeatherCard> createState() => _HomeWeatherCardState();
}

class _HomeWeatherCardState extends State<HomeWeatherCard> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4.0, right: 4, top: 10, bottom: 10),
      child: AnimatedButton(
        onTap: () {
          setState(() {
            isClicked = !isClicked;
          });
        },
        child: Container(
          height: 90,
          decoration: BoxDecoration(
            color: isClicked
                ? AppConstants.whiteColor.withOpacity(0.4)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            border: isClicked
                ? Border.all(width: 1, color: AppConstants.whiteColor)
                : Border.all(width: 1, color: Colors.transparent),
          ),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  DateFormat('HH:mm')
                      .format(widget.weatherElement.dtTxt ?? DateTime.now()),
                  style: const TextStyle(
                      fontFamily: "Roboto",
                      color: AppConstants.whiteColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 12),
                const Icon(
                  Icons.sunny,
                  color: Colors.yellow,
                ),
                const SizedBox(height: 12),
                Text(
                  toCelsius(widget.weatherElement.main!.temp!),
                  style: const TextStyle(
                      fontFamily: "Roboto",
                      color: AppConstants.whiteColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
