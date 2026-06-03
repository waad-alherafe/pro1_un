import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pro1_un/page/cart_view.dart';
import 'package:pro1_un/page/favorites.dart';
import 'package:pro1_un/page/home_screen.dart';
import 'package:pro1_un/page/profile.dart';
import 'package:pro1_un/widget/ad_panner_slider.dart';
import 'package:pro1_un/widget/build_category_item.dart';
import 'package:pro1_un/widget/card_home_screen.dart';
import 'package:pro1_un/widget/gride_card_view.dart';
import 'package:pro1_un/widget/list_view_icons.dart';
import 'package:pro1_un/widget/search_textfile.dart';
import 'package:pro1_un/widget/stack_adpanner.dart';

class EcomView extends StatefulWidget {
  EcomView({super.key});

  @override
  State<EcomView> createState() => _EcomViewState();
}

class _EcomViewState extends State<EcomView> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    CartView(),
    Favorites(),
    Profile(),
  ];

  final List<BottomNavigationBarItem> navItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
    BottomNavigationBarItem(
      icon: Icon(Icons.shopping_cart_outlined),
      label: 'Cart',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings_outlined),
      label: 'Settings',
    ),
    BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: _pages[_currentIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.12),
                blurRadius: 16,
                spreadRadius: 1,
                offset: Offset(0, 6),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: BottomNavigationBar(
              items: navItems,
              currentIndex: _currentIndex,
              selectedItemColor: Color(0xFF8204FF),
              unselectedItemColor: Colors.grey,
              backgroundColor: Colors.white,
              elevation: 0,
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: true,
              showUnselectedLabels: false,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
