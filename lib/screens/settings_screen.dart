import 'package:flutter/material.dart';
import 'privacy_policy_screen.dart';
import 'contact_us_screen.dart';
import 'faq_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      appBar: AppBar(
        title: const Text(
          'الإعدادات',
          style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const SizedBox(),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_forward, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildSectionHeader('عام'),
            _buildSettingsContainer([
              _buildSettingsItem(
                icon: Icons.notifications_none_outlined,
                title: 'الإشعارات',
                trailing: Switch(
                  value: _notificationsEnabled,
                  onChanged: (value) {
                    setState(() {
                      _notificationsEnabled = value;
                    });
                  },
                  activeColor: const Color(0xFF00A63E),
                ),
              ),
              _buildDivider(),
              _buildSettingsItem(
                icon: Icons.language_outlined,
                title: 'اللغة',
                trailing: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('العربية', style: TextStyle(color: Colors.grey, fontSize: 14)),
                    SizedBox(width: 8),
                    Icon(Icons.arrow_back_ios, size: 14, color: Colors.grey),
                  ],
                ),
              ),
            ]),
            const SizedBox(height: 24),
            _buildSectionHeader('الأمان والخصوصية'),
            _buildSettingsContainer([
              _buildSettingsItem(
                icon: Icons.lock_outline,
                title: 'تغيير كلمة المرور',
                showArrow: true,
              ),
              _buildDivider(),
              _buildSettingsItem(
                icon: Icons.policy_outlined,
                title: 'سياسة الخصوصية',
                showArrow: true,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const PrivacyPolicyScreen()));
                },
              ),
              _buildDivider(),
              _buildSettingsItem(
                icon: Icons.description_outlined,
                title: 'الشروط والأحكام',
                showArrow: true,
              ),
            ]),
            const SizedBox(height: 24),
            _buildSectionHeader('الدعم والمساعدة'),
            _buildSettingsContainer([
              _buildSettingsItem(
                icon: Icons.headset_mic_outlined,
                title: 'تواصل معنا',
                showArrow: true,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ContactUsScreen()));
                },
              ),
              _buildDivider(),
              _buildSettingsItem(
                icon: Icons.help_outline,
                title: 'الأسئلة الشائعة',
                showArrow: true,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const FAQScreen()));
                },
              ),
            ]),
            const SizedBox(height: 32),
            _buildSectionHeader('منطقة الخطر', color: Colors.red),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.red.withOpacity(0.3)),
              ),
              child: _buildSettingsItem(
                icon: Icons.delete_outline,
                iconColor: Colors.red,
                title: 'حذف الحساب',
                textColor: Colors.red,
                isDangerous: true,
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, {Color? color}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12, right: 8),
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: color ?? Colors.black87), textDirection: TextDirection.rtl),
      ),
    );
  }

  Widget _buildSettingsContainer(List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(children: children),
    );
  }

  Widget _buildSettingsItem({
    required IconData icon,
    required String title,
    Color? iconColor,
    Color? textColor,
    Widget? trailing,
    bool showArrow = false,
    bool isDangerous = false,
    VoidCallback? onTap,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      leading: Icon(icon, color: iconColor ?? Colors.grey[600]),
      title: Text(title, style: TextStyle(fontSize: 15, fontWeight: isDangerous ? FontWeight.bold : FontWeight.w600, color: textColor ?? Colors.black87), textDirection: TextDirection.rtl),
      trailing: trailing ?? (showArrow ? const Icon(Icons.arrow_back_ios, size: 14, color: Colors.grey) : null),
      onTap: onTap ?? () {},
    );
  }

  Widget _buildDivider() {
    return Divider(height: 1, thickness: 1, color: Colors.grey[100], indent: 16, endIndent: 16);
  }
}
