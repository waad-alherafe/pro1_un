class UserProfileInfo {
  final String name;
  final String email;
  final String phone;
  final String? imagePath; // أضفنا هذا السطر لحفظ مسار الصورة الجديد

  UserProfileInfo({
    required this.name,
    required this.email,
    required this.phone,
    this.imagePath, // أضفناه هنا أيضاً
  });
}