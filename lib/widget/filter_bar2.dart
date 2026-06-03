import 'package:flutter/material.dart';

class FilterBar2 extends StatelessWidget {
  const FilterBar2({super.key});

  final List<String> categoryButtons = const [
    'All',
    'Fashion',
    'Electronics',
    'Accessories',
    'Shoes',
    'Beauty',
    'Sale',
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categoryButtons.map((label) {
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: StadiumBorder(),
                // side: BorderSide(color: Color(0xFF8204FF)),
                elevation: 2,
                shadowColor: Colors.black.withOpacity(0.3),
                backgroundColor: Colors.white,
                foregroundColor: Color(0xFF8204FF),
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 14),
              ),
              child: Text(label),
            ),
          );
        }).toList(),
      ),
    );
  }
}
