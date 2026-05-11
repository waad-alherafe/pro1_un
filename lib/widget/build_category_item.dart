import 'dart:ui';

import 'package:flutter/material.dart';

class BuildCategoryItem extends StatelessWidget {
  const BuildCategoryItem({
    super.key,
    required this.icon,
    required this.lable,
    required this.bgColor,
    required this.iconColor,
  });
  final IconData icon;
  final String lable;
  final Color bgColor;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: bgColor,
              // color: Color(0xFFF6EEFD),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              // Icons.redeem_outlined,
              color: iconColor,
              size: 30,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: Text(
            lable,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
