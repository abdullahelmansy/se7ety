import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:se7ety/core/utils/colors.dart';
import 'package:se7ety/core/utils/text_style.dart';
import 'package:se7ety/feature/patient/home/presentation/views/patient_home_view.dart';

class PatientNavBarWidget extends StatefulWidget {
  const PatientNavBarWidget({super.key});

  @override
  State<PatientNavBarWidget> createState() => _PatientNavBarWidgetState();
}

class _PatientNavBarWidgetState extends State<PatientNavBarWidget> {
  List<Widget> pages = [
    const PatientHomeView(),
    const PatientHomeView(),
    const PatientHomeView(),
    const PatientHomeView(),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentIndex],
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(0.2),
            ),
          ],
        ),
        child: GNav(
          curve: Curves.easeOutCubic,
          rippleColor: Colors.grey,
          hoverColor: Colors.grey,
          haptic: true,
          tabBorderRadius: 20,
          gap: 5,
          activeColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          duration: const Duration(milliseconds: 400),
          tabBackgroundColor: AppColors.color1,
          textStyle: getbodyStyle(color: Colors.white),
          tabs: const [
            GButton(
              icon: Icons.home,
              iconSize: 20,
              text: 'الرئيسية',
            ),
            GButton(
              icon: Icons.search,
              iconSize: 20,
              text: 'البحث',
            ),
            GButton(
              icon: Icons.calendar_month_outlined,
              iconSize: 20,
              text: 'المواعيد',
            ),
            GButton(
              icon: Icons.person,
              iconSize: 20,
              text: 'الحساب',
            ),
          ],
          selectedIndex: currentIndex,
          onTabChange: (value) {
            setState(() {
              currentIndex = value;
            });
          },
        ),
      ),
    );
  }
}
