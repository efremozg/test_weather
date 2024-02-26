import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_weather/core/navigation/simple_navigation.dart';
import 'package:flutter_test_weather/core/storage/local_storage.dart';
import 'package:flutter_test_weather/feature/authorization_screen/data/repository/firebase_service.dart';
import 'package:flutter_test_weather/feature/authorization_screen/presentation/cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.repository}) : super(InitialState()) {}
  final FirebaseService repository;

  void switchScreensOnAuth(BuildContext context) async {
    //JUST TO SHOW SPLASH SCREEN
    await Future.delayed(Duration(seconds: 2));

    if (FirebaseService().user == null) {
      LocalStorage.setAuthStatus(false);
    } else {
      LocalStorage.setAuthStatus(true);
    }

    try {
      var isAuthenticated = await LocalStorage.getAuthStatus();
      if (isAuthenticated) {
        Navigation.goToWeather(context);
        emit(LoadedState());
      } else {
        Navigation.goToSignIn(context);
        emit(InitialState());
      }
    } catch (e) {
      Navigation.goToSignIn(context);
      emit(InitialState());
    }
  }

  void firebaseAuth(BuildContext context, String email, String password) async {
    try {
      emit(LoadingState());
      await FirebaseService()
          .signUp(email: email, password: password)
          .whenComplete(() {
        LocalStorage.setAuthStatus(true);
      });
      Navigation.goToWeather(context);
      emit(LoadedState());
    } catch (e) {
      emit(ErrorState());
    }
  }

  void firebaseLogOut(BuildContext context) async {
    try {
      emit(LoadingState());
      await FirebaseService().signOut().whenComplete(() {
        LocalStorage.setAuthStatus(false);
      });
      Navigation.goToSignIn(context);
      emit(LoadedState());
    } catch (e) {
      emit(ErrorState());
    }
  }
}
