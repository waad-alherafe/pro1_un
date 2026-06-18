import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:pro1_un/model/card_model.dart';
import 'package:pro1_un/widget/ad_panner_slider.dart';
import 'package:pro1_un/widget/gride_card_view.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final List<CardModel> proudectCardModel = [
    CardModel(
      image: 'assets/download (74).jpg',
      price: '33.33',
      name: 'design',
    ),
    CardModel(
      image: 'assets/download (74).jpg',
      price: '33.33',
      name: 'design',
    ),
    CardModel(
      image: 'assets/download (74).jpg',
      price: '33.33',
      name: 'design',
    ),
    CardModel(
      image: 'assets/download (74).jpg',
      price: '33.33',
      name: 'design',
    ),
  ];
  final TextEditingController _reviewController = TextEditingController();
  int rating = 4;
  int _userSelectedRating = 0;
  final double orgenalPrice = 149.65;
  final double? discountPrice = 99.99;
  final int availableQuantity = 4;
  final double discountRate = 12.5;
  int quantity = 1;
  int _currentImageIndex = 0;
  final CarouselSliderController _carouselController =
      CarouselSliderController();
  final List<String> imagProudctList = [
    'assets/download (76).jpg',
    'assets/download (77).jpg',
    'assets/Denim Jacket Outfit Inspo.jpg',
  ];
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.transparent,
                pinned: true,
                elevation: 0,
                expandedHeight: 480,
                leading: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),

                    icon: Icon(Icons.arrow_back),
                  ),
                ),
                actions: [
                  Padding(padding: EdgeInsets.all(8)),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.favorite_border_outlined),
                  ),
                ],
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),

                        child: AdPannerSlider(
                          imageList: imagProudctList,
                          height: 500,
                          viewportFraction: 1.0,
                          enlargeCenterPage: false,
                          controller: _carouselController,
                        ),
                      ),
                      Positioned(
                        top: 140,
                        right: 20,
                        child: Container(
                          width: 65,
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 5,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.5),
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.05),
                                blurRadius: 10,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: imagProudctList.asMap().entries.map((
                              entry,
                            ) {
                              int index = entry.key;
                              String imagePath = entry.value;
                              bool isSelected = index == _currentImageIndex;

                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _currentImageIndex = index;
                                  });

                                  _carouselController.animateToPage(
                                    index,
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                  );
                                },
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                    vertical: 5,
                                  ),
                                  width: 45,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    border: isSelected
                                        ? Border.all(
                                            color: const Color(0xFF8204FF),
                                            width: 2,
                                          )
                                        : null,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      if (isSelected)
                                        BoxShadow(
                                          color: const Color(
                                            0xFF8204FF,
                                          ).withValues(alpha: 0.3),
                                          blurRadius: 5,
                                        ),
                                    ],
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.asset(
                                      imagePath,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Urban Cargo Pants',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            '\$${discountPrice ?? orgenalPrice}',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          if (discountPrice != null) ...[
                            const SizedBox(width: 10),
                            Text(
                              '\$$orgenalPrice',
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xFF8204FF),
                                decoration:
                                    TextDecoration.lineThrough, // خط التشطيب
                              ),
                            ),
                            const SizedBox(width: 12),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.red.shade50,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                'Discount $discountRate%',
                                style: const TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                      //هون وقت الربط لازم انتبه للمتغير تبع الكمية --------------------------------------------
                      //-------------------------------------------------------------------
                      //-----------------------------------------------------
                      SizedBox(height: 20),
                      Row(
                        children: [
                          // تغيير الأيقونة واللون حسب التوفر
                          Icon(
                            availableQuantity > 0
                                ? Icons.check_circle_outline
                                : Icons.highlight_off,
                            color: availableQuantity > 0
                                ? Colors.teal.shade600
                                : Colors.red.shade600,
                            size: 18,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            availableQuantity > 0
                                ? ' In Stock '
                                : 'Out of Stock',
                            style: TextStyle(
                              color: availableQuantity > 0
                                  ? Colors.teal.shade700
                                  : Colors.red.shade700,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),

                          // التنبيه الذكي: يظهر فقط إذا كانت الكمية بين 1 و 5 قطع
                          if (availableQuantity > 0 &&
                              availableQuantity <= 5) ...[
                            const SizedBox(width: 15),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.amber.shade100,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                'Only $availableQuantity items left  ! ⚠️',
                                style: TextStyle(
                                  color: Colors.amber.shade900,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Modern cargo pants featuring multiple utility pockets, a comfortable fit, and durable fabric for both style and functionality..',
                        style: TextStyle(fontSize: 16),
                      ),
                      Divider(color: Colors.grey.shade300, thickness: 1),
                      const SizedBox(height: 16),

                      Text(
                        'This item is crafted from premium materials. Styled with an elegant design, perfect for daily fashion outfits. Available with high-quality stitching and rich textures direct from PocketShop stores.',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                          height: 1.5,
                        ),
                      ),

                      const SizedBox(height: 24),
                      const Divider(),
                      const SizedBox(height: 12),
                      const Text(
                        'Ratings & Reviews',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color(0xFF8204FF).withValues(
                            alpha: 0.05,
                          ), // لون خلفية خفيف متناسق مع هويتك البصرية
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: const Color(0xFF8204FF).withValues(alpha: 0.2),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'How would you rate our store?',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(height: 8),

                            // أزرار النجوم التفاعلية ليختار المستخدم تقييمه
                            Row(
                              children: List.generate(5, (index) {
                                int starValue = index + 1;
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _userSelectedRating =
                                          starValue; // تحديث عدد النجوم المحددة
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 4.0),
                                    child: Icon(
                                      Icons.star,
                                      size: 28,
                                      // إذا كان رقم النجمة أقل من أو يساوي خيار المستخدم نلونها بالأصفر، وإلا تظل رمادية
                                      color: starValue <= _userSelectedRating
                                          ? Colors.amber
                                          : Colors.grey.shade400,
                                    ),
                                  ),
                                );
                              }),
                            ),
                            const SizedBox(height: 12),

                            // حقل إدخال النص لكتابة المراجعة
                            TextField(
                              controller: _reviewController,
                              maxLines: 2,
                              decoration: InputDecoration(
                                hintText:
                                    'Write your review here... (Optional)',
                                hintStyle: TextStyle(
                                  color: Colors.grey.shade500,
                                  fontSize: 13,
                                ),
                                fillColor: Colors.white,
                                filled: true,
                                contentPadding: const EdgeInsets.all(12),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade300,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: const BorderSide(
                                    color: Color(0xFF8204FF),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),

                            // زر إرسال التقييم للباك إيند
                            Align(
                              alignment: Alignment.centerLeft,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_userSelectedRating == 0) {
                                    // تنبيه المستخدم إذا لم يحدد أي نجمة
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        backgroundColor: Color(0xFF8204FF),
                                        content: Text(
                                          ' Please select a star rating first.',
                                        ),
                                      ),
                                    );
                                    return;
                                  }

                                  // هنا مستقبلاً ستضع دالة إرسال البيانات للباك إيند (API Call)
                                  print(
                                    'النجوم المختارة: $_userSelectedRating',
                                  );
                                  print(
                                    'التعليق المكتوب: ${_reviewController.text}',
                                  );

                                  // رسالة نجاح وتصفير الحقول بعد الإرسال
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      backgroundColor: Color(0xFF8204FF),
                                      content: Text(
                                        'Thank you! Your review has been submitted successfully.',
                                      ),
                                    ),
                                  );
                                  setState(() {
                                    _userSelectedRating = 0;
                                    _reviewController.clear();
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF8204FF),
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 8,
                                  ),
                                ),
                                child: const Text(
                                  'Submit Review',
                                  style: TextStyle(fontSize: 13),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),

                      // 3. عرض التعليقات القادمة من الباك إيند (قائمة المراجعات الحالية)
                      // هنا نقوم بعمل قائمة بالتعليقات السابقة
                      ListView.builder(
                        shrinkWrap: true, // مهم جداً لأننا داخل سكرولر عمودي
                        physics:
                            const NeverScrollableScrollPhysics(), // منع التضارب مع السكرول الأساسي
                        itemCount: 2, // عدد التعليقات القادمة من الباك إيند
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.only(bottom: 12),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade50,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.grey.shade100),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'user name', // هون بحط اسم المستخدم يلي جاية من الباك
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                    // بدال الستار انديكس بحط البيانات يلي جاية من الباك
                                    Row(
                                      children: List.generate(5, (starIndex) {
                                        return Icon(
                                          Icons.star,
                                          color: starIndex < rating
                                              ? Colors.amber
                                              : Colors
                                                    .grey
                                                    .shade300, // مثال لتقييم 4 نجوم
                                          size: 14,
                                        );
                                      }),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  //هون بدال الكومينت بحط النص يلي جاية من الباك
                                  'comment',
                                  style: TextStyle(
                                    color: Colors.grey.shade700,
                                    fontSize: 13,
                                    height: 1.4,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 25),
                      Text(
                        'Similar Products',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GrideCardView(cardsModel: proudectCardModel),
                      const SizedBox(height: 120),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Container(
                height: 70,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 0.1,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.04),
                      blurRadius: 10,
                      offset: Offset(0, -5),
                    ),
                  ],
                ),
                child: SafeArea(
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          //height: 70,
                          margin: const EdgeInsets.symmetric(
                            horizontal: 16,
                            // vertical: 20,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),

                          child: Transform.translate(
                            offset: const Offset(0, -10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  constraints: const BoxConstraints(),
                                  padding: EdgeInsets.zero,
                                  iconSize: 18,
                                  onPressed:
                                      (quantity > 1 && availableQuantity > 0)
                                      ? () {
                                          setState(() {
                                            quantity--;
                                          });
                                        }
                                      : null,
                                  icon: Icon(
                                    Icons.remove,
                                    size: 18,
                                    color:
                                        (quantity > 1 && availableQuantity > 0)
                                        ? const Color(0xFF8204FF)
                                        : Colors.grey.shade400,
                                  ),
                                ),
                                Text(
                                  quantity.toString().padLeft(2, '0'),
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                IconButton(
                                  constraints: const BoxConstraints(),
                                  padding: EdgeInsets.zero,
                                  iconSize: 18,
                                  onPressed: (quantity <= availableQuantity)
                                      ? () {
                                          setState(() {
                                            quantity++;
                                          });
                                        }
                                      : null,
                                  icon: Icon(
                                    Icons.add,
                                    size: 18,
                                    color: (quantity <= availableQuantity)
                                        ? const Color(0xFF8204FF)
                                        : Colors.grey.shade400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      Transform.translate(
                        offset: const Offset(0, -10),
                        child: ElevatedButton(
                          onPressed:
                              (availableQuantity > 0 &&
                                  quantity <= availableQuantity)
                              ? () {
                                  // هنا تضع أكشن الإضافة إلى السلة الفعلي
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'تم إضافة $quantity قطع إلى السلة',
                                      ),
                                    ),
                                  );
                                }
                              : null,
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 4,
                            ),
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            shadowColor: Colors.black,
                            elevation: 5,
                          ),

                          child: Text(
                            'Add to Cart',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF8204FF),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
