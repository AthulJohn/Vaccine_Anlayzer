import 'package:flutter/material.dart';
import 'package:vaccineanalyzer/widgets/images.dart';
import 'package:vaccineanalyzer/widgets/inputwidgets.dart';

class AddVaccination extends StatelessWidget {
  const AddVaccination({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            'Add Vaccination',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: ListView(
          children: const [
            ImageBanner('vaccination'),
            FieldWithHeading(title: 'Person ID'),
            FieldWithHeading(title: 'Vaccine ID'),
            FieldWithHeading(title: 'Vaccination Date'),
            FieldWithHeading(title: 'Dose Number'),
          ],
        ));
  }
}
