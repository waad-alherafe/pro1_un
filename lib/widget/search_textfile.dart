import 'package:flutter/material.dart';

class SearchTextfile extends StatelessWidget {
  const SearchTextfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),

      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.7),
              spreadRadius: 2,
              blurRadius: 10,
              offset: Offset(0, 3),
            ),
          ],
          borderRadius: BorderRadius.circular(50),
        ),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'search',
            hintStyle: TextStyle(color: Colors.grey[600]),
            prefixIcon: Icon(Icons.search, color: Color(0xFF8204FF)),
            suffixIcon: Icon(Icons.tune, color: Colors.grey),
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(vertical: 15),
          ),
        ),
      ),
    );
  }
}
