// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'screens/addData/add_center.dart';
import 'screens/addData/add_person.dart';
import 'screens/addData/add_vaccination.dart';
import 'screens/addData/add_vaccine.dart';

class AddMenu extends StatefulWidget {
  const AddMenu({Key? key}) : super(key: key);

  @override
  _AddMenuState createState() => _AddMenuState();
}

class _AddMenuState extends State<AddMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        title: const Text(
          'Vaccine Analyzer',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            const Center(
              child: Image(
                image: AssetImage('assets/img1.png'),
              ),
            ),
            const SizedBox(height: 25),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  // ignore: prefer_const_constructors
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
                    // ignore: prefer_const_constructors
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.all(25),
                    ),
                  ),

                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AddPerson()));
                  },
                  child: const Text(
                    'Add A Person',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                TextButton(
                  // ignore: prefer_const_constructors
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
                    // ignore: prefer_const_constructors
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.all(25),
                    ),
                  ),

                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AddCenter()));
                  },
                  child: const Text(
                    'Add A Vaccination Centre',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                TextButton(
                  // ignore: prefer_const_constructors
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
                    // ignore: prefer_const_constructors
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.all(25),
                    ),
                  ),

                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddVaccination()));
                  },
                  child: const Text(
                    'Add Vaccine',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                TextButton(
                  // ignore: prefer_const_constructors
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
                    // ignore: prefer_const_constructors
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.all(25),
                    ),
                  ),

                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AddVaccine()));
                  },
                  child: const Text(
                    'Add a Vaccine Company',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
