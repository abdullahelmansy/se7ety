import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:se7ety/core/functions/navigation.dart';
import 'package:se7ety/core/utils/colors.dart';
import 'package:se7ety/core/utils/text_style.dart';
import 'package:se7ety/feature/patient/home/presentation/pages/home_seacrh_screen.dart';
import 'package:se7ety/feature/patient/home/presentation/widgets/specialist_wdiget.dart';
import 'package:se7ety/feature/patient/home/presentation/widgets/top_rated_widget.dart';

class PatientHomeScreen extends StatefulWidget {
  const PatientHomeScreen({super.key});

  @override
  State<PatientHomeScreen> createState() => _PatientHomeScreenState();
}

class _PatientHomeScreenState extends State<PatientHomeScreen> {
  final TextEditingController doctorName = TextEditingController();
  User? user;
  Future<void> getUser() async {
    user = FirebaseAuth.instance.currentUser;
  }

  @override
  void initState() {
    super.initState();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: IconButton(
                icon:
                    const Icon(Icons.notifications_active, color: Colors.black),
                onPressed: () {},
                splashRadius: 20,
              ),
            )
          ],
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            "صحتي",
            style: getTitleStyle(color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(TextSpan(
                  children: [
                    TextSpan(
                      text: 'مرحبا , ',
                      style: getBodyStyle(fontSize: 18),
                    ),
                    TextSpan(
                      text: user?.displayName,
                      style: getTitleStyle(),
                    ),
                  ],
                )),
                const Gap(10),
                Text("احجز الآن وكن جزءًا من رحلتك الصحية.",
                    style: getTitleStyle(color: AppColors.black, fontSize: 25)),
                const SizedBox(height: 15),
                Container(
                  height: 55,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          blurRadius: 15,
                          offset: const Offset(5, 5),
                        ),
                      ]),
                  child: TextFormField(
                    textInputAction: TextInputAction.search,
                    controller: doctorName,
                    cursorColor: AppColors.color1,
                    decoration: InputDecoration(
                        hintStyle: getBodyStyle(),
                        filled: true,
                        hintText: 'ابحث عن دكتور',
                        suffixIcon: Container(
                          decoration: BoxDecoration(
                              color: AppColors.color1.withOpacity(0.9),
                              borderRadius: BorderRadius.circular(17)),
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                if (doctorName.text.isNotEmpty) {
                                  push(
                                      context,
                                      HomeSeacrhScreen(
                                          searchKey: doctorName.text));
                                }
                              });
                            },
                            icon: const Icon(Icons.search),
                            iconSize: 20,
                            splashRadius: 20,
                            color: Colors.white,
                          ),
                        )),
                    style: getBodyStyle(),
                    onFieldSubmitted: (value) {
                      setState(() {
                        if (doctorName.text.isNotEmpty) {
                          push(context,
                              HomeSeacrhScreen(searchKey: doctorName.text));
                        }
                      });
                    },
                  ),
                ),
                const Gap(16),
                const SpecialistWdiget(),
                const Gap(10),
                Text(
                  'الاعلي تقيما',
                  textAlign: TextAlign.center,
                  style: getTitleStyle(fontSize: 16),
                ),
                const Gap(10),
                const TopRatedWidget()
              ],
            ),
          ),
        ));
  }
}
