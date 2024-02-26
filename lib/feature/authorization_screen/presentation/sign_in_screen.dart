import 'package:flutter/material.dart';
import 'package:flutter_test_weather/components/constants/app_constants.dart';
import 'package:flutter_test_weather/feature/authorization_screen/presentation/widgets/auth_input_fileds.dart';
import 'package:flutter_test_weather/feature/authorization_screen/presentation/widgets/auth_title_text.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: ((didPop) => false),
      child: Scaffold(
        backgroundColor: AppConstants.whiteColor,
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              AuthTitleTextWidget(
                  text: "Вход", description: "Введите данные для входа"),
              SizedBox(height: 20),
              AuthInputFields(),
            ],
          ),
        )),
      ),
    );
  }
}
