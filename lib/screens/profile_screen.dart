import 'package:flutter/material.dart';
import 'addresses_screen.dart';
import 'help_support_screen.dart';
import 'about_app_screen.dart';
import 'settings_screen.dart';
import 'edit_profile_screen.dart';
import 'notifications_screen.dart';
import 'payment_methods_screen.dart';
import 'wallet_screen.dart';
import 'refer_and_earn_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFC7CDD6), // Greyish background behind content 
      body: Stack(
        children: [
          // Deep Green Top Background
          Container(
            height: 220,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFF00A63E), // Solid deep green
            ),
          ),
          Column(
            children: [
              // Header Title
              SafeArea(
                bottom: false,
                child: Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 20),
                  child: const Text(
                    'الملف الشخصي',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              // Profile Card
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    const CircleAvatar(
                      radius: 36,
                      backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=11'), // Placeholder image like in mock
                      backgroundColor: Colors.grey,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        textDirection: TextDirection.rtl,
                        children: [
                          const Text(
                            'عبدالرحمن نصر',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            textDirection: TextDirection.rtl,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'abdelrahman@example.com',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey[600],
                            ),
                            textDirection: TextDirection.rtl,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '+20 100 000 0000',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey[600],
                            ),
                            textDirection: TextDirection.rtl,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // Menu Items List
              Expanded(
                child: Container(
                  width: double.infinity,
                  color: const Color(0xFFF7F8FA),
                  child: ListView(
                    padding: const EdgeInsets.all(16),
                    children: [
                      _buildMenuItem(
                        context,
                        icon: Icons.edit_outlined,
                        title: 'تعديل الملف الشخصي',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const EditProfileScreen()),
                          );
                        },
                      ),
                      _buildMenuItem(
                        context,
                        icon: Icons.notifications_none,
                        title: 'الإشعارات',
                        badge: '3',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const NotificationsScreen()),
                          );
                        },
                      ),
                      _buildMenuItem(
                        context,
                        icon: Icons.location_on_outlined,
                        title: 'عناويني',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const AddressesScreen()),
                          );
                        },
                      ),
                      _buildMenuItem(
                        context,
                        icon: Icons.credit_card_outlined,
                        title: 'طرق الدفع',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const PaymentMethodsScreen()),
                          );
                        },
                      ),
                      _buildMenuItem(
                        context,
                        icon: Icons.account_balance_wallet_outlined,
                        title: 'المحفظة',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const WalletScreen()),
                          );
                        },
                      ),
                      _buildMenuItem(
                        context,
                        icon: Icons.card_giftcard_outlined,
                        title: 'ادعُ واكسب',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const ReferAndEarnScreen()),
                          );
                        },
                      ),
                      _buildMenuItem(
                        context,
                        icon: Icons.settings_outlined,
                        title: 'الإعدادات',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const SettingsScreen()),
                          );
                        },
                      ),
                      _buildMenuItem(
                        context,
                        icon: Icons.help_outline,
                        title: 'المساعدة والدعم',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const HelpSupportScreen()),
                          );
                        },
                      ),
                      const SizedBox(height: 8),
                      _buildMenuItem(
                        context,
                        icon: Icons.logout,
                        title: 'تسجيل الخروج',
                        textColor: Colors.red,
                        onTap: () {},
                      ),
                      const SizedBox(height: 24),
                      const Center(
                        child: Text(
                          'الإصدار 1.0.0',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    String? badge,
    Color? textColor,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        leading: Icon(icon, color: textColor ?? Colors.black87),
        title: Text(
          title,
          textDirection: TextDirection.rtl,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: textColor ?? Colors.black87,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          textDirection: TextDirection.rtl,
          children: [
            if (badge != null)
              Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  badge,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            if (badge != null) const SizedBox(width: 8),
            if (textColor == null) // Hide arrow for logout
              Icon(Icons.arrow_back_ios_new, size: 14, color: Colors.grey[400]), // Left arrow for RTL
          ],
        ),
        onTap: onTap,
      ),
    );
  }
}

