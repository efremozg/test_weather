import 'package:flutter/material.dart';

import '../../../../components/constants/app_constants.dart';

class HomeMainInfo extends StatelessWidget {
  final String mainDegree;
  final String description;
  final String maxDegree;
  final String minDegree;
  const HomeMainInfo(
      {super.key,
      required this.mainDegree,
      required this.description,
      required this.maxDegree,
      required this.minDegree});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "$mainDegreeº",
            style: const TextStyle(
                fontFamily: "Ubuntu",
                color: AppConstants.whiteColor,
                fontSize: 48,
                fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: const TextStyle(
                fontFamily: "Roboto",
                color: AppConstants.whiteColor,
                fontSize: 15,
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 10),
          Text(
            "Макс: $maxDegreeº, Мин: $minDegreeº",
            style: const TextStyle(
                fontFamily: "Roboto",
                color: AppConstants.whiteColor,
                fontSize: 15,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
