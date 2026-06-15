import 'package:flutter/material.dart';
import 'package:pro1_un/model/card_model.dart';
import 'package:pro1_un/page/categories_view.dart';
import 'package:pro1_un/widget/gride_card_view.dart';
import 'package:pro1_un/widget/list_view_icons.dart';
import 'package:pro1_un/widget/search_textfile.dart';
import 'package:pro1_un/widget/stack_adpanner.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final List<CardModel> cardsModel = [
    CardModel(
      image: 'assets/لوك نهاري سيج_أوليف بسيط.jpg',
      price: '2900',
      name: 'fashion',
    ),
    CardModel(
      image: 'assets/Rolex Datejust Everose Rolesor – Timeless Elegance.jpg',
      price: '555',
      name: 'fashion fashion for women',
    ),
    CardModel(image: 'assets/obroye精华.jpg', price: '3455', name: 'fashion'),
    CardModel(
      image:
          'assets/Men’s Summer Business Casual Outfit _ Champagne Shirt & Off-White Pants.jpg',
      price: '3455',
      name: 'fashion',
    ),
    CardModel(
      image:
          'assets/Luxury Maroon Hoodie - TIN BROTHER Gold Logo Embroidery - Oversized Fit.jpg',
      price: '3455',
      name: 'fashion',
    ),
    CardModel(image: 'assets/ai muslimah.jpg', price: '3455', name: 'fashion'),
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
            SizedBox(height: 20),
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
              child: GrideCardView(cardsModel: cardsModel),
            ),
          ],
        ),
      ),
    );
  }
}
