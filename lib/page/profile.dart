import 'dart:io'; // مهم جداً لقراءة ملف الصورة المحددة من الهاتف
import 'package:flutter/material.dart';
import 'package:pro1_un/page/edit_profile.dart';
import 'package:pro1_un/page/order_history.dart';
import 'package:pro1_un/page/ChangePassword.dart';
import 'package:pro1_un/page/UserAddressInfo.dart';
import 'package:pro1_un/page/UserProfileInfo.dart';
import 'package:pro1_un/widget/list_option.dart';
import 'package:pro1_un/widget/quick_card.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String userName = 'waad alherafe';
  String userPhone = '+963954547951';
  String userEmail = 'waad123452001@gmail.com';
  bool hasImage = true;

  // 1. المتغير الجديد المضاف لحفظ مسار الصورة المختارة
  String? userImagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 30),
                CircleAvatar(
                  radius: 50,
                  backgroundColor: const Color(0xFF8204FF),
                  child: hasImage
                      ? ClipOval(
                    // 2. التحقق ذكياً: إذا كانت هناك صورة جديدة يعرضها، وإلا يعرض الصورة الأصلية
                    child: userImagePath != null
                        ? Image.file(
                      File(userImagePath!),
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    )
                        : Image.asset(
                      'assets/download (64).jpg',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.person, size: 50, color: Colors.white);
                      },
                    ),
                  )
                      : const Icon(Icons.person, size: 50, color: Colors.white),
                ),
                const SizedBox(height: 16),
                Text(
                  userName,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  userPhone,
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    QuickCard(
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
                    const SizedBox(width: 40),
                    QuickCard(
                      icon: Icons.edit,
                      label: 'Edit',
                      onTap: () async {
                        final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditProfile(
                              initialInfo: UserProfileInfo(
                                name: userName,
                                email: userEmail,
                                phone: userPhone,
                                imagePath: userImagePath, // تمرير الصورة الحالية لشاشة التعديل
                              ),
                            ),
                          ),
                        );

                        // 3. تحديث البيانات بالكامل بما فيها الصورة عند العودة
                        if (result != null && result is UserProfileInfo) {
                          setState(() {
                            userName = result.name;
                            userEmail = result.email;
                            userPhone = result.phone;
                            userImagePath = result.imagePath; // استقبال وتثبيت الصورة الجديدة
                          });
                        }
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
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AddressManagement(),
                      ),
                    );
                  },
                  child: ListOption(
                    icon: Icons.location_on_outlined,
                    label: 'Address Management',
                  ),
                ),
                const Divider(
                  height: 20,
                  thickness: 0.5,
                  indent: 50,
                  endIndent: 50,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ChangePassword(),
                      ),
                    );
                  },
                  child: ListOption(
                    icon: Icons.lock_outline,
                    label: 'Change password',
                  ),
                ),
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
                    value: false,
                    onChanged: (value) {},
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