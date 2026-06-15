import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  final List<String> imageList = [
    'assets/Luxury Maroon Hoodie - TIN BROTHER Gold Logo Embroidery - Oversized Fit.jpg',
    'assets/لوك نهاري سيج_أوليف بسيط.jpg',
    'assets/لوك نهاري سيج_أوليف بسيط.jpg',
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset(
            imageList[currentIndex],
            fit: BoxFit.cover,
            width: double.infinity,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: imageList.asMap().entries.map((entry) {
              int index = entry.key;
              String imagePath = entry.value;
              bool IsSelected = index == currentIndex;
              return Padding(
                padding: EdgeInsets.all(16),

                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: IsSelected ? Colors.deepPurple : Colors.grey,
                      ),
                    ),
                    child: Image.asset(
                      imagePath,
                      height: 60,
                      width: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
