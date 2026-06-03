import 'package:flutter/material.dart';
import 'package:pro1_un/model/card_model.dart';
import 'package:pro1_un/widget/filter_bar.dart';
import 'package:pro1_un/widget/filter_bar2.dart';
import 'package:pro1_un/widget/gride_card_view.dart';
import 'package:pro1_un/widget/search_textfile.dart';

class CategoriesView extends StatelessWidget {
  CategoriesView({super.key});
  final List<CardModel> cardsModel = [
    CardModel(
      image: 'assets/لوك نهاري سيج_أوليف بسيط.jpg',
      price: '2900',
      name: 'fashion',
    ),
    CardModel(
      image: 'assets/Rolex Datejust Everose Rolesor – Timeless Elegance.jpg',
      price: '555',
      name: 'fashion',
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
        title: Text(
          'Categories',
          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchTextfile(),
              SizedBox(height: 20),
              FilterBar(),
              SizedBox(height: 16),
              FilterBar2(),
              SizedBox(height: 20),
              GrideCardView(cardsModel: cardsModel),
            ],
          ),
        ),
      ),
    );
  }
}
