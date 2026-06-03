import 'package:flutter/material.dart';
import 'package:pro1_un/widget/order_card.dart';

class OrderList extends StatelessWidget {
  final CardType targettype;

  const OrderList({super.key, required this.targettype});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: 16),
      children: [
        if (targettype == CardType.active)
          OrderCard(
            title: 'Product Name',
            price: '\$19.99',
            quantity: 1,
            onIncrement: () {},
            imageUrl: 'assets/download (64).jpg',
            onDecrement: () {},
            cardtype: CardType.active,
          ),
        if (targettype == CardType.cart)
          OrderCard(
            title: 'Product Name',
            price: '\$19.99',
            quantity: 1,
            onIncrement: () {},
            imageUrl: 'assets/download (64).jpg',
            onDecrement: () {},
            cardtype: CardType.cart,
          ),
        if (targettype == CardType.completed)
          OrderCard(
            title: 'Product Name',
            price: '\$19.99',
            quantity: 1,
            onIncrement: () {},
            imageUrl: 'assets/download (64).jpg',
            onDecrement: () {},
            cardtype: CardType.completed,
          ),
        if (targettype == CardType.canceled)
          OrderCard(
            title: 'Product Name',
            price: '\$19.99',
            quantity: 1,
            onIncrement: () {},
            imageUrl: 'assets/download (64).jpg',
            onDecrement: () {},
            cardtype: CardType.canceled,
          ),
      ],
    );
  }
}
