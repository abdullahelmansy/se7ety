part of 'auth_bloc.dart';

sealed class AuthEvent {}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;
  final UserType userType;

  LoginEvent(
      {required this.email, required this.password, required this.userType});
}

class RegisterEvent extends AuthEvent {
  final String name;
  final String email;
  final String password;
  final UserType userType;

  RegisterEvent(
      {required this.name,
      required this.email,
      required this.password,
      required this.userType});
}

class DcotorRegisterEvent extends AuthEvent {
  final DoctorModel doctorModel;

  DcotorRegisterEvent({required this.doctorModel});
}
