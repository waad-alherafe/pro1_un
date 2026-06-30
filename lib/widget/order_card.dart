// هي الكاردات تبع الكارت والاورديرز بكل انواعها يعني ملغية او نشطة او مكتملة
//هون عملت كذا شرط مشان اذا كانت الكارد للكرت او للاورديرز بانواعها مثلا الملغية مافيها شي اما المكتملة مثلا فيها تقييم وهيك
//

import 'package:flutter/material.dart';
import 'package:pro1_un/page/product_details.dart';

enum CardType { canceled, completed, active, cart }

class OrderCard extends StatelessWidget {
  const OrderCard({
    super.key,
    required this.title,
    required this.price,
    required this.quantity,
    required this.imageUrl,
    required this.cardtype,
    this.onDecrement,
    this.onIncrement,
    this.onActionPressed,
  });
  final String title;
  final String price;
  final int quantity;
  final VoidCallback? onIncrement;
  final String imageUrl;
  final VoidCallback? onDecrement;
  final CardType cardtype;
  final VoidCallback? onActionPressed;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      direction: cardtype == CardType.cart
          ? DismissDirection.endToStart
          : DismissDirection.none,
      background: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.all(12),
        alignment: Alignment.centerRight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Color.fromARGB(255, 168, 4, 10),
        ),
        child: const Icon(Icons.delete_outline_rounded, color: Colors.white),
      ),
      onDismissed: (direction) {
        if (cardtype == CardType.cart) {
          print("تم حذف العنصر من السلة");
        }
      },
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProductDetails()),
          );
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.6),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  width: 80,
                  height: 80,
                  color: Colors.white,
                  child: Image.asset(imageUrl, fit: BoxFit.cover),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      price,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.green,
                      ),
                    ),
                    if (cardtype == CardType.active ||
                        cardtype == CardType.completed)
                      Text(
                        'Qty: ${quantity ?? 1}',
                        style: TextStyle(
                          color: Color.fromARGB(255, 87, 82, 92),
                        ),
                      ),
                  ],
                ),
              ),
              if (cardtype == CardType.cart)
                Column(
                  children: [
                    GestureDetector(
                      onTap: onIncrement,
                      child: Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.white,

                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.6),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.add,
                          size: 20,
                          color: Color(0xFF8204FF),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      quantity.toString().padLeft(2, '0'),
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    GestureDetector(
                      onTap: onDecrement,
                      child: Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.white,

                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.6),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),

                        child: const Icon(
                          Icons.remove,
                          size: 20,
                          color: Color(0xFF8204FF),
                        ),
                      ),
                    ),
                  ],
                ),

              if (cardtype == CardType.active)
                Column(
                  children: [
                    // const SizedBox(height: 40),
                    GestureDetector(
                      onTap: onActionPressed,
                      child: Container(
                        height: 35,
                        width: 85,
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.white,

                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.6),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            'track order',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF8204FF),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: onActionPressed,
                      child: Container(
                        height: 35,
                        width: 85,
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.white,

                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.6),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            'cancel order',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 207, 54, 54),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              if (cardtype == CardType.completed)
                GestureDetector(
                  onTap: onActionPressed,
                  child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.white,

                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.6),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.star_rate_outlined,
                        size: 20,
                        color: Color(0xFF8204FF),
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(
                                'Broduct Rate',
                                textAlign: TextAlign.center,
                              ),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text('what is your rate for our product ?'),
                                  SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: List.generate(5, (index) {
                                      return Expanded(
                                        child: IconButton(
                                          onPressed: () {
                                            //منطق حفظ التقييم
                                          },
                                          icon: Icon(
                                            Icons.star_border_rounded,
                                            color: Colors.amber,
                                          ),
                                        ),
                                      );
                                    }),
                                  ),
                                ],
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('cancel'),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    //هون بحط الربط مشان ابعت التقييم للباك
                                    //بعدين

                                    Navigator.of(context).pop();
                                  },
                                  child: Text('send Rate'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
