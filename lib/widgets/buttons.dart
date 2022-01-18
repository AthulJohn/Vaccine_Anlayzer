import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onpressed;
  const CustomButton({Key? key, this.onpressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: TextButton(
        // ignore: prefer_const_constructors
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
          // ignore: prefer_const_constructors
          padding: MaterialStateProperty.all(
            const EdgeInsets.all(25),
          ),
        ),

        onPressed: onpressed,
        child: const Text(
          'Add',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
