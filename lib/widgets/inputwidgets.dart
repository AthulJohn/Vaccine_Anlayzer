import 'package:flutter/material.dart';

class FieldWithHeading extends StatelessWidget {
  final String title;
  const FieldWithHeading({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(title),
          TextField(
            decoration: InputDecoration(
              fillColor: const Color(0xFFEEEEEE),
              filled: true,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
              hintText: "Enter $title",
            ),
            onChanged: (str) {},
          ),
        ],
      ),
    );
  }
}

class ColoredDropDown extends StatelessWidget {
  final List<String> vals;
  final String title;
  const ColoredDropDown({Key? key, required this.title, required this.vals})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
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
            child: DropdownButton(
              items: [
                for (String s in vals)
                  DropdownMenuItem(
                    child: Text(s),
                    value: s,
                  ),
              ],
              onChanged: (val) {},
              hint: Text('Select $title'),
              icon: Container(),
              underline: Container(),
            ),
          ),
        ],
      ),
    );
  }
}
