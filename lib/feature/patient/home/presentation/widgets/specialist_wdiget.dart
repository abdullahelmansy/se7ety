import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:se7ety/core/functions/navigation.dart';
import 'package:se7ety/core/utils/text_style.dart';
import 'package:se7ety/feature/patient/home/data/cards.dart';
import 'package:se7ety/feature/patient/home/presentation/pages/specialization_search_screen.dart';

class SpecialistWdiget extends StatelessWidget {
  const SpecialistWdiget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'التخصصات',
          style: getTitleStyle(fontSize: 16),
        ),
        SizedBox(
          height: 230,
          width: double.infinity,
          child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: cards.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    push(
                        context,
                        SpecializationSearchScreen(
                          specialization: cards[index].specialization,
                        ));
                  },
                  child: ItemCardWidget(
                      color: cards[index].cardBackground,
                      lightColor: cards[index].cardLightColor,
                      title: cards[index].specialization),
                );
              }),
        )
      ],
    );
  }
}

class ItemCardWidget extends StatelessWidget {
  const ItemCardWidget(
      {super.key,
      required this.color,
      required this.lightColor,
      required this.title});
  final Color color;
  final Color lightColor;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 150,
      margin: const EdgeInsets.only(left: 15, bottom: 15, top: 10),
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              offset: const Offset(4, 4),
              blurRadius: 10,
              color: lightColor,
            ),
          ]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: -20,
              right: -20,
              child: CircleAvatar(
                backgroundColor: lightColor,
                radius: 60,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SvgPicture.asset(
                  'assets/doctor-card.svg',
                  width: 140,
                ),
                const Gap(10),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: getTitleStyle(fontSize: 14, color: Colors.white),
                ),
                const Gap(20),
              ],
            )
          ],
        ),
      ),
    );
  }
}
