import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {}

class InitialState extends AuthState {
  @override
  List<Object> get props => [];
}

class LoadingState extends AuthState {
  @override
  List<Object> get props => [];
}

class LoadedState extends AuthState {
  LoadedState();

  @override
  List<Object> get props => [];
}

class ErrorState extends AuthState {
  @override
  List<Object> get props => [];
}
