import 'package:flutter/material.dart';
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
        body: ListView(
          children: const [
            ImageBanner('vaccine'),
            FieldWithHeading(title: 'Vaccine Name'),
            FieldWithHeading(title: 'Country'),
            FieldWithHeading(title: 'Company'),
            FieldWithHeading(title: 'Number of Doses'),
          ],
        ));
  }
}
