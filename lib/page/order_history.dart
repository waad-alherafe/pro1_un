import 'package:flutter/material.dart';
import 'package:pro1_un/widget/order_card.dart';
import 'package:pro1_un/widget/order_list.dart';

class OrdersHistory extends StatelessWidget {
  const OrdersHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            'My Orders ',
            style: TextStyle(color: Colors.black),
          ),
          bottom: const TabBar(
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Color(0xFF8204FF),
            tabs: [
              Tab(text: 'Active'),
              Tab(text: 'Completed'),
              Tab(text: 'Canceled'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            OrderList(targettype: CardType.active),
            OrderList(targettype: CardType.completed),

            OrderList(targettype: CardType.canceled),

            // Center(child: Text('canceled')),
          ],
        ),
      ),
    );
  }
}
