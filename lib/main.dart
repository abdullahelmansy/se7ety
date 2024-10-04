import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:se7ety/core/utils/theme.dart';
import 'package:se7ety/feature/intro/splash_view.dart';
import 'package:se7ety/firebase_options.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: const SplashView(),
      theme: AppThemes.lightTheme,
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return Directionality(textDirection: TextDirection.rtl, child: child!,);
      },
    );
  }
}
