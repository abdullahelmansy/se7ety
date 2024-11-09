import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:se7ety/core/services/local_storage/local_storage.dart';
import 'package:se7ety/core/utils/theme.dart';
import 'package:se7ety/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:se7ety/feature/intro/splash_screen.dart';

import 'package:se7ety/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppLocalStorage.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: MaterialApp(
        home: const SplashScreen(),
        theme: AppThemes.lightTheme,
        debugShowCheckedModeBanner: false,
        builder: (context, child) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: child!,
          );
        },
      ),
    );
  }
}
