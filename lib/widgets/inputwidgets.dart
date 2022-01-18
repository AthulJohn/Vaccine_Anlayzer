import 'package:flutter/material.dart';

class FieldWithHeading extends StatelessWidget {
  final String title;
  final void Function(String) onChanged;
  const FieldWithHeading(
      {Key? key, required this.title, required this.onChanged})
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
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}

class ColoredDropDown extends StatelessWidget {
  final List<String> vals;
  final String title;
  final void Function(String?) onChanged;
  const ColoredDropDown(
      {Key? key,
      required this.title,
      required this.vals,
      required this.onChanged})
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
            child:
                DropDownWidget(vals: vals, onChanged: onChanged, title: title),
          ),
        ],
      ),
    );
  }
}

class DropDownWidget extends StatefulWidget {
  const DropDownWidget({
    Key? key,
    required this.vals,
    required this.onChanged,
    required this.title,
  }) : super(key: key);

  final List<String> vals;
  final void Function(String? p1) onChanged;
  final String title;

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  String? value;
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: value,
      items: [
        for (String s in widget.vals)
          DropdownMenuItem(
            child: Text(s),
            value: s,
          ),
      ],
      onChanged: (String? val) {
        widget.onChanged(val);
        setState(() {
          value = val;
        });
      },
      hint: Text('Select ${widget.title}'),
      icon: Container(),
      underline: Container(),
    );
  }
}

class DatePickerField extends StatefulWidget {
  const DatePickerField({
    Key? key,
    required this.title,
    required this.onChanged,
  }) : super(key: key);

  final String title;
  final void Function(DateTime p1) onChanged;

  @override
  State<DatePickerField> createState() => _DatePickerFieldState();
}

class _DatePickerFieldState extends State<DatePickerField> {
  DateTime? dateTime;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () async {
          DateTime? dt = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime(2025),
          );
          setState(() {
            dateTime = dt ?? dateTime;
          });
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 5),
          child: Text((dateTime ?? "Select Date").toString().substring(0, 11)),
        ));
  }
}
