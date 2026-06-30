import 'package:flutter/material.dart';
import 'package:pro1_un/widget/order_card.dart';

class OrderList extends StatefulWidget {
  final CardType targettype;

  const OrderList({super.key, required this.targettype});

  @override
  State<OrderList> createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  @override
  int quantity = 1;
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: 16),
      children: [
        if (widget.targettype == CardType.active)
          OrderCard(
            title: 'Product Name',
            price: '\$19.99',
            quantity: quantity,
            onIncrement: () {},
            imageUrl: 'assets/download (64).jpg',
            onDecrement: () {},
            cardtype: CardType.active,
          ),
        if (widget.targettype == CardType.cart)
          OrderCard(
            title: 'Product Name',
            price: '\$19.99',
            quantity: quantity,
            onIncrement: () {
              setState(() {
                quantity++;
              });
            },
            imageUrl: 'assets/download (64).jpg',
            onDecrement: () {
              setState(() {
                quantity--;
              });
            },
            cardtype: CardType.cart,
          ),
        if (widget.targettype == CardType.completed)
          OrderCard(
            title: 'Product Name',
            price: '\$19.99',
            quantity: 1,
            onIncrement: () {},
            imageUrl: 'assets/download (64).jpg',
            onDecrement: () {},
            cardtype: CardType.completed,
          ),
        if (widget.targettype == CardType.canceled)
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
