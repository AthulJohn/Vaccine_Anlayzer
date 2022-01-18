import 'package:flutter/material.dart';

Map<String, String> images = {
  'person':
      'https://coronavirus.delaware.gov/wp-content/uploads/sites/177/2021/05/12-15-vaccine-eligibility-pediatritian-and-parent.png',
  'modi':
      'https://cdn.thewire.in/wp-content/uploads/2021/03/01105340/cert-modi.jpg',
  'vaccination':
      'https://vaccinate.guam.gov/wp-content/uploads/2021/05/Untitled-design-5-480x535.png',
  'vaccine': 'https://coronavirus.utah.gov/wp-content/uploads/vaccines-1.png',
  'center':
      'https://jacksoncountyor.org/Portals/11/EasyDNNnews/271629/img-fema_illustration_featured_coronavirus_standarded-mobile-center_graphic.png'
};

class ImageBanner extends StatelessWidget {
  final String title;
  const ImageBanner(
    this.title, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 200,
        child: Image.network(
          images[title] ??
              'https://cdn.thewire.in/wp-content/uploads/2021/03/01105340/cert-modi.jpg',
          fit: BoxFit.contain,
        ));
  }
}
