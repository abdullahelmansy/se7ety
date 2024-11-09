part of 'auth_bloc.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}

class LoginLoadingState extends AuthState {}

class LoginSuccessState extends AuthState {}

class RegisterLoadingState extends AuthState {}

class RegisterSuccessState extends AuthState {}

class DoctorLoadingState extends AuthState {}

class DoctorSuccessState extends AuthState {}

class AuthErrorState extends AuthState {
  final String error;

  AuthErrorState(this.error);
}
