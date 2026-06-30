import 'package:flutter/material.dart';
import 'package:pro1_un/model/card_model.dart';
import 'package:pro1_un/widget/card_home_screen.dart';
import 'package:pro1_un/widget/filter_bar.dart';
import 'package:pro1_un/widget/filter_chips.dart';
import 'package:pro1_un/widget/horizontal_categories.dart';
import 'package:pro1_un/widget/gride_card_view.dart';
import 'package:pro1_un/widget/search_textfile.dart';

import 'package:flutter/material.dart';

// نموذج بيانات المنتج متوافق تماماً مع قاعدة بيانات Laravel ومتطلبات المشروع
class ProductItem {
  final int id;
  final String name;
  final double originalPrice;
  final double? discountPrice; // السعر بعد الخصم إن وجد
  final String image;
  final double rating;
  final int reviewsCount;
  final int stockLeft;
  final bool isFeatured; // منتج مميز
  final bool isBestSeller; // الأكثر مبيعاً
  bool isWishlist;

  ProductItem({
    required this.id,
    required this.name,
    required this.originalPrice,
    this.discountPrice,
    required this.image,
    required this.rating,
    required this.reviewsCount,
    required this.stockLeft,
    this.isFeatured = false,
    this.isBestSeller = false,
    this.isWishlist = false,
  });

  // حساب نسبة الخصم ديناميكياً ليظهر في الـ Badge
  int get discountPercentage {
    if (discountPrice == null || originalPrice == 0) return 0;
    return (((originalPrice - discountPrice!) / originalPrice) * 100).round();
  }
}

class CategoriesView extends StatefulWidget {
  const CategoriesView({Key? key}) : super(key: key);

  @override
  State<CategoriesView> createState() => _AdvancedProductListScreenState();
}

class _AdvancedProductListScreenState extends State<CategoriesView> {
  // الثيم والألوان المعتمدة من قبلكِ
  final Color primaryColor = const Color(0xFF8204FF);
  final Color greyColor = const Color(0XFF9E9E9E);

  // المتغير المسؤول عن خيار الترتيب الحالي (مطلب المتطلبات صفحة 3)
  String currentSortOption = 'الأحدث';

  // قائمة خيارات الترتيب الكاملة المطابقة للمتطلبات
  final List<String> sortOptions = [
    'الأحدث',
    'السعر الأقل',
    'السعر الأعلى',
    'الأعلى تقييماً',
    'الأكثر مبيعاً',
  ];

  // محاكاة البيانات الشاملة لجميع الحالات (خصم، نفاد مخزون، مبيعات عالية)
  List<ProductItem> displayedProducts = [
    ProductItem(
      id: 1,
      name: "نظارات سباحة احترافية Zone3",
      originalPrice: 150.0,
      discountPrice: 135.0,
      image: "assets/ai muslimah.jpg",
      rating: 4.5,
      reviewsCount: 201,
      stockLeft: 15,
      isFeatured: true,
    ),
    ProductItem(
      id: 2,
      name: "نظارات سباحة إطار كبير Big Frame",
      originalPrice: 145.0,
      image: "assets/Denim Jacket Outfit Inspo.jpg",
      rating: 4.0,
      reviewsCount: 185,
      stockLeft: 4,
      isBestSeller: true,
    ),
    ProductItem(
      id: 3,
      name: "حقيبة معدات السباحة المقاومة للماء",
      originalPrice: 94.0,
      image: "assets/Design Modern Headphones Product Flyer.jpg",
      rating: 4.2,
      reviewsCount: 102,
      stockLeft: 0,
    ), // غير متوفر
    ProductItem(
      id: 4,
      name: "ساعة ذكية رياضية إصدار 2026 الرقمي",
      originalPrice: 200.0,
      discountPrice: 160.0,
      image: "assets/download (63).jpg",
      rating: 4.9,
      reviewsCount: 312,
      stockLeft: 8,
      isBestSeller: true,
    ),
  ];

  bool isLoadingMore = false;

  // دالة محاكاة الـ Load More لطلب بيانات إضافية من الـ API (صفحة 3 بالملف)
  Future<void> loadMoreProducts() async {
    setState(() => isLoadingMore = true);
    await Future.delayed(
      const Duration(seconds: 1),
    ); // محاكاة استجابة الـ Backend
    setState(() {
      displayedProducts.add(
        ProductItem(
          id: 5,
          name: "منتج إضافي قادم عبر الـ Pagination",
          originalPrice: 75.0,
          image:
              "assets/Luxury Maroon Hoodie - TIN BROTHER Gold Logo Embroidery - Oversized Fit.jpg",
          rating: 4.3,
          reviewsCount: 45,
          stockLeft: 20,
        ),
      );
      isLoadingMore = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          " Products list ",
          style: TextStyle(
            color: primaryColor,
            fontWeight: FontWeight.bold,
            fontFamily: 'Cairo',
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              // قسم البحث والترتيب (Dropdown)
              Row(
                children: [
                  Expanded(child: SearchTextfile()),
                  SizedBox(width: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0XFFE0E0E0)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: DropdownButton<String>(
                      value: currentSortOption,
                      icon: Icon(Icons.arrow_drop_down, color: primaryColor),
                      underline: const SizedBox(),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Cairo',
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          currentSortOption = newValue!;
                          // هنا يتم برمجة فرز المصفوفة طبقاً للخيار المحدد
                        });
                      },
                      items: sortOptions.map<DropdownMenuItem<String>>((
                        String value,
                      ) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              FilterChips(),
              const SizedBox(height: 16),
              HorizontalCategories(),
              const SizedBox(height: 16),

              // شبكة عرض المنتجات المتكاملة
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      GrideCardView(displayedProducts: displayedProducts),
                      const SizedBox(height: 20),

                      // زر الـ Load More / Pagination المطلوب في المتطلبات
                      _buildPaginationButton(),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPaginationButton() {
    return isLoadingMore
        ? CircularProgressIndicator(color: primaryColor)
        : OutlinedButton(
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: primaryColor),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            ),
            onPressed: loadMoreProducts,
            child: Text(
              "(Load More)",
              style: TextStyle(
                color: primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          );
  }
}
