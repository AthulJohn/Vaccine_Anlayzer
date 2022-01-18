import 'package:flutter/material.dart';
import 'package:vaccineanalyzer/vaccinehome.dart';

import 'database/person_db.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    vaccineDatabase.initDB();
    return MaterialApp(
      title: 'Vaccine Analyzer',
      theme: ThemeData(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        primarySwatch: Colors.green,
      ),
      home: VaccineHome(),
    );
  }
}
