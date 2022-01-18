
import 'package:flutter/material.dart';

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
          children: [
            const Center(
              child: Image(
                image: AssetImage('assets/img1.png'),
              )
            )
          ],
        ),
      ),
    );
  }
}
