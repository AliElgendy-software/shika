import 'package:flutter/material.dart';
import 'package:shika/screens/provider/withdraw_earnings_screen.dart';

class ProviderSettingsScreen extends StatefulWidget {
  const ProviderSettingsScreen({super.key});

  @override
  State<ProviderSettingsScreen> createState() => _ProviderSettingsScreenState();
}

class _ProviderSettingsScreenState extends State<ProviderSettingsScreen> {
  static const _green = Color(0xFF00A63E);

  bool _notificationsEnabled = true;
  bool _darkModeEnabled = false;
  bool _autoAcceptEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F4F8),
      appBar: AppBar(
        title: const Text('الإعدادات', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: _green,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_forward, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // ─── الإعدادات العامة ───
              _sectionLabel('الإعدادات العامة'),
              _settingsCard([
                _arrowTile(icon: Icons.language_outlined, iconColor: Colors.green, title: 'اللغة', trailText: 'العربية'),
                _divider(),
                _switchTile(icon: Icons.dark_mode_outlined, iconColor: Colors.teal, title: 'الوضع الليلي', subtitle: 'تفعيل المظهر الداكن', value: _darkModeEnabled, onChanged: (v) => setState(() => _darkModeEnabled = v)),
                _divider(),
                _switchTile(icon: Icons.notifications_none_outlined, iconColor: Colors.green, title: 'الإشعارات', subtitle: 'تلقي إشعارات الطلبات', value: _notificationsEnabled, onChanged: (v) => setState(() => _notificationsEnabled = v)),
              ]),
              const SizedBox(height: 24),

              // ─── إعدادات العمل ───
              _sectionLabel('إعدادات العمل'),
              _settingsCard([
                _switchTile(icon: Icons.phonelink_setup_outlined, iconColor: Colors.green, title: 'قبول تلقائي', subtitle: 'قبول الطلبات تلقائياً', value: _autoAcceptEnabled, onChanged: (v) => setState(() => _autoAcceptEnabled = v)),
                _divider(),
                _arrowTile(icon: Icons.access_time, iconColor: Colors.green, title: 'ساعات العمل', subtitle: 'من 9 ص - 9 م'),
              ]),
              const SizedBox(height: 24),

              // ─── الأمان والخصوصية ───
              _sectionLabel('الأمان والخصوصية'),
              _settingsCard([
                _arrowTile(icon: Icons.lock_outline, iconColor: Colors.green, title: 'تغيير كلمة المرور'),
                _divider(),
                _arrowTile(icon: Icons.shield_outlined, iconColor: Colors.green, title: 'الخصوصية والأمان'),
              ]),
              const SizedBox(height: 24),

              // ─── روابط إضافية ───
              _settingsCard([
                _arrowTile(title: 'الشروط والأحكام'),
                _divider(),
                _arrowTile(title: 'سياسة الخصوصية'),
                _divider(),
                _arrowTile(title: 'عن التطبيق', trailText: 'الإصدار 1.0.0'),
              ]),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sectionLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12, right: 4),
      child: Text(text, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey[800]), textDirection: TextDirection.rtl),
    );
  }

  Widget _settingsCard(List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 4))],
      ),
      child: Column(children: children),
    );
  }

  Widget _switchTile({required IconData icon, required Color iconColor, required String title, String? subtitle, required bool value, required ValueChanged<bool> onChanged}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          Icon(icon, color: iconColor, size: 24),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                if (subtitle != null) Text(subtitle, style: TextStyle(fontSize: 11, color: Colors.grey[500])),
              ],
            ),
          ),
          Switch(value: value, onChanged: onChanged, activeColor: _green, activeTrackColor: _green.withOpacity(0.3)),
        ],
      ),
    );
  }

  Widget _arrowTile({IconData? icon, Color? iconColor, required String title, String? subtitle, String? trailText, VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap ?? () {},
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          textDirection: TextDirection.rtl,
          children: [
            if (icon != null) ...[
              Icon(icon, color: iconColor ?? Colors.grey[600], size: 24),
              const SizedBox(width: 16),
            ],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  if (subtitle != null) Text(subtitle, style: TextStyle(fontSize: 11, color: Colors.grey[500])),
                ],
              ),
            ),
            if (trailText != null) ...[
              Text(trailText, style: TextStyle(fontSize: 13, color: Colors.grey[500])),
              const SizedBox(width: 8),
            ],
            Icon(Icons.arrow_back_ios, size: 14, color: Colors.grey[300]),
          ],
        ),
      ),
    );
  }

  Widget _divider() => Divider(height: 1, thickness: 1, color: Colors.grey[50], indent: 16, endIndent: 16);
}
