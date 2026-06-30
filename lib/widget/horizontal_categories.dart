import 'package:flutter/material.dart';

class CategoryItem {
  final int id;
  final String name;
  final IconData icon;
  CategoryItem({required this.id, required this.name, required this.icon});
}

class HorizontalCategories extends StatefulWidget {
  const HorizontalCategories({super.key});

  @override
  State<HorizontalCategories> createState() => _FilterBar2State();
}

class _FilterBar2State extends State<HorizontalCategories> {
  final List<CategoryItem> categories = [
    CategoryItem(id: 1, name: "هدايا", icon: Icons.card_giftcard),
    CategoryItem(id: 2, name: "أزياء", icon: Icons.checkroom),
    CategoryItem(id: 3, name: "ألعاب", icon: Icons.videogame_asset),
    CategoryItem(id: 4, name: "ساعات", icon: Icons.watch),
    CategoryItem(id: 5, name: "إكسسوارات", icon: Icons.auto_awesome),
  ];
  int selectedCategoryId = 1;
  final Color primaryColor = const Color(0xFF8204FF);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final cat = categories[index];
          final isSelected = cat.id == selectedCategoryId;
          return GestureDetector(
            onTap: () => setState(() => selectedCategoryId = cat.id),
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: isSelected ? primaryColor : const Color(0xFFF8F9FA),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                children: [
                  Icon(
                    cat.icon,
                    color: isSelected ? Colors.white : Colors.black54,
                    size: 18,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    cat.name,
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
