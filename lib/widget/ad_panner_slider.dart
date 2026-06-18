import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class AdPannerSlider extends StatelessWidget {
  const AdPannerSlider({
    super.key,
    this.height = 150,
    required this.imageList,
    this.borderRadius = 20,
    this.viewportFraction = 0.9,
    this.enlargeCenterPage = true,
    required this.controller,
  });
  final double height;
  final List<String> imageList;
  final double borderRadius;
  final double viewportFraction;
  final bool enlargeCenterPage;
  final CarouselSliderController controller;

  @override
  Widget build(BuildContext context) {
    if (imageList.isEmpty) return const SizedBox.shrink();

    return CarouselSlider(
      carouselController: controller,
      options: CarouselOptions(
        height: height,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: enlargeCenterPage,
        viewportFraction: viewportFraction,
      ),
      items: imageList
          .map(
            (x) => Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(borderRadius),
                child: Image.asset(
                  x,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
