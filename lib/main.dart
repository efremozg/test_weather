import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_test_weather/feature/authorization_screen/data/repository/firebase_service.dart';
import 'package:flutter_test_weather/feature/authorization_screen/presentation/cubit/auth_cubit.dart';
import 'package:flutter_test_weather/feature/home_screen/presentation/cubit/weather_cubit.dart';
import 'package:flutter_test_weather/feature/my_app.dart';

import 'feature/home_screen/data/repository/weather_repository.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<WeatherCubit>(
          create: (context) => WeatherCubit(repository: WeatherRepository()),
        ),
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(repository: FirebaseService()),
        ),
      ],
      child: MyApp(),
    ),
  );
}
