import 'package:flutter/material.dart';
import 'package:vaccineanalyzer/database/person_db.dart';
import 'package:vaccineanalyzer/models/person.dart';
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
              vacc.pid = int.tryParse(str) ?? -1;
              setState(() {});
            }),
        if (vacc.pid != -1)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: FutureBuilder<Map<String, dynamic>?>(
                future: vaccineDatabase.getValById(
                    'Person', vacc.pid, 'pid', ['name', 'age', 'gender']),
                builder: (context, snap) {
                  return snap.hasData
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text('Name: ${snap.data!['name']}'),
                            Row(
                              children: [
                                Text('Age: ${snap.data!['age']}'),
                                const SizedBox(width: 18),
                                Text('Gender: ${snap.data!['gender']}'),
                              ],
                            )
                          ],
                        )
                      : Container();
                }),
          ),
        FieldWithHeading(
          title: 'Vaccine ID',
          onChanged: (str) {
            vacc.vid = int.tryParse(str) ?? -1;
            setState(() {});
          },
        ),
        if (vacc.pid != -1)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: FutureBuilder<Map<String, dynamic>?>(
                future: vaccineDatabase
                    .getValById('Vaccine', vacc.vid, 'vid', ['name']),
                builder: (context, snap) {
                  return snap.hasData
                      ? Text('Name: ${snap.data!['name']}')
                      : Container();
                }),
          ),
        FieldWithHeading(
          title: 'Center ID',
          onChanged: (str) {
            vacc.cid = int.tryParse(str) ?? -1;
            setState(() {});
          },
        ),
        if (vacc.cid != -1)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: FutureBuilder<Map<String, dynamic>?>(
                future: vaccineDatabase
                    .getValById('Center', vacc.cid, 'cid', ['name', 'place']),
                builder: (context, snap) {
                  return snap.hasData
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text('Name: ${snap.data!['name']}'),
                            Text('Place: ${snap.data!['place']}'),
                          ],
                        )
                      : Container();
                }),
          ),
        DateSelector(
            title: 'Vaccination Date',
            onChanged: (str) {
              vacc.date = str;
            }),
        FieldWithHeading(
            title: 'Dose Number',
            onChanged: (str) {
              vacc.doseno = int.tryParse(str) ?? 0;
            }),
        Row(
          children: [
            Checkbox(
                value: vacc.completed,
                onChanged: (val) {
                  vacc.completed = val ?? false;
                  setState(() {});
                }),
            const Text('Dosage Completed'),
          ],
        ),
        CustomButton(
          onpressed: () async {
            await vaccineDatabase.inserttoTable(vacc, 'Vaccination', 'vcid');
            Navigator.popUntil(context, (route) => route.isFirst);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Vaccination Details Added'),
                duration: Duration(seconds: 1),
              ),
            );
          },
        )
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
      height: 80,
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
        ],
      ),
    );
  }
}
