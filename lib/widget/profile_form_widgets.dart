import 'package:flutter/material.dart';

const Color profileTextGray = Color(0xFF757575);
const Color profileBorderGray = Color(0xFFE0E0E0);
const Color profilePrimaryColor = Colors.blue; 

class ProfileFormHeader extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const ProfileFormHeader({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 40, color: profilePrimaryColor),
        const SizedBox(height: 12),
        Text(
          title,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: const TextStyle(fontSize: 14, color: profileTextGray),
        ),
      ],
    );
  }
}

class ProfileFormCard extends StatelessWidget {
  final List<Widget> children;

  const ProfileFormCard({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: profileBorderGray),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}

class ProfileTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final IconData icon;
  final bool obscureText;
  final TextInputAction? textInputAction;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final int maxLines;
  final TextInputType? keyboardType; // إضافة المتغير بشكل سليم لحل أخطاء الـ Quick Fix

  const ProfileTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.icon,
    this.obscureText = false,
    this.textInputAction,
    this.suffixIcon,
    this.validator,
    this.maxLines = 1,
    this.keyboardType, // تم إضافته كمعامل اختياري هنا
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      textInputAction: textInputAction,
      validator: validator,
      maxLines: maxLines,
      keyboardType: keyboardType, // ربط المتغير بالـ TextFormField الفعلي
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: profileTextGray),
        prefixIcon: Icon(icon, color: profileTextGray),
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: profileBorderGray),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: profileBorderGray),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: profilePrimaryColor, width: 1.5),
        ),
      ),
    );
  }
}

class ProfilePrimaryButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onPressed;

  const ProfilePrimaryButton({
    super.key,
    required this.label,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, color: Colors.white),
        label: Text(label, style: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold)),
        style: ElevatedButton.styleFrom(
          backgroundColor: profilePrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}