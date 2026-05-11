import 'package:flutter/material.dart';
import 'package:pro1_un/widget/build_category_item.dart';

class ListViewIcons extends StatelessWidget {
  const ListViewIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          BuildCategoryItem(
            icon: Icons.redeem_outlined,
            lable: 'Gifts',
            bgColor: Color(0xFFF6EEFD),
            iconColor: Color.fromARGB(255, 166, 119, 249),
          ),
          BuildCategoryItem(
            icon: Icons.visibility_outlined,
            lable: 'Fashion',
            bgColor: Color(0xFFC7DEFF),
            iconColor: Color(0xff338AFF),
          ),
          BuildCategoryItem(
            icon: Icons.videogame_asset_outlined,
            lable: 'Gadget',
            bgColor: Color(0xffDEE7F1),
            iconColor: Color(0xff2E4771),
          ),
          BuildCategoryItem(
            icon: Icons.watch_outlined,
            lable: 'Watch',
            bgColor: Color(0xFFFFF3E7),
            iconColor: Color(0xffFFD09D),
          ),
          BuildCategoryItem(
            icon: Icons.diamond_outlined,
            lable: 'Accessories',
            bgColor: Color.fromARGB(255, 201, 236, 231),
            iconColor: Color.fromARGB(255, 20, 119, 104),
          ),
        ],
      ),
    );
  }
}
