import 'package:flutter/material.dart';
import 'order_details_screen.dart';

class OrdersScreen extends StatefulWidget {
  final VoidCallback? onBackPressed;

  const OrdersScreen({super.key, this.onBackPressed});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  static const _green = Color(0xFF00A63E);
  String _selectedFilter = 'الكل';

  final List<Map<String, dynamic>> _allOrders = [
    {
      'status': 'مكتمل',
      'statusColor': Color(0xFF00A63E),
      'statusBg': Color(0xFFE6F7EE),
      'statusIcon': Icons.check_circle,
      'serviceName': 'تنظيف منزلي',
      'providerName': 'سارة محمد',
      'date': '25 أكتوبر 2025',
      'time': '10:00 صباحاً',
      'price': '300 ج.م',
      'icon': Icons.cleaning_services_outlined,
    },
    {
      'status': 'جاري التنفيذ',
      'statusColor': Color(0xFF1565C0),
      'statusBg': Color(0xFFE3F0FF),
      'statusIcon': Icons.loop,
      'serviceName': 'خدمة سباكة',
      'providerName': 'محمد أحمد',
      'date': '27 أكتوبر 2025',
      'time': '2:00 مساءً',
      'price': '450 ج.م',
      'icon': Icons.plumbing_outlined,
    },
    {
      'status': 'قيد الانتظار',
      'statusColor': Color(0xFFE65100),
      'statusBg': Color(0xFFFFF3E0),
      'statusIcon': Icons.access_time,
      'serviceName': 'إصلاح مكيف',
      'providerName': 'أحمد حسن',
      'date': '28 أكتوبر 2025',
      'time': '11:00 صباحاً',
      'price': '550 ج.م',
      'icon': Icons.ac_unit_outlined,
    },
    {
      'status': 'ملغي',
      'statusColor': Color(0xFFB71C1C),
      'statusBg': Color(0xFFFFEBEE),
      'statusIcon': Icons.cancel,
      'serviceName': 'أعمال كهربائية',
      'providerName': 'خالد علي',
      'date': '20 أكتوبر 2025',
      'time': '3:00 مساءً',
      'price': '350 ج.م',
      'icon': Icons.electrical_services_outlined,
    },
    {
      'status': 'مكتمل',
      'statusColor': Color(0xFF00A63E),
      'statusBg': Color(0xFFE6F7EE),
      'statusIcon': Icons.check_circle,
      'serviceName': 'دهان غرفة',
      'providerName': 'أحمد حسن',
      'date': '20 أكتوبر 2025',
      'time': '9:00 صباحاً',
      'price': '500 ج.م',
      'icon': Icons.format_paint_outlined,
    },
  ];

  List<Map<String, dynamic>> get _filtered {
    if (_selectedFilter == 'الكل') return _allOrders;
    return _allOrders.where((o) => o['status'] == _selectedFilter).toList();
  }

  @override
  Widget build(BuildContext context) {
    final filtered = _filtered;

    return Scaffold(
      backgroundColor: const Color(0xFFF0FAF5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text('طلباتي', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_forward, color: Colors.black),
          onPressed: () {
            if (widget.onBackPressed != null) {
              widget.onBackPressed!();
            } else if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          },
        ),
      ),
      body: Column(
        children: [
          // Filter chips
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              reverse: true,
              child: Row(
                children: [
                  _filterChip('الكل'),
                  _filterChip('قيد الانتظار'),
                  _filterChip('جاري التنفيذ'),
                  _filterChip('مكتمل'),
                  _filterChip('ملغي'),
                ],
              ),
            ),
          ),
          // Orders
          Expanded(
            child: filtered.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.inbox_outlined, size: 64, color: Colors.grey[300]),
                        const SizedBox(height: 12),
                        Text('لا توجد طلبات في هذه الفئة', style: TextStyle(fontSize: 15, color: Colors.grey[500]), textDirection: TextDirection.rtl),
                      ],
                    ),
                  )
                : ListView.separated(
                    padding: const EdgeInsets.all(16),
                    itemCount: filtered.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (context, index) => _orderCard(filtered[index]),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _filterChip(String label) {
    final isSelected = _selectedFilter == label;
    return GestureDetector(
      onTap: () => setState(() => _selectedFilter = label),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        margin: const EdgeInsets.only(left: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? _green : Colors.grey.shade100,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: isSelected ? _green : Colors.grey.shade300),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey[700],
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            fontSize: 13,
          ),
          textDirection: TextDirection.rtl,
        ),
      ),
    );
  }

  Widget _orderCard(Map<String, dynamic> order) {
    final Color statusColor = order['statusColor'] as Color;
    final Color statusBg = order['statusBg'] as Color;

    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const OrderDetailsScreen())),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 3))],
        ),
        child: Row(
          textDirection: TextDirection.rtl,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Service image (right side per RTL)
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                width: 80,
                height: 80,
                color: Colors.grey.shade100,
                child: Icon(order['icon'] as IconData, color: Colors.grey.shade400, size: 36),
              ),
            ),
            const SizedBox(width: 12),
            // Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Status badge
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(color: statusBg, borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(order['statusIcon'] as IconData, color: statusColor, size: 12),
                          const SizedBox(width: 4),
                          Text(order['status'] as String, style: TextStyle(color: statusColor, fontSize: 11, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  // Service name
                  Text(order['serviceName'] as String, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold), textDirection: TextDirection.rtl),
                  const SizedBox(height: 3),
                  // Provider
                  Text('بواسطة ${order['providerName']}', style: TextStyle(fontSize: 12, color: Colors.grey[600]), textDirection: TextDirection.rtl),
                  const SizedBox(height: 3),
                  // Date + time
                  Text('${order['date']} - ${order['time']}', style: TextStyle(fontSize: 11, color: Colors.grey[500]), textDirection: TextDirection.rtl),
                  const SizedBox(height: 6),
                  // Price
                  Text(order['price'] as String, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: _green), textDirection: TextDirection.rtl),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
