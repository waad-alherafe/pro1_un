import 'package:flutter/material.dart';
import 'package:pro1_un/model/card_model.dart';
import 'package:pro1_un/page/categories_view.dart';
import 'package:pro1_un/page/product_details.dart';

class CardHomeScreen extends StatefulWidget {
  CardHomeScreen({super.key, required this.product});

  final ProductItem product;

  @override
  State<CardHomeScreen> createState() => _CardHomeScreenState();
}

class _CardHomeScreenState extends State<CardHomeScreen> {
  @override
  Widget build(BuildContext context) {
    bool hasDiscount = widget.product.discountPrice != null;
    final Color primaryColor = const Color(0xFF8204FF);
    final Color greyColor = const Color(0XFF9E9E9E);
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProductDetails()),
        );
      },

      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0XFFE0E0E0)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 1. منطقة الصورة الفوقية
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5F6F8),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: ClipRRect(
                          borderRadius: BorderRadiusGeometry.circular(16),
                          child: Image.asset(
                            height: 200,
                            width: double.infinity,
                            widget.product.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),

                  // 2. عرض الأسعار (السعر الأصلي + السعر بعد الخصم إن وجد)
                  Row(
                    children: [
                      Text(
                        "\$${hasDiscount ? widget.product.discountPrice!.toStringAsFixed(2) : widget.product.originalPrice.toStringAsFixed(2)}",
                        style: TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      if (hasDiscount) ...[
                        const SizedBox(width: 6),
                        Text(
                          "\$${widget.product.originalPrice.toStringAsFixed(2)}",
                          style: TextStyle(
                            color: greyColor,
                            decoration: TextDecoration.lineThrough,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 4),

                  // 3. تقييم النجوم
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 14),
                      const SizedBox(width: 2),
                      Text(
                        "${widget.product.rating}",
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        " (${widget.product.reviewsCount})",
                        style: TextStyle(color: greyColor, fontSize: 11),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),

                  // 4. اسم المنتج باللون الأسود
                  Text(
                    widget.product.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // 5. زر إضافة للسلة مباشرة (الموجود بأسفل الكارد)
                  SizedBox(
                    width: double.infinity,
                    height: 32,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: widget.product.stockLeft > 0
                            ? primaryColor
                            : const Color(0xFFE0E0E0),
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: widget.product.stockLeft > 0
                          ? () {
                              // كود الإضافة الفورية للسلة
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: primaryColor,

                                  content: Text(
                                    " ${widget.product.name} has been added successfully ! 🛒",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              );
                            }
                          : null, // معطل إذا كان غير متوفر
                      child: Text(
                        widget.product.stockLeft > 0
                            ? "add to cart"
                            : "Out of Stock ",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // 6. زر إضافة للمفضلة التلقائي (أعلى اليمين)
            Positioned(
              top: 10,
              right: 10,
              child: GestureDetector(
                onTap: () => setState(
                  () => widget.product.isWishlist = !widget.product.isWishlist,
                ),
                child: CircleAvatar(
                  radius: 14,
                  backgroundColor: Colors.white,
                  child: Icon(
                    widget.product.isWishlist
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: widget.product.isWishlist ? Colors.red : greyColor,
                    size: 16,
                  ),
                ),
              ),
            ),

            // 7. الـ Badges (شارات الخصم أو عدم التوفر - أعلى اليسار)
            Positioned(
              top: 10,
              left: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (widget.product.stockLeft == 0)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Text(
                        "غير متوفر",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 9,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  if (hasDiscount && widget.product.stockLeft > 0)
                    Container(
                      margin: const EdgeInsets.only(top: 4),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        "-${widget.product.discountPercentage}%",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 9,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
      // child: Container(
      //   width: 160,
      //   decoration: BoxDecoration(
      //     boxShadow: [
      //       BoxShadow(
      //         color: Colors.black.withOpacity(0.1),
      //         spreadRadius: 1,
      //         blurRadius: 8,
      //         offset: const Offset(0, 4),
      //       ),
      //     ],
      //     color: Colors.white,
      //     borderRadius: BorderRadius.circular(15),
      //   ),
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       Padding(
      //         padding: const EdgeInsets.all(15.0),
      //         child: ClipRRect(
      //           borderRadius: BorderRadius.circular(16),
      //           child: Image.asset(
      //             cardModel.image,
      //             height: 100,
      //             width: double.infinity,
      //             fit: BoxFit.cover,
      //           ),
      //         ),
      //       ),

      //       Padding(
      //         padding: const EdgeInsets.symmetric(
      //           horizontal: 10,
      //           vertical: 5,
      //         ),
      //         child: Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //             Row(
      //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //               children: [
      //                 Expanded(
      //                   child: Text(
      //                     cardModel.name,
      //                     style: const TextStyle(
      //                       fontWeight: FontWeight.bold,
      //                       fontSize: 14,
      //                     ),
      //                     maxLines: 1,
      //                     overflow: TextOverflow.ellipsis,
      //                   ),
      //                 ),
      //                 const SizedBox(width: 4),
      //                 Icon(
      //                   Icons.favorite_border,
      //                   size: 20,
      //                   color: Colors.grey,
      //                 ),
      //               ],
      //             ),
      //             const SizedBox(height: 5),
      //             Row(
      //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //               children: [
      //                 Text(
      //                   cardModel.price,
      //                   style: const TextStyle(
      //                     color: Colors.grey,
      //                     fontSize: 12,
      //                   ),
      //                 ),

      //                 Container(
      //                   padding: const EdgeInsets.all(4),
      //                   decoration: BoxDecoration(
      //                     color: Colors.white,
      //                     borderRadius: BorderRadius.circular(8),
      //                     border: Border.all(color: Colors.grey.shade300),
      //                   ),
      //                   child: const Icon(
      //                     Icons.add_shopping_cart,
      //                     size: 16,
      //                     color: Color(0xFF8204FF),
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           ],
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
