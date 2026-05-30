import 'package:flutter/material.dart';

import 'provider_requests_screen.dart';
import 'provider_wallet_screen.dart';
import 'update_order_status_screen.dart';

class ProviderDashboardScreen extends StatefulWidget {
  const ProviderDashboardScreen({super.key});

  @override
  State<ProviderDashboardScreen> createState() => _ProviderDashboardScreenState();
}

class _ProviderDashboardScreenState extends State<ProviderDashboardScreen> {
  static const _green = Color(0xFF00A63E);
  bool _isOnline = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F4F8),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // --- Green Header Section ---
            Container(
              padding: const EdgeInsets.only(top: 60, bottom: 20, left: 20, right: 20),
              decoration: const BoxDecoration(
                color: _green,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    textDirection: TextDirection.rtl,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Greeting & Profile
                      Row(
                        textDirection: TextDirection.rtl,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(2),
                            decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                            child: const CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.grey,
                              child: Icon(Icons.person, color: Colors.white),
                            ),
                          ),
                          const SizedBox(width: 12),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text('مرحباً، أحمد', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                              Text('جاهز لاستقبال طلبات جديدة؟', style: TextStyle(color: Colors.white70, fontSize: 11)),
                            ],
                          ),
                        ],
                      ),
                      // Notification Bell
                      GestureDetector(
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const NotificationsScreen())),
                        child: Stack(
                          children: [
                            const Icon(Icons.notifications_none, color: Colors.white, size: 28),
                            Positioned(
                              right: 0,
                              top: 0,
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                                child: const Text('3', style: TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  // Online/Offline Status Panel
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.white24),
                    ),
                    child: Row(
                      textDirection: TextDirection.rtl,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text('متصل الآن', style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold)),
                            Text(_isOnline ? 'يمكنك استقبال الطلبات' : 'أنت في وضع عدم الاتصال', style: const TextStyle(color: Colors.white70, fontSize: 10)),
                          ],
                        ),
                        Switch(
                          value: _isOnline,
                          onChanged: (v) => setState(() => _isOnline = v),
                          activeColor: Colors.white,
                          activeTrackColor: Colors.white38,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // --- Earnings Card (Orange) ---
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFFFFA000), Color(0xFFFF6F00)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [BoxShadow(color: Colors.orange.withOpacity(0.3), blurRadius: 12, offset: const Offset(0, 6))],
                    ),
                    child: Row(
                      textDirection: TextDirection.rtl,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('إجمالي الأرباح الشهرية', style: TextStyle(color: Colors.white, fontSize: 12)),
                            Text('12450 جنيه', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                            SizedBox(height: 4),
                            Text('أرباح اليوم: 850 جنيه', style: TextStyle(color: Colors.white70, fontSize: 11)),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(color: Colors.white24, borderRadius: BorderRadius.circular(16)),
                          child: const Icon(Icons.attach_money, color: Colors.white, size: 36),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // --- 2x2 Stats Grid ---
                  Row(
                    children: [
                      Expanded(child: _miniStat(Icons.access_time, Colors.red, '3', 'طلبات جديدة')),
                      const SizedBox(width: 12),
                      Expanded(child: _miniStat(Icons.assignment_outlined, Colors.blue, '2', 'طلبات جارية')),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(child: _miniStat(Icons.star_outline_rounded, Colors.orange, '4.9', 'التقييم', subText: '(312 تقييم)')),
                      const SizedBox(width: 12),
                      Expanded(child: _miniStat(Icons.check_circle_outline, Colors.green, '456', 'خدمات مكتملة')),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // --- Quick Actions ---
                  const Align(
                    alignment: Alignment.centerRight,
                    child: Text('الإجراءات السريعة', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 12),
                  _quickActionTile('عرض الطلبات الجديدة', const Color(0xFFFFF3E0), Colors.orange, '3', onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const ProviderRequestsScreen()));
                  }),
                  const SizedBox(height: 10),
                  _quickActionTile('الطلبات قيد التنفيذ', const Color(0xFFE3F2FD), Colors.blue, null, onTap: () {
                     Navigator.push(context, MaterialPageRoute(builder: (_) => const ProviderRequestsScreen()));
                  }),
                  const SizedBox(height: 10),
                  _quickActionTile('عرض الأرباح والمدفوعات', const Color(0xFFF1F8E9), Colors.green, null, onTap: () {
                     Navigator.push(context, MaterialPageRoute(builder: (_) => const ProviderWalletScreen()));
                  }),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _miniStat(IconData icon, Color color, String value, String label, {String? subText}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 10, offset: const Offset(0, 3))],
      ),
      child: Column(
        children: [
          Row(
            textDirection: TextDirection.rtl,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
                child: Icon(icon, color: color, size: 20),
              ),
              Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerRight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(label, style: const TextStyle(fontSize: 11, color: Colors.grey)),
                if (subText != null) Text(subText, style: const TextStyle(fontSize: 9, color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _quickActionTile(String title, Color bg, Color iconColor, String? badge, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: bg.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          if (badge != null) ...[
            Container(
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
              child: Text(badge, style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(width: 12),
          ],
          Expanded(child: Text(title, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.grey[800]), textDirection: TextDirection.rtl)),
          Icon(Icons.arrow_back_ios, size: 14, color: Colors.grey[400]),
        ],
      ),
    );
  }
}
