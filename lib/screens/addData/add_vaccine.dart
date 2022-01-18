import 'package:flutter/material.dart';
import 'package:vaccineanalyzer/models/vaccine.dart';
import 'package:vaccineanalyzer/widgets/buttons.dart';
import 'package:vaccineanalyzer/widgets/images.dart';
import 'package:vaccineanalyzer/widgets/inputwidgets.dart';

class AddVaccine extends StatelessWidget {
  const AddVaccine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          title: const Text(
            'Add Vaccine',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: VaccineBody());
  }
}

class VaccineBody extends StatefulWidget {
  const VaccineBody({
    Key? key,
  }) : super(key: key);

  @override
  State<VaccineBody> createState() => _VaccineBodyState();
}

class _VaccineBodyState extends State<VaccineBody> {
  Vaccine vcn = Vaccine.simple();
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const ImageBanner('vaccine'),
        FieldWithHeading(
            title: 'Vaccine Name',
            onChanged: (str) {
              vcn.name = str;
            }),
        FieldWithHeading(
            title: 'Country',
            onChanged: (str) {
              vcn.country = str;
            }),
        FieldWithHeading(
            title: 'Company',
            onChanged: (str) {
              vcn.company = str;
            }),
        FieldWithHeading(
            title: 'Number of Doses',
            onChanged: (str) {
              vcn.noOfDoses = int.tryParse(str) ?? 0;
            }),
        CustomButton(
          onpressed: () {
            Navigator.popUntil(context, (route) => route.isFirst);
          },
        )
      ],
    );
  }
}
