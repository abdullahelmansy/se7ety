import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:se7ety/core/enums/user_type.dart';
import 'package:se7ety/feature/auth/presentation/bloc/auth_event.dart';
import 'package:se7ety/feature/auth/presentation/bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<LoginEvent>(login);
    on<RegisterEvent>(register);
    on<DoctorDetailsEvent>(updateDoctorData);
  }
  login(LoginEvent event, Emitter emit) async {
    emit(LoginLoadingState());
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: event.email, password: event.password);
      emit(LoginSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        // print('No user found for that email.');
        emit(AuthErrorState('الحساب غير موجود'));
      } else if (e.code == 'wrong-password') {
        // print('Wrong password provided for that user.');
        emit(AuthErrorState('كلمة المرور خطاء'));
      } else {
        emit(AuthErrorState('كلمة المرور خطاء'));
      }
    } catch (e) {
      emit(AuthErrorState('حدث خطا ما'));
    }
  }

  register(RegisterEvent event, Emitter emit) async {
    emit(RegisterLoadingState());
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
      User? user = credential.user;
      user?.updateDisplayName(event.name);
      // store into firebase
      if (event.userType == UserType.doctor) {
        FirebaseFirestore.instance.collection('doctors').doc(user?.uid).set({
          'name': event.name,
          'image': '',
          'specialization': '',
          'rating': 3,
          'email': event.email,
          'phone1': '',
          'phone2': '',
          'bio': '',
          'openHour': '',
          'closeHour': '',
          'address': '',
          'uid': user?.uid,
        });
      } else {
        FirebaseFirestore.instance.collection('patient').doc(user?.uid).set({
          'name': event.name,
          'image': '',
          'age': null,
          'email': event.email,
          'phone': '',
          'bio': '',
          'city': '',
          'uid': user?.uid,
        });
      }

      emit(RegisterSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(AuthErrorState('كلمة المرور ضعيفة'));
      } else if (e.code == 'email-already-in-use') {
        emit(AuthErrorState('الايميل مستخدم بالفعل'));
      }
    } catch (e) {
      emit(AuthErrorState('حدث خطا ما'));
    }
  }

  updateDoctorData(DoctorDetailsEvent event, Emitter emit) {
    emit(DoctorDetailsLoadingState());
    try {
      FirebaseFirestore.instance
          .collection('doctors')
          .doc(event.doctorModel.uid)
          .update(event.doctorModel.toJson());
      emit(DoctorDetailsSuccessState());
    } catch (e) {
      emit(AuthErrorState(e.toString()));
    }
  }
}
