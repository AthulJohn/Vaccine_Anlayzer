import 'package:flutter/material.dart';
import 'package:vaccineanalyzer/addData/add_person.dart';

class VaccineHome extends StatefulWidget {
  VaccineHome({Key? key}) : super(key: key);

  @override
  _VaccineHomeState createState() => _VaccineHomeState();
}

class _VaccineHomeState extends State<VaccineHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        child: const Text('...........'),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddPerson()));
        },
      ),
    );
  }
}
