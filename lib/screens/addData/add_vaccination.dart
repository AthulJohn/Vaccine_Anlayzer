import 'package:flutter/material.dart';
import 'package:vaccineanalyzer/models/vaccination.dart';
import 'package:vaccineanalyzer/widgets/buttons.dart';
import 'package:vaccineanalyzer/widgets/images.dart';
import 'package:vaccineanalyzer/widgets/inputwidgets.dart';

class AddVaccination extends StatelessWidget {
  const AddVaccination({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          title: const Text(
            'Add Vaccination',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: VaccBody());
  }
}

class VaccBody extends StatefulWidget {
  const VaccBody({
    Key? key,
  }) : super(key: key);

  @override
  State<VaccBody> createState() => _VaccBodyState();
}

class _VaccBodyState extends State<VaccBody> {
  Vaccination vacc = Vaccination.simple();
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const ImageBanner('vaccination'),
        FieldWithHeading(
            title: 'Person ID',
            onChanged: (str) {
              vacc.pid = str;
            }),
        FieldWithHeading(
            title: 'Vaccine ID',
            onChanged: (str) {
              vacc.vid = str;
            }),
        DateSelector(
            title: 'Vaccination Date',
            onChanged: (str) {
              vacc.date = str;
            }),
        FieldWithHeading(
            title: 'Dose Number',
            onChanged: (str) {
              vacc.doseno = str;
            }),
      ],
    );
  }
}

class DateSelector extends StatelessWidget {
  final String title;
  final void Function(DateTime) onChanged;
  const DateSelector({Key? key, required this.title, required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(title),
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xFFEEEEEE),
              ),
              padding: const EdgeInsets.all(4),
              child: DatePickerField(title: title, onChanged: onChanged)),
          CustomButton(
            onpressed: () {
              Navigator.popUntil(context, (route) => route.isFirst);
            },
          )
        ],
      ),
    );
  }
}
