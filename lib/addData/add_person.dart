import 'package:flutter/material.dart';
import 'package:vaccineanalyzer/widgets/images.dart';
import 'package:vaccineanalyzer/widgets/inputwidgets.dart';

class AddPerson extends StatelessWidget {
  const AddPerson({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
                  iconTheme: IconThemeData(color: Colors.black),

          title: const Text(
            'Add Person',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: ListView(
          children: const [
            ImageBanner('person'),
            FieldWithHeading(title: 'Name'),
            FieldWithHeading(title: 'Age'),
            ColoredDropDown(title: 'Gender', vals: ['Male', 'Female']),
            FieldWithHeading(title: 'Phone Number'),
            FieldWithHeading(title: 'District'),
          ],
        ));
  }
}
