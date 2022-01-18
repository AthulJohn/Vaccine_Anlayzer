import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'variables.dart';

class VaccineHome extends StatefulWidget {
  VaccineHome({Key? key}) : super(key: key);

  @override
  _VaccineHomeState createState() => _VaccineHomeState();
}

class _VaccineHomeState extends State<VaccineHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            const Text(
              'Current Vaccination Status',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey),
            ),
            const SizedBox(height: 35),
            CircularPercentIndicator(
              radius: 200,
              lineWidth: 10.0,
              animation: true,
              percent: percent / 100,
              progressColor: percent > 50 ? Colors.green : Colors.red,
              center: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '$percent%',
                    style: const TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  const Text(
                    'Vaccinated',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            Column(
              children: [
                Text(
                  '$doses',
                  style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Doses Taken',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      '$singdosecnt',
                      style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'People Vaccinated',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '$fullycnt',
                      style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'People Fully Vaccinated',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
/*
Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                           Text(
                            '$doses',
                            style: const TextStyle(
                                fontSize: 38,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Doses Taken',
                            style:  TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            '$singdosecnt',
                            style: const TextStyle(
                                fontSize: 38,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'People Vaccinated',
                            style:  TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey),
                          ),
                        ],
                      ),

*/