import 'package:flutter/material.dart';
import 'package:vaccineanalyzer/database/person_db.dart';
import 'package:vaccineanalyzer/models/center.dart';
import 'package:vaccineanalyzer/models/positive.dart';
import 'package:vaccineanalyzer/widgets/buttons.dart';
import 'package:vaccineanalyzer/widgets/images.dart';
import 'package:vaccineanalyzer/widgets/inputwidgets.dart';

import '../../variables.dart';

class ReportPositive extends StatelessWidget {
  const ReportPositive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          title: const Text(
            'Report Positive Patient',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: CenterBody());
  }
}

class CenterBody extends StatefulWidget {
  const CenterBody({
    Key? key,
  }) : super(key: key);

  @override
  State<CenterBody> createState() => _CenterBodyState();
}

class _CenterBodyState extends State<CenterBody> {
  Positived post = Positived.simple();
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const ImageBanner('positive'),
        FieldWithHeading(
            title: 'Person ID',
            onChanged: (str) {
              post.pid = int.tryParse(str) ?? -1;
              setState(() {});
            }),
        if (post.pid != -1)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: FutureBuilder<Map<String, dynamic>?>(
                future: vaccineDatabase.getValById(
                    'Person', post.pid, 'pid', ['name', 'age', 'gender']),
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
            title: 'Doses Taken',
            onChanged: (str) {
              post.doseno = int.tryParse(str) ?? -1;
            }),
        DateSelector(
            title: 'Covid Confirmed Date',
            onChanged: (str) {
              post.date = str;
            }),
        Row(
          children: [
            Checkbox(
                value: post.completed,
                onChanged: (val) {
                  post.completed = val ?? false;
                  setState(() {});
                }),
            const Text('Dosage Completed'),
          ],
        ),
        CustomButton(
          onpressed: () async {
            await vaccineDatabase.inserttoTableNoPrimaryKey(post, 'Positived');
            Navigator.popUntil(context, (route) => route.isFirst);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Positive Person Reported'),
                duration: Duration(seconds: 1),
              ),
            );
          },
        )
      ],
    );
  }
}
