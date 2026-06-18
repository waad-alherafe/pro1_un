import 'package:flutter/material.dart';

class FilterBar extends StatefulWidget {
  FilterBar({super.key});

  @override
  State<FilterBar> createState() => _FilterBarState();
}

class _FilterBarState extends State<FilterBar> {
  //   final List<String> filterButton =[
  bool isReatingSelected = false;

  bool isColorSelected = false;

  bool isSizeSeleted = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.tune, size: 20, color: Colors.black54),
        SizedBox(width: 10),
        GestureDetector(
          onTap: () {
            setState(() {
              isReatingSelected = !isReatingSelected;
            });
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: isReatingSelected ? Color(0xFF8204FF) : Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: isReatingSelected ? Color(0xFF8204FF) : Colors.grey,
              ),
            ),
            child: Text(
              'minprice',
              style: TextStyle(
                color: isReatingSelected ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
        SizedBox(width: 10),
        GestureDetector(
          onTap: () {
            setState(() {
              isColorSelected = !isColorSelected;
            });
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: isColorSelected ? Color(0xFF8204FF) : Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: isColorSelected ? Color(0xFF8204FF) : Colors.grey,
              ),
            ),
            child: Text(
              'maxprice',
              style: TextStyle(
                color: isColorSelected ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
        SizedBox(width: 10),
        GestureDetector(
          onTap: () {
            setState(() {
              isSizeSeleted = !isSizeSeleted;
            });
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: isSizeSeleted ? Color(0xFF8204FF) : Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: isSizeSeleted ? Color(0xFF8204FF) : Colors.grey,
              ),
            ),
            child: Text(
              'Size',
              style: TextStyle(
                color: isSizeSeleted ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
