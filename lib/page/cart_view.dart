import 'package:flutter/material.dart';
import 'package:pro1_un/widget/order_card.dart';
import 'package:pro1_un/widget/order_list.dart';

class CartView extends StatefulWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  State<CartView> createState() => _CartView();
}

class _CartView extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    // الألوان المعتمدة من قائمة الألوان تبعك
    const Color primaryColor = Color(0xFF8204FF); // البنفسجي الأساسي
    const Color grayTextColor = Color(0xFF9E9E9E); // لون السعر والرماديات

    return Scaffold(
      backgroundColor: Colors.white, // لون الخلفية أبيض كما طلبتِ
      // 1. شريط التطبيق العلوي (AppBar)
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          ' Cart',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),

      // 2. محتوى الشاشة
      body: Column(
        children: [
          // قائمة المنتجات اللي صممتيها مسبقاً داخل الـ Expanded لتأخذ المساحة المتاحة
          Expanded(child: OrderList(targettype: CardType.cart)),

          // 3. الجزء السفلي الخاص بالفاتورة وزر الدفع
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(
                    0.1,
                  ), // لون الظل بالكونتينر أسود مع شفافية 0.1 كما طلبتِ
                  blurRadius: 10,
                  offset: const Offset(0, -4),
                ),
              ],
            ),
            child: SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // تفاصيل الحساب والإجمالي
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        ' total count:',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        '\$205.00', // القيمة الإجمالية (يمكن ربطها بـ State لاحقاً)
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color:
                              primaryColor, // السعر الإجمالي باللون البنفسجي الأساسي
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // زر إتمام الشراء باللون البنفسجي والكتابة بيضاء
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // الأكشن الخاص بالدفع
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            primaryColor, // اللون البنفسجي 0xFF8204FF
                        foregroundColor: Colors.white, // كتابة الزر بيضاء
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        elevation: 0,
                      ),
                      child: const Text(
                        '  Confirm Order and Complete Purchase',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
