import 'package:flutter/material.dart';

class ProviderRequestsScreen extends StatefulWidget {
  const ProviderRequestsScreen({super.key});

  @override
  State<ProviderRequestsScreen> createState() => _ProviderRequestsScreenState();
}

class _ProviderRequestsScreenState extends State<ProviderRequestsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'الطلبات',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          labelColor: const Color(0xFF00A63E),
          unselectedLabelColor: Colors.grey,
          indicatorColor: const Color(0xFF00A63E),
          tabs: const [
            Tab(text: 'جديدة'),
            Tab(text: 'جارية'),
            Tab(text: 'سابقة'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildNewRequestsList(),
          _buildActiveRequestsList(),
          _buildHistoryRequestsList(),
        ],
      ),
    );
  }

  Widget _buildNewRequestsList() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _RequestCard(
          clientName: 'محمود حسن',
          serviceName: 'تأسيس سباكة',
          location: 'مدينة نصر، القاهرة',
          time: 'الآن',
          price: '500 ج.م',
          isNew: true,
        ),
        _RequestCard(
          clientName: 'أكرم توفيق',
          serviceName: 'صيانة سخان',
          location: 'المعادي، القاهرة',
          time: 'منذ 15 دقيقة',
          price: '150 ج.م',
          isNew: true,
        ),
      ],
    );
  }

  Widget _buildActiveRequestsList() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _RequestCard(
          clientName: 'خالد محمود',
          serviceName: 'إصلاح سباكة',
          location: 'التجمع الخامس',
          time: 'بدأ منذ ساعة',
          price: '200 ج.م',
          status: 'قيد التنفيذ',
          statusColor: Colors.blue,
        ),
      ],
    );
  }

  Widget _buildHistoryRequestsList() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _RequestCard(
          clientName: 'محمد علي',
          serviceName: 'صيانة تكييف',
          location: 'مصر الجديدة',
          time: 'أمس',
          price: '200 ج.م',
          status: 'مكتمل',
          statusColor: Colors.green,
        ),
        _RequestCard(
          clientName: 'سارة أحمد',
          service: 'تنظيف منزلي',
          location: 'الزمالك',
          time: '20 فبراير',
          price: '350 ج.م',
          status: 'ملغي',
          statusColor: Colors.red,
        ),
      ],
    );
  }
}

class _RequestCard extends StatelessWidget {
  final String clientName;
  final String? serviceName; // Made nullable to handle cases where service might be passed
  final String service; // Alternative parameter name
  final String location;
  final String time;
  final String price;
  final bool isNew;
  final String? status;
  final Color? statusColor;

  const _RequestCard({
    required this.clientName,
    this.serviceName,
    String? service,
    required this.location,
    required this.time,
    required this.price,
    this.isNew = false,
    this.status,
    this.statusColor,
  }) : service = service ?? serviceName ?? '';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      service,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.person, size: 14, color: Colors.grey),
                        const SizedBox(width: 4),
                        Text(
                          clientName,
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.location_on, size: 14, color: Colors.grey),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            location,
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey[700],
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    price,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF00A63E),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    time,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                  if (status != null) ...[
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: statusColor?.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        status!,
                        style: TextStyle(
                          color: statusColor,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ],
          ),
          if (isNew) ...[
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Divider(),
            ),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.red,
                      side: const BorderSide(color: Colors.red),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('رفض'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF00A63E),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'قبول',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
