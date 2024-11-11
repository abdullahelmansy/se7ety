import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:se7ety/core/widgets/doctor_card_widget.dart';
import 'package:se7ety/feature/auth/data/doctor_model.dart';

class TopRatedWidget extends StatefulWidget {
  const TopRatedWidget({super.key});

  @override
  State<TopRatedWidget> createState() => _TopRatedWidgetState();
}

class _TopRatedWidgetState extends State<TopRatedWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('doctors')
            .orderBy('rating', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(
                value: 0.9,
                color: Colors.black12,
              ),
            );
          } else {
            return ListView.builder(
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  DoctorModel doctor = DoctorModel.fromJson(
                    snapshot.data!.docs[index].data(),
                  );
                  if (doctor.specialization == '') {
                    return const SizedBox();
                  }
                  return DoctorCardWidget(doctor: doctor,);
                });
          }
        },
      ),
    );
  }
}
