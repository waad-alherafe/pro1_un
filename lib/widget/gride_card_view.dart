import 'package:flutter/material.dart';
import 'package:pro1_un/model/card_model.dart';
import 'package:pro1_un/page/categories_view.dart';
import 'package:pro1_un/widget/card_home_screen.dart';

class GrideCardView extends StatelessWidget {
  GrideCardView({super.key, required this.displayedProducts});

  final List<ProductItem> displayedProducts;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: displayedProducts.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 14,
        mainAxisSpacing: 14,
        childAspectRatio: 0.62, //
      ),
      itemBuilder: (context, index) {
        return CardHomeScreen(product: displayedProducts[index]);
      },
    );
  }
}
