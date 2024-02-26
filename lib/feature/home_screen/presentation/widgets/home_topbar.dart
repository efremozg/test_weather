import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test_weather/components/entities/animated_button.dart';
import 'package:flutter_test_weather/feature/authorization_screen/presentation/cubit/auth_cubit.dart';

import '../../../../components/constants/app_constants.dart';

class HomeTopBar extends StatelessWidget {
  final String name;
  const HomeTopBar({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(
          Icons.location_on_outlined,
          size: 22,
          color: AppConstants.whiteColor,
        ),
        const SizedBox(width: 10),
        Consumer(
          builder: (context, ref, child) {
            return Text(
              name,
              style: TextStyle(
                  fontFamily: "Roboto",
                  color: AppConstants.whiteColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            );
          },
        ),
        Spacer(),
        AnimatedButton(
            onTap: () {
              context.read<AuthCubit>().firebaseLogOut(context);
            },
            child: Text(
              'Log out',
              style: TextStyle(color: AppConstants.greyColor, fontSize: 14),
            ))
      ],
    );
  }
}
