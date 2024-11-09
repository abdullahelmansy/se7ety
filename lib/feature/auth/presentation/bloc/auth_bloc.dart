import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:se7ety/core/enums/user_type.dart';
import 'package:se7ety/core/services/local_storage/local_storage.dart';
import 'package:se7ety/feature/auth/data/doctor_model.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<LoginEvent>(login);
    on<RegisterEvent>(register);
    on<DcotorRegisterEvent>(updateDoctorData);
  }
  login(LoginEvent event, Emitter<AuthState> emit) async {
    emit(LoginLoadingState());
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
      AppLocalStorage.cacheDate(
          key: AppLocalStorage.token, value: credential.user!.uid);
      emit(LoginSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(AuthErrorState("المستخدم غير موجود"));
      } else if (e.code == 'wrong-password') {
        emit(AuthErrorState("كلمة المرور غير صحيحة"));
      } else {
        emit(AuthErrorState("حدث خطأ ما"));
      }
    } catch (e) {
      log(e.toString());
      emit(AuthErrorState("حدث خطأ ما"));
    }
  }

  register(RegisterEvent event, Emitter<AuthState> emit) async {
    emit(RegisterSuccessState());
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
      User? user = credential.user;
      user?.updateDisplayName(event.name);
      // store into fireStore
      if (event.userType == UserType.doctor) {
        FirebaseFirestore.instance.collection("doctors").doc(user?.uid).set({
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
        FirebaseFirestore.instance.collection('patients').doc(user?.uid).set({
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
      AppLocalStorage.cacheDate(
          key: AppLocalStorage.token, value: credential.user!.uid);
      emit(RegisterSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(AuthErrorState("كلمة المرور ضعيفة"));
      } else if (e.code == 'email-already-in-use') {
        emit(AuthErrorState("البريد الالكتروني مستخدم بالفعل"));
      } else {
        emit(AuthErrorState("حدث خطأ ما"));
      }
    } catch (e) {
      log(e.toString());
      emit(AuthErrorState("حدث خطأ ما"));
    }
  }

  updateDoctorData(DcotorRegisterEvent event, Emitter<AuthState> emit) {
    emit(DoctorLoadingState());
    try {
      FirebaseFirestore.instance
          .collection('doctors')
          .doc(event.doctorModel.uid)
          .update(event.doctorModel.toJson());
    } catch (e) {
      emit(AuthErrorState(e.toString()));
    }
  }
}
