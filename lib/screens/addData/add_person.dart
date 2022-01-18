import 'package:flutter/material.dart';
import 'package:vaccineanalyzer/database/person_db.dart';
import 'package:vaccineanalyzer/models/person.dart';
import 'package:vaccineanalyzer/variables.dart';
import 'package:vaccineanalyzer/widgets/buttons.dart';
import 'package:vaccineanalyzer/widgets/images.dart';
import 'package:vaccineanalyzer/widgets/inputwidgets.dart';

class AddPerson extends StatelessWidget {
  const AddPerson({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          title: const Text(
            'Add Person',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: const FormBody());
  }
}

class FormBody extends StatefulWidget {
  const FormBody({
    Key? key,
  }) : super(key: key);

  @override
  State<FormBody> createState() => _FormBodyState();
}

class _FormBodyState extends State<FormBody> {
  Person pers = Person.simple();
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const ImageBanner('person'),
        FieldWithHeading(
            title: 'Name',
            onChanged: (str) {
              pers.name = str;
            }),
        FieldWithHeading(
            title: 'Age',
            onChanged: (str) {
              pers.age = int.tryParse(str) ?? 0;
            }),
        ColoredDropDown(
            title: 'Gender',
            vals: const ['Male', 'Female'],
            onChanged: (str) {
              pers.gender = str ?? 'Male';
            }),
        FieldWithHeading(
            title: 'Phone Number',
            onChanged: (str) {
              pers.phone = str;
            }),
        ColoredDropDown(
            title: 'District',
            vals: districts,
            onChanged: (str) {
              pers.district = str ?? 'Eranakulam';
            }),
        CustomButton(
          onpressed: () async {
            await vaccineDatabase.inserttoTable(pers, 'Person', 'pid');
            Navigator.popUntil(context, (route) => route.isFirst);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Person Added'),
                duration: Duration(seconds: 1),
              ),
            );
          },
        )
      ],
    );
  }
}
