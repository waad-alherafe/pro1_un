import 'package:flutter/material.dart';
import 'package:pro1_un/widget/ad_panner_slider.dart';

class StackAdpanner extends StatelessWidget {
  const StackAdpanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AdPannerSlider(),
        Positioned(
          top: 25,
          left: 20,
          child: Column(
            children: [
              Text(
                'Don\'t Miss Out !',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              const Text(
                "Save Up to 75% Off",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(height: 15),

              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: const Color(0xFF8204FF),
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 10,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: const Text(
                  "Shop now",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
