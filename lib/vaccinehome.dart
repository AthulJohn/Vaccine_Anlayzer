import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:vaccineanalyzer/Addmenu.dart';
import 'package:vaccineanalyzer/database/person_db.dart';
import 'screens/search_page.dart';
import 'variables.dart';

class VaccineHome extends StatefulWidget {
  VaccineHome({Key? key}) : super(key: key);

  @override
  _VaccineHomeState createState() => _VaccineHomeState();
}

class _VaccineHomeState extends State<VaccineHome> {
  @override
  void dispose() {
    vaccineDatabase.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Vaccine Analyzer',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.black,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          const SizedBox(height: 30),
          const Text(
            '   Current Vaccination Status',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w500, color: Colors.grey),
          ),
          const SizedBox(height: 35),
          FutureBuilder<double>(
              future: vaccineDatabase.getPercentage(),
              builder: (context, snap) {
                return CircularPercentIndicator(
                  radius: 200,
                  lineWidth: 10.0,
                  animation: true,
                  percent: snap.hasData ? snap.data! / 100 : 0,
                  progressColor:
                      (snap.data ?? 0) > 50 ? Colors.teal[400] : Colors.red,
                  center: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${(snap.data ?? 0).toStringAsFixed(2)}%',
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
                );
              }),
          const SizedBox(height: 50),
          Column(
            children: [
              FutureBuilder(
                  future: vaccineDatabase.getDoseCount(),
                  builder: (context, snap) {
                    return Text(
                      '${snap.data ?? 0}',
                      style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    );
                  }),
              const SizedBox(height: 10),
              const Text(
                'Doses Taken',
                style: TextStyle(
                    fontSize: 14,
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
                  FutureBuilder(
                      future: vaccineDatabase.getVaccinatedPeopleCount(),
                      builder: (context, snap) {
                        return Text(
                          '${snap.data ?? 0}',
                          style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        );
                      }),
                  const SizedBox(height: 10),
                  const Text(
                    'People Vaccinated',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey),
                  ),
                ],
              ),
              Column(
                children: [
                  FutureBuilder(
                      future: vaccineDatabase.getCompletedVaccinated(),
                      builder: (context, snap) {
                        return Text(
                          '${snap.data ?? 0}',
                          style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        );
                      }),
                  const SizedBox(height: 10),
                  const Text(
                    'People Fully Vaccinated',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  FutureBuilder(
                      future: vaccineDatabase.getPositivePercent(),
                      builder: (context, snap) {
                        return Text(
                          '${snap.data ?? 0}',
                          style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        );
                      }),
                  const SizedBox(height: 10),
                  const Text(
                    'Positive Percentage',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey),
                  ),
                ],
              ),
              Column(
                children: [
                  FutureBuilder(
                      future: vaccineDatabase.getFullyPositivePercent(),
                      builder: (context, snap) {
                        return Text(
                          '${snap.data ?? 0}',
                          style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        );
                      }),
                  const SizedBox(height: 10),
                  const Text(
                    'Fully Vaccinated Positive Percentage',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 50),
          const Text(
            '   Most Used Vaccines',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w500, color: Colors.grey),
          ),
          const SizedBox(height: 10),
          FutureBuilder<List<Map<String, dynamic>>>(
              future: vaccineDatabase.getMostUsedVaccines(),
              builder: (context, snap) {
                if (snap.hasData) {
                  return Column(children: [
                    for (Map<String, dynamic> map in snap.data!)
                      Row(
                        children: [
                          Text(
                            '     ${map['name']} -',
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                          const SizedBox(width: 50),
                          Text(
                            '${map['count']} doses',
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                  ]);
                } else {
                  return Container();
                }
              }),
          const SizedBox(height: 50),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey,
        onPressed: () {
          Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AddMenu()))
              .then((value) => setState(() {}));
        },
        child: const Icon(
          Icons.add,
          size: 40,
        ),
      ),
    );
  }
}
