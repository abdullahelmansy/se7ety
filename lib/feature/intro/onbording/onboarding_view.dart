import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:se7ety/core/functions/navigation.dart';
import 'package:se7ety/core/services/local_storage/local_storage.dart';
import 'package:se7ety/core/utils/colors.dart';
import 'package:se7ety/core/utils/text_style.dart';
import 'package:se7ety/core/widgets/custom_button.dart';
import 'package:se7ety/feature/intro/onbording/onboarding_model.dart';
import 'package:se7ety/feature/intro/welcome_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  var controller = PageController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        actions: [
          if (currentIndex != pages.length - 1)
            TextButton(
              onPressed: () {
                 AppLocalStorage.cacheDate(
                            key: AppLocalStorage.onboarding, value: true);
                pushReplacement(context, const WelcomeView());
              },
              child: Text(
                'تخطي',
                style: getbodyStyle(color: AppColors.color1),
              ),
            )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: controller,
                onPageChanged: (value) {
                  setState(() {
                    currentIndex = value;
                  });
                },
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      const Spacer(),
                      SvgPicture.asset(
                        pages[index].image,
                        width: 300,
                      ),
                      const Spacer(),
                      Text(
                        pages[index].title,
                        style: getbodyStyle(color: AppColors.color1),
                      ),
                      const Gap(10),
                      Text(
                        pages[index].body,
                        style: getbodyStyle(),
                      ),
                      const Spacer(
                        flex: 3,
                      )
                    ],
                  );
                },
                itemCount: pages.length,
              ),
            ),
            SizedBox(
              height: 70,
              child: Row(
                children: [
                  SmoothPageIndicator(
                    controller: controller,
                    count: pages.length,
                    effect: SlideEffect(
                      activeDotColor: AppColors.color1,
                      radius: 15,
                      spacing: 8,
                      dotWidth: 24,
                      dotHeight: 13,
                      strokeWidth: 1.5,
                      dotColor: Colors.grey,
                    ),
                  ),
                  const Spacer(),
                  if (currentIndex == pages.length - 1)
                    CustomButton(
                      text: 'هيا بنا',
                      onPressed: () { AppLocalStorage.cacheDate(
                            key: AppLocalStorage.onboarding, value: true);
                        pushReplacement(context, const WelcomeView());
                       
                      },
                      width: 100,
                      height: 45,
                    )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
