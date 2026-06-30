import 'package:flutter/material.dart';

class WhyChooseUs extends StatelessWidget {
  const WhyChooseUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Why Choose Us ?',

          style: TextStyle(
            color: Color(0xFF8204FF),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildFeatureItem(Icons.local_shipping_outlined, ' Fast shipping'),
            _buildFeatureItem(
              Icons.verified_user_outlined,
              ' quality assurance',
            ),
            _buildFeatureItem(
              Icons.support_agent_outlined,
              ' Continuous support',
            ),
          ],
        ),
      ],
    );
  }
}

// دالة مساعدة لبناء العنصر بشكل مرتب
Widget _buildFeatureItem(IconData icon, String title) {
  return Column(
    children: [
      CircleAvatar(
        radius: 25,
        backgroundColor: const Color(
          0xFF8204FF,
        ).withOpacity(0.1), // لون المتجر مع شفافية
        child: Icon(icon, color: const Color(0xFF8204FF)),
      ),
      const SizedBox(height: 8),
      Text(
        title,
        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
      ),
    ],
  );
}
