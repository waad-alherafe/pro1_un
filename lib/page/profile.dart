import 'package:flutter/material.dart';
import 'package:pro1_un/page/edit_profile.dart';
import 'package:pro1_un/page/order_history.dart';
import 'package:pro1_un/widget/list_option.dart';
import 'package:pro1_un/widget/quick_card.dart';

class Profile extends StatelessWidget {
  Profile({super.key});
  bool hasImage = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 30),
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Color(0xFF8204FF),
                  child: hasImage
                      ? ClipOval(
                          child: Image.asset(
                            'assets/download (64).jpg',
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        )
                      : Icon(Icons.person, size: 50, color: Colors.white),
                ),
                SizedBox(height: 16),
                Text(
                  'waad alherafe',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                // Text(
                //   'waad123452001@gmail.com',
                //   style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                // ),
                // const SizedBox(height: 3),
                Text(
                  '+963954547951',
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 62),
                      child: QuickCard(
                        icon: Icons.receipt_long_outlined,
                        label: 'order',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const OrdersHistory(),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(width: 40),
                    QuickCard(
                      icon: Icons.edit,
                      label: 'Edit',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const EditProfile(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                const Divider(
                  height: 20,
                  thickness: 1,
                  indent: 50,
                  endIndent: 50,
                ),
                ListOption(
                  icon: Icons.location_on_outlined,
                  label: 'Address Management',
                ),
                const Divider(
                  height: 20,
                  thickness: 0.5,
                  indent: 50,
                  endIndent: 50,
                ),
                ListOption(icon: Icons.lock_outline, label: 'Change password'),
                const Divider(
                  height: 20,
                  thickness: 0.5,
                  indent: 50,
                  endIndent: 50,
                ),
                ListOption(
                  icon: Icons.dark_mode_outlined,
                  label: 'Darkmode',
                  trailing: Switch(
                    value: false, // متغيّر حال السويتش
                    onChanged: (value) {
                      // تغيير الحالة هنا
                    },
                  ),
                ),
                const Divider(
                  height: 20,
                  thickness: 0.5,
                  indent: 50,
                  endIndent: 50,
                ),
                ListOption(icon: Icons.logout_outlined, label: 'logout'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
