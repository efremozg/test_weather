import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_weather/components/constants/app_constants.dart';
import 'package:flutter_test_weather/components/entities/animated_button.dart';
import 'package:flutter_test_weather/feature/authorization_screen/presentation/cubit/auth_cubit.dart';
import 'package:flutter_test_weather/feature/authorization_screen/presentation/cubit/auth_state.dart'
    as auth;

class AuthInputFields extends StatefulWidget {
  const AuthInputFields({super.key});

  @override
  State<AuthInputFields> createState() => _AuthInputFieldsState();
}

class _AuthInputFieldsState extends State<AuthInputFields> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool obscureText = true;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: TextField(
            controller: _emailController,
            decoration: const InputDecoration(
              labelText: "Email",
              labelStyle:
                  TextStyle(color: AppConstants.greyColor, fontSize: 16),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: AppConstants.greyColor),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: AppConstants.blueColor),
              ),
            ),
            onChanged: (value) {
              setState(() {});
            },
          ),
        ),
        const SizedBox(height: 40),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Stack(alignment: Alignment.centerRight, children: [
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: "Пароль",
                labelStyle:
                    TextStyle(color: AppConstants.greyColor, fontSize: 16),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppConstants.greyColor),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppConstants.blueColor),
                ),
              ),
              obscureText: obscureText,
              onChanged: (value) {
                setState(() {});
              },
            ),
            AnimatedButton(
                onTap: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
                child: Icon(
                  obscureText ? Icons.visibility : Icons.visibility_off,
                  color: AppConstants.blueColor,
                ))
          ]),
        ),
        const SizedBox(height: 60),
        BlocBuilder<AuthCubit, auth.AuthState>(
          builder: (context, state) {
            final cubit = context.read<AuthCubit>();
            return AnimatedButton(
                onTap: (state is auth.LoadingState ||
                        _emailController.text.isEmpty ||
                        _passwordController.text.isEmpty)
                    ? () {}
                    : () {
                        cubit.firebaseAuth(context, _emailController.text,
                            _passwordController.text);
                      },
                child: Container(
                  height: 48,
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                      color: _emailController.text.isEmpty ||
                              _passwordController.text.isEmpty
                          ? AppConstants.greyColor
                          : AppConstants.blueColor,
                      borderRadius: BorderRadius.circular(25)),
                  child: Center(
                    child: !(state is auth.LoadingState)
                        ? const Text(
                            "Войти",
                            style: TextStyle(
                                fontFamily: "Roboto",
                                color: AppConstants.whiteColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w700),
                          )
                        : const SizedBox(
                            height: 30,
                            width: 30,
                            child: CircularProgressIndicator(
                              strokeWidth: 1,
                              color: AppConstants.whiteColor,
                            ),
                          ),
                  ),
                ));
          },
        )
      ],
    );
  }
}
