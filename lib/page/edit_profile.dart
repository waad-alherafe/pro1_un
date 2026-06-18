import 'dart:io'; // مهم للتعامل مع ملفات الصور بداخل الهاتف
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // المكتبة الجديدة
import 'package:pro1_un/page/UserProfileInfo.dart';

class EditProfile extends StatefulWidget {
  final UserProfileInfo initialInfo;

  const EditProfile({super.key, required this.initialInfo});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;

  String? _selectedImagePath; // متغير لحفظ مسار الصورة المحددة

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.initialInfo.name);
    _emailController = TextEditingController(text: widget.initialInfo.email);
    _phoneController = TextEditingController(text: widget.initialInfo.phone);
    _selectedImagePath = widget.initialInfo.imagePath; // تعيين الصورة الحالية إن وجدت
  }

  // دالة لفتح المعرض واختيار صورة
  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _selectedImagePath = image.path; // تحديث المسار فور الاختيار
      });
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Edit Profile'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {
              // إرسال البيانات المحدثة مع مسار الصورة الجديد
              final updatedInfo = UserProfileInfo(
                name: _nameController.text,
                email: _emailController.text,
                phone: _phoneController.text,
                imagePath: _selectedImagePath,
              );
              Navigator.pop(context, updatedInfo);
            },
            child: const Text(
              'Save',
              style: TextStyle(color: Color(0xFF8204FF), fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 10),

            // --- قسم تعديل الصورة الشخصية ---
            GestureDetector(
              onTap: _pickImage, // عند الضغط على الدائرة يفتح المعرض
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: const Color(0xFF8204FF),
                    child: _selectedImagePath != null
                        ? ClipOval(
                      child: Image.file(
                        File(_selectedImagePath!),
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    )
                        : ClipOval(
                      child: Image.asset(
                        'assets/download (64).jpg',
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.person, size: 50, color: Colors.white),
                      ),
                    ),
                  ),
                  // أيقونة الكاميرا الصغيرة فوق الصورة
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Color(0xFF8204FF),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.camera_alt, color: Colors.white, size: 20),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person_outline),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email_outlined),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _phoneController,
              decoration: const InputDecoration(
                labelText: 'Phone',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.phone_android_outlined),
              ),
              keyboardType: TextInputType.phone,
            ),
          ],
        ),
      ),
    );
  }
}