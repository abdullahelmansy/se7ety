import 'package:flutter/material.dart';
import 'package:se7ety/core/functions/navigation.dart';
import 'package:se7ety/core/services/local_storage/local_storage.dart';
import 'package:se7ety/feature/intro/onboarding/onboarding_screen.dart';
import 'package:se7ety/feature/intro/welcome_screen.dart';
import 'package:se7ety/feature/patient/patient_nav_bar_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      String? token = AppLocalStorage.getCachedData(key: AppLocalStorage.token);
      bool isOnboarding =
          AppLocalStorage.getCachedData(key: AppLocalStorage.onboarding) ??
              false;
      if (token != null) {
        pushAndRemoveUntil(context, const PatientNavBarWidget());
      } else {
        if (isOnboarding) {
          pushReplacement(context, const WelcomeScreen());
        } else {
          pushReplacement(context, const OnboardingScreen());
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/logo.png',
          width: 250,
        ),
      ),
    );
  }
}
