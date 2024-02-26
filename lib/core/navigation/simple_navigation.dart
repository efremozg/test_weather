import 'package:flutter/material.dart';
import 'package:flutter_test_weather/feature/home_screen/presentation/home_screen.dart';

import '../../feature/authorization_screen/presentation/sign_in_screen.dart';

class Navigation {
  static goToWeather(BuildContext context) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      ),
    );
  }

  static goToSignIn(BuildContext context) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const SignInScreen(),
      ),
    );
  }

  static goToSignInReplacement(BuildContext context) {
    return Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const SignInScreen(),
      ),
    );
  }
}
