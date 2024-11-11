import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:se7ety/core/utils/colors.dart';
import 'package:se7ety/core/utils/text_style.dart';
import 'package:se7ety/feature/patient/home/presentation/pages/patient_home_screen.dart';
import 'package:se7ety/feature/patient/search/page/search_screen.dart';

class PatientNavBarWidget extends StatefulWidget {
  const PatientNavBarWidget({super.key});

  @override
  State<PatientNavBarWidget> createState() => _PatientNavBarWidgetState();
}

class _PatientNavBarWidgetState extends State<PatientNavBarWidget> {
  int currnetIndex = 0;
  List<Widget> pages = [
    const PatientHomeScreen(),
    const SeacrhScreen(),
    const PatientHomeScreen(),
    const PatientHomeScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: pages[currnetIndex],
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(0.2)),
          ],
        ),
        child: GNav(
          curve: Curves.easeOutExpo,
          rippleColor: Colors.grey,
          hoverColor: Colors.grey,
          haptic: true,
          tabBorderRadius: 20,
          gap: 5,
          activeColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          duration: const Duration(milliseconds: 400),
          tabBackgroundColor: AppColors.color1,
          textStyle: getBodyStyle(color: AppColors.white),
          tabs: const [
            GButton(
              icon: Icons.home,
              iconSize: 28,
              text: 'الرئيسية',
            ),
            GButton(
              icon: Icons.search,
              iconSize: 28,
              text: 'البحث',
            ),
            GButton(
              icon: Icons.calendar_month_rounded,
              iconSize: 28,
              text: 'المواعيد',
            ),
            GButton(
              icon: Icons.person,
              iconSize: 28,
              text: 'الحساب',
            ),
          ],
          selectedIndex: currnetIndex,
          onTabChange: (value) {
            setState(() {
              currnetIndex = value;
            });
          },
        ),
      ),
    );
  }
}
