import 'package:flutter/material.dart';

Map<String, String> images = {
  'person':
      'https://coronavirus.delaware.gov/wp-content/uploads/sites/177/2021/05/12-15-vaccine-eligibility-pediatritian-and-parent.png',
  'modi':
      'https://cdn.thewire.in/wp-content/uploads/2021/03/01105340/cert-modi.jpg',
};

class ImageBanner extends StatelessWidget {
  const ImageBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 200,
        child: Image.network(
          images['person'] ??
              'https://cdn.thewire.in/wp-content/uploads/2021/03/01105340/cert-modi.jpg',
          fit: BoxFit.contain,
        ));
  }
}
