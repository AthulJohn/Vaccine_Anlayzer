import 'package:flutter/material.dart';
import 'package:vaccineanalyzer/database/person_db.dart';
import 'package:vaccineanalyzer/models/vaccine.dart';
import 'package:vaccineanalyzer/widgets/buttons.dart';
import 'package:vaccineanalyzer/widgets/images.dart';
import 'package:vaccineanalyzer/widgets/inputwidgets.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          title: const Text(
            'Search Data',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: const SearchBody());
  }
}

class SearchBody extends StatefulWidget {
  const SearchBody({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchBody> createState() => _SearchBodyState();
}

class _SearchBodyState extends State<SearchBody> {
  String type = 'Person', searchText = '';
  List<Map<String, dynamic>> personMap = [], vaccineMap = [], centerMap = [];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[200],
            ),
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                SizedBox(
                  width: 100,
                  child: DropdownButton<String>(
                      value: type,
                      underline: Container(),
                      hint: const Text('Type'),
                      items: const [
                        DropdownMenuItem(
                            child: Text('Person'), value: 'Person'),
                        DropdownMenuItem(
                            child: Text('Vaccine'), value: 'Vaccine'),
                        DropdownMenuItem(
                            child: Text('Center'), value: 'Center'),
                      ],
                      onChanged: (val) {
                        setState(() {
                          type = val ?? type;
                        });
                      }),
                ),
                Expanded(
                    child: TextField(
                  decoration: const InputDecoration(
                    hintText: 'Search',
                  ),
                  onChanged: (str) {
                    setState(() {
                      searchText = str;
                    });
                  },
                )),
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () async {
                    if (searchText.isEmpty) return;
                    if (type == 'Person') {
                      vaccineMap = [];
                      centerMap = [];
                      personMap =
                          await vaccineDatabase.getSearchedPerson(searchText);
                    } else if (type == 'Vaccine') {
                      personMap = [];
                      centerMap = [];
                      vaccineMap =
                          await vaccineDatabase.getSearchedVaccine(searchText);
                    } else if (type == 'Center') {
                      vaccineMap = [];
                      personMap = [];
                      centerMap =
                          await vaccineDatabase.getSearchedCenter(searchText);
                    }
                    setState(() {});
                  },
                )
              ],
            ),
          ),
          const SizedBox(height: 10),
          type == 'Person'
              ? Expanded(
                  child: ListView.builder(
                    itemCount: personMap.length,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        height: 100,
                        child: Card(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(children: [
                                  Text(
                                    'ID: ${personMap[index]['pid']}   ',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  Text(
                                    'Name: ${personMap[index]['name']}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ]),
                                Row(children: [
                                  Text('Age: ${personMap[index]['age']}    '),
                                  Text(
                                      'District: ${personMap[index]['district']}'),
                                ]),
                                Text('Gender: ${personMap[index]['gender']}'),
                              ]),
                        ),
                      );
                    },
                  ),
                )
              : type == 'Vaccine'
                  ? Expanded(
                      child: ListView.builder(
                        itemCount: vaccineMap.length,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            height: 100,
                            child: Card(
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(children: [
                                      Text(
                                        'ID: ${vaccineMap[index]['vid']}   ',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      Text(
                                        'Name: ${vaccineMap[index]['name']}',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ]),
                                    Row(children: [
                                      Text(
                                          'Company: ${vaccineMap[index]['company']}    '),
                                      Text(
                                          'District: ${vaccineMap[index]['country']}'),
                                    ]),
                                  ]),
                            ),
                          );
                        },
                      ),
                    )
                  : Expanded(
                      child: ListView.builder(
                        itemCount: centerMap.length,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            height: 100,
                            child: Card(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(children: [
                                      Text(
                                        'ID: ${centerMap[index]['cid']}   ',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      Text(
                                        'Name: ${centerMap[index]['name']}',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ]),
                                    Row(children: [
                                      Text(
                                          'Place: ${centerMap[index]['place']}    '),
                                      Text(
                                          'District: ${centerMap[index]['district']}'),
                                    ]),
                                    Text(
                                        'Sector: ${centerMap[index]['sector']}')
                                  ]),
                            ),
                          );
                        },
                      ),
                    ),
        ],
      ),
    );
  }
}
