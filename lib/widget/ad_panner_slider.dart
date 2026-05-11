import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class AdPannerSlider extends StatelessWidget {
  AdPannerSlider({super.key});
  final List<String> imageList = [
    'assets/download (62).jpg',
    'assets/Men’s Summer Business Casual Outfit _ Champagne Shirt & Off-White Pants.jpg',
    'assets/Rolex Datejust Everose Rolesor – Timeless Elegance.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 150,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        viewportFraction: 0.9,
      ),
      items: imageList
          .map(
            (x) => Container(
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(x, fit: BoxFit.cover, width: 1000),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
