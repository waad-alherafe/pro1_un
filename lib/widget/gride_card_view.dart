import 'package:flutter/material.dart';
import 'package:pro1_un/model/card_model.dart';
import 'package:pro1_un/widget/card_home_screen.dart';

class GrideCardView extends StatelessWidget {
  GrideCardView({super.key});
  List<CardModel> cardsModel = [
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
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        childAspectRatio: 0.9,
      ),
      itemCount: cardsModel.length,
      itemBuilder: (context, index) {
        final item = cardsModel[index];
        return CardHomeScreen(
          cardModel: CardModel(
            image: item.image,
            price: item.price,
            name: item.name,
          ),
        );
      },
    );
  }
}
