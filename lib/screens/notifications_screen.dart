import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  bool _notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      body: Stack(
        children: [
          // Green Header Wrap
          Container(
            height: 180,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFF00A63E),
            ),
          ),
          Column(
            children: [
              // Custom AppBar
              SafeArea(
                bottom: false,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Setting/Gear icon on the left
                      IconButton(
                        icon: const Icon(Icons.settings_outlined, color: Colors.white),
                        onPressed: () {},
                      ),
                      // Title
                      Column(
                        children: [
                          const Text(
                            'الإشعارات',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            '3 إشعار جديد',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.9),
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                      // Back arrow on the right
                      IconButton(
                        icon: const Icon(Icons.arrow_forward, color: Colors.white),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                ),
              ),
              // Mark all as read button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.check, size: 16, color: Colors.white),
                      label: const Text(
                        'تحديد الكل كمقروء',
                        style: TextStyle(color: Colors.white, fontSize: 13),
                      ),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.white.withOpacity(0.5)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        backgroundColor: Colors.white.withOpacity(0.1),
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              // Notifications List
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  children: [
                    _buildNotificationItem(
                      title: 'طلب جديد',
                      message: 'تم تأكيد طلبك #12345. سيصل مقدم الخدمة في الموعد المحدد.',
                      time: 'منذ 5 دقائق',
                      isUnread: true,
                      icon: Icons.cases_outlined,
                      iconColor: const Color(0xFF00A63E),
                    ),
                    _buildNotificationItem(
                      title: 'رسالة جديدة',
                      message: 'أرسل لك محمد أحمد رسالة جديدة.',
                      time: 'منذ 10 دقائق',
                      isUnread: true,
                      icon: Icons.chat_bubble_outline,
                      iconColor: Colors.blue,
                    ),
                    _buildNotificationItem(
                      title: 'عرض خاص',
                      message: 'احصل على خصم 20% على خدمات السباكة هذا الأسبوع!',
                      time: 'منذ ساعة',
                      isUnread: true,
                      icon: Icons.local_offer_outlined,
                      iconColor: Colors.redAccent,
                    ),
                    _buildNotificationItem(
                      title: 'تم إكمال الطلب',
                      message: 'تم إكمال طلب الصيانة #12344 بنجاح. نرجو تقييم الخدمة.',
                      time: 'منذ 3 ساعات',
                      isUnread: false,
                      icon: Icons.verified_outlined,
                      iconColor: const Color(0xFF00A63E),
                    ),
                    _buildNotificationItem(
                      title: 'تذكير',
                      message: 'لديك موعد مع أحمد حسن غداً في الساعة 10:00 صباحاً.',
                      time: 'منذ 5 ساعات',
                      isUnread: false,
                      icon: Icons.info_outline,
                      iconColor: Colors.orange,
                    ),
                    _buildNotificationItem(
                      title: 'رسالة جديدة',
                      message: 'أرسلت لك فاطمة أحمد رسالة جديدة.',
                      time: 'منذ يوم',
                      isUnread: false,
                      icon: Icons.chat_bubble_outline,
                      iconColor: Colors.blue,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationItem({
    required String title,
    required String message,
    required String time,
    required bool isUnread,
    required IconData icon,
    required Color iconColor,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isUnread ? const Color(0xFF00A63E) : Colors.transparent,
          width: isUnread ? 1.5 : 0,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        textDirection: TextDirection.rtl,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isUnread ? Colors.transparent : Colors.grey[100],
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: isUnread ? Colors.grey[400] : iconColor,
              size: 24,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              textDirection: TextDirection.rtl,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  textDirection: TextDirection.rtl,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                    Text(
                      time,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[500],
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                  ],
                ),
                if (isUnread) ...[
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: const Color(0xFF00A63E),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      'جديد',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
                const SizedBox(height: 6),
                Text(
                  message,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey[600],
                    height: 1.5,
                  ),
                  textDirection: TextDirection.rtl,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

