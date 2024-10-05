class AuthState {}
class AuthInitial extends AuthState{}

//login
class LoginLoadingState extends AuthState {}

class LoginSuccessState extends AuthState {}

//register
class RegisterLoadingState extends AuthState {}

class RegisterSuccessState extends AuthState {}
//doctor details
class DoctorDetailsLoadingState extends AuthState {}

class DoctorDetailsSuccessState extends AuthState {}

//error
class AuthErrorState extends AuthState {
  final String error;

  AuthErrorState(this.error);
  
}
