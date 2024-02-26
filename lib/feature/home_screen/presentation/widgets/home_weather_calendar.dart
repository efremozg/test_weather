import 'package:flutter/material.dart';
import 'package:flutter_test_weather/components/constants/app_constants.dart';

import 'package:flutter_test_weather/feature/home_screen/presentation/widgets/home_weather_card.dart';
import 'package:intl/intl.dart';

import '../../data/models/weather_hourly_model.dart';

class HomeWeatherCalendar extends StatelessWidget {
  final List<WeatherHourlyElement> weathers;
  const HomeWeatherCalendar({super.key, required this.weathers});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.25,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppConstants.transparentGreyColor),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Сегодня",
                  style: TextStyle(
                      fontFamily: "Roboto",
                      color: AppConstants.whiteColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  DateFormat('d MMM').format(DateTime.now()),
                  style: const TextStyle(
                      fontFamily: "Roboto",
                      color: AppConstants.whiteColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          Container(
            height: 1,
            width: MediaQuery.of(context).size.width * 0.9,
            color: AppConstants.whiteColor,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.18,
            child: ListView.builder(
                itemCount: weathers.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return HomeWeatherCard(
                    weatherElement: weathers[index],
                  );
                }),
          ),
        ],
      ),
    );
  }
}
