import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:se7ety/core/utils/colors.dart';
import 'package:se7ety/core/utils/text_style.dart';
import 'package:se7ety/feature/patient/search/widget/search_list.dart';

class SeacrhScreen extends StatefulWidget {
  const SeacrhScreen({super.key});
  @override
  State<SeacrhScreen> createState() => _SeacrhScreenState();
}

class _SeacrhScreenState extends State<SeacrhScreen> {
  String search = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.color1,
        foregroundColor: Colors.white,
        title: Text(
          'ابحث عن دكتورك',
          style: getTitleStyle(color: Colors.white),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                height: 55,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(25)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 15,
                        offset: const Offset(5, 5),
                      )
                    ]),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      search = value;
                    });
                  },
                  decoration: InputDecoration(
                      hintText: 'البحث',
                      hintStyle: getBodyStyle(),
                      suffixIcon: SizedBox(
                        width: 50,
                        child: Icon(
                          Icons.search,
                          color: AppColors.color1,
                        ),
                      )),
                ),
              ),
              const Gap(15),
              Expanded(
                child: SearchList(
                  searchKey: search,
                ),
              ),
            ],
          )),
    );
  }
}
