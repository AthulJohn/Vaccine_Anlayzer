import 'package:flutter/material.dart';
import 'package:vaccineanalyzer/widgets/images.dart';
import 'package:vaccineanalyzer/widgets/inputwidgets.dart';

class AddCenter extends StatelessWidget {
  const AddCenter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          title: const Text(
            'Add Vaccination Center',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: ListView(
          children: const [
            ImageBanner('center'),
            FieldWithHeading(title: 'Center Name'),
            FieldWithHeading(title: 'Place'),
            FieldWithHeading(title: 'District'),
          ],
        ));
  }
}
