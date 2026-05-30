import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  static const _green = Color(0xFF00A63E);

  final List<Map<String, dynamic>> _notifications = [
    {
      'title': 'طلب جديد',
      'body': 'تم تأكيد طلبك #12345. سيصل مقدم الخدمة في الموعد المحدد.',
      'time': 'منذ 5 دقائق',
      'isNew': true,
      'icon': Icons.calendar_today_outlined,
      'iconColor': Color(0xFF00A63E),
      'iconBg': Color(0xFFE6F7EE),
    },
    {
      'title': 'رسالة جديدة',
      'body': 'أرسل لك عبدالرحمن نصر رسالة جديدة.',
      'time': 'منذ 10 دقائق',
      'isNew': true,
      'icon': Icons.chat_bubble_outline,
      'iconColor': Color(0xFF1565C0),
      'iconBg': Color(0xFFE3F0FF),
    },
    {
      'title': 'عرض خاص',
      'body': 'احصل على خصم 20% على خدمات السباكة هذا الأسبوع!',
      'time': 'منذ ساعة',
      'isNew': true,
      'icon': Icons.local_offer_outlined,
      'iconColor': Color(0xFFE91E63),
      'iconBg': Color(0xFFFCE4EC),
    },
    {
      'title': 'تم إكمال الطلب',
      'body': 'تم إكمال طلب الصيانة #12344 بنجاح. نرجو تقييم الخدمة.',
      'time': 'منذ 3 ساعات',
      'isNew': false,
      'icon': Icons.check_circle_outline,
      'iconColor': Color(0xFF00A63E),
      'iconBg': Color(0xFFE6F7EE),
    },
    {
      'title': 'تذكير',
      'body': 'لديك موعد مع أحمد حسن غداً في الساعة 10:00 صباحاً.',
      'time': 'منذ 5 ساعات',
      'isNew': false,
      'icon': Icons.notifications_outlined,
      'iconColor': Color(0xFFE65100),
      'iconBg': Color(0xFFFFF3E0),
    },
    {
      'title': 'رسالة جديدة',
      'body': 'أرسلت لك فاطمة أحمد رسالة جديدة.',
      'time': 'منذ يوم',
      'isNew': false,
      'icon': Icons.chat_bubble_outline,
      'iconColor': Color(0xFF1565C0),
      'iconBg': Color(0xFFE3F0FF),
    },
  ];

  int get _newCount => _notifications.where((n) => n['isNew'] == true).length;

  void _markAllRead() => setState(() {
        for (var n in _notifications) {
          n['isNew'] = false;
        }
      });

  void _deleteNotification(int index) => setState(() => _notifications.removeAt(index));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F4F8),
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [Color(0xFF00C44F), _green], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
        ),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_forward, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text('الإشعارات', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
            if (_newCount > 0)
              Text('$_newCount إشعار جديد', style: const TextStyle(color: Colors.white70, fontSize: 12)),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
            child: Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: _markAllRead,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white38),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.done_all, color: Colors.white, size: 16),
                      SizedBox(width: 6),
                      Text('تحديد الكل كمقروء', style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w500)),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: _notifications.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.notifications_none, size: 72, color: Colors.grey[300]),
                  const SizedBox(height: 12),
                  Text('لا توجد إشعارات', style: TextStyle(fontSize: 16, color: Colors.grey[500])),
                ],
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: _notifications.length,
              separatorBuilder: (_, __) => const SizedBox(height: 10),
              itemBuilder: (context, index) => _notifCard(index),
            ),
    );
  }

  Widget _notifCard(int index) {
    final n = _notifications[index];
    final bool isNew = n['isNew'] as bool;

    return GestureDetector(
      onTap: () => setState(() => n['isNew'] = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border(
            right: BorderSide(color: isNew ? _green : Colors.transparent, width: 4),
          ),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8, offset: const Offset(0, 2))],
        ),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            textDirection: TextDirection.rtl,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Icon
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(color: n['iconBg'] as Color, borderRadius: BorderRadius.circular(12)),
                child: Icon(n['icon'] as IconData, color: n['iconColor'] as Color, size: 22),
              ),
              const SizedBox(width: 12),
              // Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      textDirection: TextDirection.rtl,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Title + new badge
                        Row(
                          textDirection: TextDirection.rtl,
                          children: [
                            Text(n['title'] as String, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                            if (isNew) ...[
                              const SizedBox(width: 6),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                                decoration: BoxDecoration(color: _green, borderRadius: BorderRadius.circular(10)),
                                child: const Text('جديد', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ],
                        ),
                        // Delete button
                        GestureDetector(
                          onTap: () => _deleteNotification(index),
                          child: Icon(Icons.delete_outline, color: Colors.grey[400], size: 18),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      n['body'] as String,
                      style: TextStyle(fontSize: 12, color: Colors.grey[600], height: 1.4),
                      textDirection: TextDirection.rtl,
                    ),
                    const SizedBox(height: 6),
                    Text(n['time'] as String, style: TextStyle(fontSize: 11, color: Colors.grey[400])),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
