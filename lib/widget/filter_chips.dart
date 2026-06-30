import 'package:flutter/material.dart';

class FilterChips extends StatefulWidget {
  const FilterChips({super.key});

  @override
  State<FilterChips> createState() => _FilterChipsState();
}

class _FilterChipsState extends State<FilterChips> {
  @override
  Widget build(BuildContext context) {
    final Color primaryColor = const Color(0xFF8204FF);
    final Color greyColor = const Color(0XFF9E9E9E);
    List<String> filters = ["فلترة 🎛️", "التقييم ⭐", "السعر 💰", "التوفر 📦"];
    return SizedBox(
      height: 35,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: filters.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(right: 8),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0XFFE0E0E0)),
            ),
            child: Text(
              filters[index],
              style: TextStyle(
                color: greyColor,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          );
        },
      ),
    );
  }
}
