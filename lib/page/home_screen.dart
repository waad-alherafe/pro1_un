import 'package:flutter/material.dart';
import 'package:pro1_un/model/card_model.dart';
import 'package:pro1_un/page/categories_view.dart';
import 'package:pro1_un/widget/gride_card_view.dart';
import 'package:pro1_un/widget/list_view_icons.dart';
import 'package:pro1_un/widget/search_textfile.dart';
import 'package:pro1_un/widget/stack_adpanner.dart';
import 'package:pro1_un/widget/why_choose_us.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final List<ProductItem> cardsModel = [
    ProductItem(
      id: 1,
      name: 'ساعة',
      originalPrice: 99,
      image: 'assets/obroye精华.jpg',
      rating: 3.4,
      reviewsCount: 2,
      stockLeft: 0,
    ),
    ProductItem(
      id: 2,
      name: 'بنطلون',
      originalPrice: 34,
      image: 'assets/Modern Headphones Product Poster Design.jpg',
      rating: 4.3,
      reviewsCount: 44,
      stockLeft: 3,
    ),
    ProductItem(
      id: 3,
      name: 'سماعات',
      originalPrice: 54,
      image: 'assets/Rolex Datejust Everose Rolesor – Timeless Elegance.jpg',
      rating: 7.4,
      reviewsCount: 4,
      stockLeft: 5,
    ),
    ProductItem(
      id: 4,
      name: 'هودي',
      originalPrice: 67,
      image: 'assets/download (74).jpg',
      rating: 2.5,
      reviewsCount: 9,
      stockLeft: 2,
    ),
    ProductItem(
      id: 5,
      name: 'اكسسوارات',
      originalPrice: 98,
      image: 'assets/download (77).jpg',
      rating: 6.5,
      reviewsCount: 10,
      stockLeft: 8,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.storefront, color: Color(0xFF8204FF)),
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
          ],
        ),
        actions: [
          // SizedBox(width: 130),
          Icon(Icons.favorite_border, color: Colors.grey),
          SizedBox(width: 10),
          Icon(Icons.notifications_none, color: Colors.grey),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SearchTextfile(),

            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(
                    'Categories',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 131, 130, 130),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(width: 200),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CategoriesView()),
                    );
                  },
                  child: Text(
                    "See All",
                    style: TextStyle(
                      color: Color(0xFF8204FF),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 10),

            ListViewIcons(),
            StackAdpanner(),
            const SizedBox(height: 20),
            WhyChooseUs(),
            const SizedBox(height: 40),
            Divider(
              thickness: 1,
              endIndent: 50,
              indent: 50,
              height: 1,
              color: Color(0xFF8204FF),
            ),
            const SizedBox(height: 40),

            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(
                    'Featured Products',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 131, 130, 130),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(width: 150),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    "See All",
                    style: TextStyle(
                      color: Color(0xFF8204FF),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GrideCardView(
                displayedProducts: cardsModel.take(4).toList(),
              ),
            ),
            const SizedBox(height: 60),
            const Divider(
              thickness: 1,
              endIndent: 50,
              indent: 50,
              height: 1,
              color: Color(0xFF8204FF),
            ),
            const SizedBox(height: 60),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(
                    'best seller',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 131, 130, 130),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 150),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    "See All",
                    style: TextStyle(
                      color: Color(0xFF8204FF),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GrideCardView(
                displayedProducts: cardsModel.take(4).toList(),
              ),
            ),
            const SizedBox(height: 60),
            const Divider(
              thickness: 1,
              endIndent: 50,
              indent: 50,
              height: 1,
              color: Color(0xFF8204FF),
            ),
            const SizedBox(height: 60),

            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(
                    'New Products',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 131, 130, 130),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 150),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    "See All",
                    style: TextStyle(
                      color: Color(0xFF8204FF),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GrideCardView(
                displayedProducts: cardsModel.take(4).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
