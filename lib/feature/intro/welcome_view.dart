import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:se7ety/core/utils/colors.dart';
import 'package:se7ety/core/utils/text_style.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
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
                const Gap(15),
                Text(
                  'سجل و احجز عند دكتورك وانت في البيت',
                  style: getbodyStyle(),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 80,
            right: 25,
            left: 25,
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColors.color1.withOpacity(0.5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 15,
                    offset: const Offset(5, 5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    'سجل دلوقتي ك',
                    style: getbodyStyle(
                      color: AppColors.white,
                      fontSize: 18,
                    ),
                  ),
                  const Gap(40),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => const LoginView(index: 0),
                          //     ));
                        },
                        child: Container(
                            height: 70,
                            decoration: BoxDecoration(
                                color: AppColors.scaffoldBG.withOpacity(.7),
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: Text(
                                'دكتور',
                                style: getTitleStyle(color: AppColors.black),
                              ),
                            )),
                      ),
                      const Gap(15),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColors.scaffoldBG.withOpacity(0.7),
                          ),
                          child: Center(
                            child: Text(
                              'مريض',
                              style: getTitleStyle(
                                color: AppColors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
