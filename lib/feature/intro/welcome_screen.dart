import 'package:flutter/material.dart';
import 'package:se7ety/core/enums/user_type.dart';
import 'package:se7ety/core/functions/navigation.dart';
import 'package:se7ety/core/utils/colors.dart';
import 'package:se7ety/core/utils/text_style.dart';
import 'package:se7ety/feature/auth/presentation/screen/register_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/welcome-bg.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 100,
            right: 25,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'اهلا بيك',
                  style: getTitleStyle(fontSize: 38),
                ),
                Text(
                  'سجل واحجز عند دكتورك وانت فالبيت',
                  style: getBodyStyle(),
                ),
              ],
            ),
          ),
          Positioned(
              bottom: 80,
              right: 25,
              left: 25,
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: AppColors.color1.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 15,
                        offset: const Offset(5, 5),
                      )
                    ]),
                child: Column(
                  children: [
                    Text(
                      'سجل دلوقي ك ',
                      style: getBodyStyle(
                        fontSize: 18,
                        color: AppColors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            push(
                                context,
                                const RegisterScreen(
                                  userType: UserType.doctor,
                                ));
                          },
                          child: Container(
                            height: 70,
                            decoration: BoxDecoration(
                              color: AppColors.white.withOpacity(0.7),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                'دكتور',
                                style: getTitleStyle(color: AppColors.black),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            push(
                                context,
                                const RegisterScreen(
                                  userType: UserType.patient,
                                ));
                          },
                          child: Container(
                            height: 70,
                            decoration: BoxDecoration(
                              color: AppColors.white.withOpacity(0.7),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                'مريض',
                                style: getTitleStyle(color: AppColors.black),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
