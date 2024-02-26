import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_weather/components/constants/app_constants.dart';
import 'package:flutter_test_weather/feature/authorization_screen/presentation/cubit/auth_cubit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    var cubit = context.read<AuthCubit>();
    cubit.switchScreensOnAuth(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppConstants.blueColor, AppConstants.blackColor],
        ),
      ),
      child: const Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(left: 48.0),
              child: Text(
                "WEATHER \nSERVICE",
                style: TextStyle(
                    fontFamily: "Inter",
                    color: AppConstants.whiteColor,
                    fontSize: 48,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Spacer(),
            Center(
              child: Text(
                "dawn is coming soon",
                style: TextStyle(
                    fontFamily: "Inter",
                    color: AppConstants.whiteColor,
                    fontSize: 24,
                    fontWeight: FontWeight.w300),
              ),
            ),
            SizedBox(height: 30)
          ],
        )),
      ),
    );
  }
}
