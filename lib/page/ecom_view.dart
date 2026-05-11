import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pro1_un/widget/ad_panner_slider.dart';
import 'package:pro1_un/widget/build_category_item.dart';
import 'package:pro1_un/widget/card_home_screen.dart';
import 'package:pro1_un/widget/gride_card_view.dart';
import 'package:pro1_un/widget/list_view_icons.dart';
import 'package:pro1_un/widget/search_textfile.dart';
import 'package:pro1_un/widget/stack_adpanner.dart';

class EcomView extends StatelessWidget {
  const EcomView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.auto_awesome, color: Color(0xFF8204FF)),
            SizedBox(width: 10),
            Text(
              'ُPocket',
              style: TextStyle(
                color: Color.fromARGB(255, 4, 0, 8),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Shop',
              style: TextStyle(
                color: Color(0xFF8204FF),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Text(
            //   'etShop',
            //   style: TextStyle(
            //     color: Colors.black,
            //     fontSize: 16,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
            SizedBox(width: 130),
            Icon(Icons.favorite_border, color: Colors.grey),
            SizedBox(width: 10),
            Icon(Icons.notifications_none, color: Colors.grey),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SearchTextfile(),

            Padding(
              padding: const EdgeInsets.only(right: 220),
              child: Text(
                'Categories',
                style: TextStyle(
                  color: const Color.fromARGB(255, 131, 130, 130),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            SizedBox(height: 10),
            ListViewIcons(),
            StackAdpanner(),
            SizedBox(height: 20),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 9),
                  child: Text(
                    'Featured Proudct',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 131, 130, 130),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(width: 180),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    "See All",
                    style: TextStyle(
                      color: Color(0xFF8204FF), // اللون البنفسجي الخاص بكِ
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            GrideCardView(),
          ],
        ),
      ),
    );
  }
}
