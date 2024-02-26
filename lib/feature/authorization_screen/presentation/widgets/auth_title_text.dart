import 'package:flutter/material.dart';

import '../../../../components/constants/app_constants.dart';

class AuthTitleTextWidget extends StatelessWidget {
  final String text;
  final String description;
  const AuthTitleTextWidget(
      {super.key, required this.text, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(
              fontFamily: "Ubuntu",
              color: AppConstants.blackColor,
              fontSize: 28,
              fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 10),
        Text(
          description,
          style: TextStyle(
              fontFamily: "Roboto",
              color: AppConstants.greyColor,
              fontSize: 15,
              fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
