//هي للبروفايل بس والله نسيت لي عملتا الا ما اتذكر
import 'package:flutter/material.dart';

class ListOption extends StatelessWidget {
  const ListOption({
    super.key,
    required this.icon,
    required this.label,
    this.trailing,
    this.onTap,
  });
  final IconData icon;
  final String label;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.grey.shade200,
        child: Icon(icon, color: Colors.black45, size: 20),
      ),
      title: Text(
        label,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      trailing:
          trailing ??
          const Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: Color(0xFF8204FF),
          ),
      onTap: onTap,
    );
  }
}
