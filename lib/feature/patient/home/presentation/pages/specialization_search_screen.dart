import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:se7ety/core/utils/text_style.dart';
import 'package:se7ety/core/widgets/doctor_card_widget.dart';
import 'package:se7ety/feature/auth/data/doctor_model.dart';

class SpecializationSearchScreen extends StatefulWidget {
  const SpecializationSearchScreen({super.key, required this.specialization});
  final String specialization;
  @override
  State<SpecializationSearchScreen> createState() =>
      _SpecializationSearchScreenState();
}

class _SpecializationSearchScreenState
    extends State<SpecializationSearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.specialization,
        ),
      ),
      body: FutureBuilder(
        future: FirebaseFirestore.instance
            .collection('doctors')
            .where('specialization', isEqualTo: widget.specialization)
            .get(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return snapshot.data!.docs.isEmpty
              ? Center(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/no-search.svg',
                          width: 250,
                        ),
                        Text(
                          'لا يوجد دكتور بهذا التخصص حاليا',
                          style: getBodyStyle(),
                        ),
                      ],
                    ),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(15),
                  child: ListView.builder(
                    physics: const ClampingScrollPhysics(),
                    itemCount: snapshot.data?.docs.length,
                    itemBuilder: (context, index) {
                      DoctorModel doctor = DoctorModel.fromJson(
                          snapshot.data!.docs[index].data());
                      if (doctor.specialization == '') {
                        return const SizedBox();
                      }
                      return DoctorCardWidget(doctor: doctor);
                    },
                  ),
                );
        },
      ),
    );
  }
}
