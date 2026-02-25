import 'package:flutter/material.dart';
import '../login_screen.dart';
import '../provider_working_hours_screen.dart';

class ProviderProfileScreen extends StatelessWidget {
  const ProviderProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.only(top: 60, bottom: 30, left: 24, right: 24),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/user_placeholder.png'), // Placeholder
                    backgroundColor: Color(0xFFE0E0E0),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'أحمد محمد',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.star, color: Colors.amber[700], size: 18),
                      const SizedBox(width: 4),
                      const Text(
                        '4.8',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '(120 تقييم)',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Menu Items
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  _buildMenuItem(
                    icon: Icons.person_outline,
                    title: 'تعديل الملف الشخصي',
                    onTap: () {},
                  ),
                  _buildMenuItem(
                    icon: Icons.category_outlined,
                    title: 'خدماتي',
                    subtitle: 'إدارة التخصصات والأسعار',
                    onTap: () {},
                  ),
                  _buildMenuItem(
                    icon: Icons.calendar_today_outlined,
                    title: 'مواعيد العمل',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProviderWorkingHoursScreen(),
                        ),
                      );
                    },
                  ),
                   _buildMenuItem(
                    icon: Icons.reviews_outlined,
                    title: 'التقييمات والمراجعات',
                    onTap: () {},
                  ),
                  _buildMenuItem(
                    icon: Icons.settings_outlined,
                    title: 'الإعدادات',
                    onTap: () {},
                  ),
                  const SizedBox(height: 24),
                  _buildMenuItem(
                    icon: Icons.logout,
                    title: 'تسجيل الخروج',
                    color: Colors.red,
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => const LoginScreen()),
                          (route) => false,
                        );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    String? subtitle,
    required VoidCallback onTap,
    Color color = Colors.black87,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        onTap: onTap,
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: color, size: 22),
        ),
        title: Text(
          title,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
          textDirection: TextDirection.rtl,
        ),
        subtitle: subtitle != null
            ? Text(
                subtitle,
                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                textDirection: TextDirection.rtl,
              )
            : null,
        trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey[400]),
      ),
    );
  }
}
