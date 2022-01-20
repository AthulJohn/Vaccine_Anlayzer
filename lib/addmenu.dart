// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:vaccineanalyzer/widgets/images.dart';

import 'screens/addData/add_center.dart';
import 'screens/addData/add_person.dart';
import 'screens/addData/add_vaccination.dart';
import 'screens/addData/add_vaccine.dart';
import 'screens/addData/report_positive.dart';

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
          'Add Data',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.black,
          ),
        ),
      ),
      body: ListView(
        children: [
          const Image(
            image: AssetImage('assets/img1.png'),
            fit: BoxFit.fitWidth,
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 125,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                AddMenuOption(
                  nextPage: AddPerson(),
                  title: 'Person',
                  image: 'person',
                ),
                AddMenuOption(
                  nextPage: AddCenter(),
                  title: 'Vaccination Centre',
                  image: 'center',
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 125,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                AddMenuOption(
                  nextPage: AddVaccination(),
                  title: 'Vaccine',
                  image: 'vaccine',
                ),
                AddMenuOption(
                  nextPage: AddVaccination(),
                  title: 'Vaccination',
                  image: 'vaccination',
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextButton(
              // ignore: prefer_const_constructors
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red[400]),
                // ignore: prefer_const_constructors
                padding: MaterialStateProperty.all(
                  const EdgeInsets.all(25),
                ),
              ),

              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ReportPositive()));
              },
              child: const Text(
                'Report a Positive Patient',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

class AddMenuOption extends StatelessWidget {
  final Widget nextPage;
  final String image, title;
  const AddMenuOption(
      {Key? key,
      required this.image,
      required this.nextPage,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: TextButton(
        // ignore: prefer_const_constructors
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.blueGrey[300]),
          // ignore: prefer_const_constructors
          padding: MaterialStateProperty.all(
            const EdgeInsets.all(10),
          ),
        ),

        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => nextPage));
        },
        child: Column(
          children: [
            Expanded(
              child: Image.network(
                images[image] ??
                    'https://coronavirus.utah.gov/wp-content/uploads/vaccines-1.png',
                fit: BoxFit.fitHeight,
              ),
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
