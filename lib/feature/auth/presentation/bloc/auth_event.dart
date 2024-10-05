import 'package:se7ety/core/enums/user_type.dart';
import 'package:se7ety/feature/auth/data/doctor_model.dart';

class AuthEvent {}

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

  RegisterEvent(this.name,
      {required this.email, required this.password, required this.userType});
}

class DoctorDetailsEvent extends AuthEvent {
  final DoctorModel doctorModel;

  DoctorDetailsEvent({required this.doctorModel});
}
