import 'package:flutter/material.dart';

import '../../../../components/constants/app_constants.dart';

import '../../data/models/weather_model.dart' as w;

class HomeWeatherWind extends StatelessWidget {
  final w.Weather weather;
  const HomeWeatherWind({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.1,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: AppConstants.transparentGreyColor),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.water_drop_outlined,
                  color: AppConstants.whiteColor,
                ),
                SizedBox(width: 8),
                Text(
                  "${weather.wind?.speed} м/с",
                  style: TextStyle(
                      fontFamily: "Roboto",
                      color: AppConstants.greyColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
                Spacer(),
                Text(
                  "Северо-восточный",
                  style: TextStyle(
                      fontFamily: "Roboto",
                      color: AppConstants.whiteColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(
                  Icons.water_drop_outlined,
                  color: AppConstants.whiteColor,
                ),
                const SizedBox(width: 8),
                Text(
                  weather.rain == null ? "0%" : "${weather.rain?.the1H}%",
                  style: TextStyle(
                      fontFamily: "Roboto",
                      color: AppConstants.greyColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
                Spacer(),
                Text(
                  "Возможность дождя",
                  style: TextStyle(
                      fontFamily: "Roboto",
                      color: AppConstants.whiteColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
