import 'package:flutter/material.dart';
import 'package:pro1_un/model/card_model.dart';

class CardHomeScreen extends StatelessWidget {
  CardHomeScreen({super.key, required this.cardModel});

  final CardModel cardModel;
  @override
  Widget build(BuildContext context) {
    {
      return Container(
        width: 160, // عرض الكارد
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(
                0.1,
              ), // لون الظل (يفضل شفافية منخفضة)
              spreadRadius: 1, // مدى انتشار الظل من حواف الكارد
              blurRadius: 8, // درجة "تغبيش" أو نعومة الظل
              offset: const Offset(0, 4), // إزاحة الظل (0 يمين/يسار، 4 للأسفل)
            ),
          ],
          color: Colors.white, // لون خلفية فاتح جداً مثل الصورة
          borderRadius: BorderRadius.circular(15),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(16),
                  child: Image.asset(
                    cardModel.image,
                    height: 100,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // الجزء السفلي: اسم المنتج والسعر وأيقونة السلة
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          cardModel.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(width: 80),
                        Icon(
                          Icons.favorite_border,
                          size: 20,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          cardModel.price,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                        // زر إضافة للسلة صغير
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          child: const Icon(
                            Icons.add_shopping_cart,
                            size: 16,
                            color: Color(0xFF8204FF),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
