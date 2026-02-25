import 'package:flutter/material.dart';
import 'order_details_screen.dart';

class OrdersScreen extends StatefulWidget {
  final VoidCallback? onBackPressed;
  
  const OrdersScreen({super.key, this.onBackPressed});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  String _selectedFilter = 'الكل';

  // All orders data
  final List<Map<String, dynamic>> _allOrders = [
    {
      'status': 'مكتمل',
      'statusColor': Colors.green,
      'serviceName': 'تنظيف منزلي',
      'providerName': 'سارة محمد',
      'date': '25 أكتوبر 2025 10:00 صباحاً',
      'price': '300 ج.م',
      'icon': Icons.cleaning_services,
    },
    {
      'status': 'جاري التنفيذ',
      'statusColor': Colors.green,
      'serviceName': 'خدمة سباكة',
      'providerName': 'عبد الرحمن نصر',
      'date': '26 أكتوبر 2025 2:00 مساءً',
      'price': '150 ج.م',
      'icon': Icons.plumbing,
    },
    {
      'status': 'قيد الانتظار',
      'statusColor': Colors.orange,
      'serviceName': 'إصلاح مكيف',
      'providerName': 'محمد علي',
      'date': '27 أكتوبر 2025 11:00 صباحاً',
      'price': '250 ج.م',
      'icon': Icons.ac_unit,
    },
    {
      'status': 'ملغي',
      'statusColor': Colors.red,
      'serviceName': 'أعمال كهربائية',
      'providerName': 'خالد حسن',
      'date': '24 أكتوبر 2025 3:00 مساءً',
      'price': '200 ج.م',
      'icon': Icons.electrical_services,
    },
    {
      'status': 'مكتمل',
      'statusColor': Colors.green,
      'serviceName': 'دهان غرفة',
      'providerName': 'أحمد حسن',
      'date': '20 أكتوبر 2025 9:00 صباحاً',
      'price': '500 ج.م',
      'icon': Icons.format_paint,
    },
    {
      'status': 'جاري التنفيذ',
      'statusColor': Colors.green,
      'serviceName': 'صيانة كهربائية',
      'providerName': 'عبد الرحمن نصر',
      'date': '28 أكتوبر 2025 4:00 مساءً',
      'price': '200 ج.م',
      'icon': Icons.bolt,
    },
  ];

  List<Map<String, dynamic>> get _filteredOrders {
    if (_selectedFilter == 'الكل') {
      return _allOrders;
    }
    return _allOrders.where((order) => order['status'] == _selectedFilter).toList();
  }

  @override
  Widget build(BuildContext context) {
    final filtered = _filteredOrders;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            if (widget.onBackPressed != null) {
              widget.onBackPressed!();
            } else if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          },
        ),
        title: const Text(
          'طلباتي',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          // Filter Tabs
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildFilterTab('الكل'),
                  _buildFilterTab('قيد الانتظار'),
                  _buildFilterTab('جاري التنفيذ'),
                  _buildFilterTab('مكتمل'),
                  _buildFilterTab('ملغي'),
                ],
              ),
            ),
          ),
          // Orders List
          Expanded(
            child: filtered.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.inbox_outlined, size: 64, color: Colors.grey[300]),
                        const SizedBox(height: 16),
                        Text(
                          'لا توجد طلبات في "$_selectedFilter"',
                          style: TextStyle(fontSize: 16, color: Colors.grey[500]),
                          textDirection: TextDirection.rtl,
                        ),
                      ],
                    ),
                  )
                : ListView.separated(
                    padding: const EdgeInsets.all(16),
                    itemCount: filtered.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final order = filtered[index];
                      return _buildOrderCard(
                        status: order['status'],
                        statusColor: order['statusColor'],
                        serviceName: order['serviceName'],
                        providerName: order['providerName'],
                        date: order['date'],
                        price: order['price'],
                        icon: order['icon'],
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterTab(String label) {
    final isSelected = _selectedFilter == label;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedFilter = label;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF00A63E) : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey[700],
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
          textDirection: TextDirection.rtl,
        ),
      ),
    );
  }

  Widget _buildOrderCard({
    required String status,
    required Color statusColor,
    required String serviceName,
    required String providerName,
    required String date,
    required String price,
    required IconData icon,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const OrderDetailsScreen()),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Service Image Placeholder
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: Colors.grey[500], size: 30),
            ),
            const SizedBox(width: 12),
            // Order Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: statusColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      status,
                      style: TextStyle(
                        color: statusColor,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    serviceName,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'بواسطة $providerName',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    date,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[500],
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    price,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF00A63E),
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
