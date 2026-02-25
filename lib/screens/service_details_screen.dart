import 'package:flutter/material.dart';
import 'booking/booking_screen.dart';
import 'service_provider_details_screen.dart';

class ServiceDetailsScreen extends StatelessWidget {
  const ServiceDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          // Image Header with back button
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            backgroundColor: Colors.white,
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: IconButton(
                  icon: const Icon(Icons.arrow_forward, color: Colors.black, size: 20),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.green[200]!, Colors.green[50]!],
                  ),
                ),
                child: const Center(
                  child: Icon(Icons.cleaning_services, size: 80, color: Color(0xFF00A63E)),
                ),
              ),
            ),
          ),
          // Content
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                textDirection: TextDirection.rtl,
                children: [
                  // Service Title
                  const Text(
                    'خدمة تنظيف منزلي احترافية',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black87),
                    textDirection: TextDirection.rtl,
                  ),
                  const SizedBox(height: 8),
                  // Rating & Price & Duration Row
                  Row(
                    textDirection: TextDirection.rtl,
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 18),
                      const SizedBox(width: 4),
                      const Text('4.8', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                      Text(' (234 تقييم)', style: TextStyle(fontSize: 13, color: Colors.grey[500])),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    textDirection: TextDirection.rtl,
                    children: [
                      const Text('300 ج.م', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF00A63E))),
                      const SizedBox(width: 4),
                      const Text('\$', style: TextStyle(fontSize: 14, color: Color(0xFF00A63E))),
                      const SizedBox(width: 16),
                      Icon(Icons.access_time, size: 16, color: Colors.grey[500]),
                      const SizedBox(width: 4),
                      Text('2-3 ساعات', style: TextStyle(fontSize: 13, color: Colors.grey[500])),
                    ],
                  ),
                  const SizedBox(height: 24),
                  // Provider Section
                  const Text('مقدم الخدمة', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold), textDirection: TextDirection.rtl),
                  const SizedBox(height: 12),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ServiceProviderDetailsScreen(
                            name: 'سارة محمد',
                            service: 'تنظيف',
                            price: '300 ج.م / خدمة',
                            rating: 4.9,
                            reviews: 156,
                          ),
                        ),
                      );
                    },
                    child: Row(
                      textDirection: TextDirection.rtl,
                      children: [
                        // Avatar
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.green[100],
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.person, color: Color(0xFF00A63E), size: 28),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            textDirection: TextDirection.rtl,
                            children: [
                              const Text('سارة محمد', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold), textDirection: TextDirection.rtl),
                              Text('156 خدمة مكتملة', style: TextStyle(fontSize: 13, color: Colors.grey[500]), textDirection: TextDirection.rtl),
                            ],
                          ),
                        ),
                        // Rating
                        Row(
                          children: [
                            const Icon(Icons.star, color: Color(0xFF00A63E), size: 16),
                            const SizedBox(width: 4),
                            const Text('4.9', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Description
                  const Text('الوصف', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold), textDirection: TextDirection.rtl),
                  const SizedBox(height: 8),
                  Text(
                    'خدمة تنظيف منزلي شاملة تشمل إزالة الغبار، الكنس، مسح الأرضيات، تنظيف الحمامات والمطبخ. يستخدم عمال التنظيف المحترفون لدينا منتجات صديقة للبيئة لضمان نظافة منزلك.',
                    style: TextStyle(fontSize: 14, color: Colors.grey[700], height: 1.7),
                    textDirection: TextDirection.rtl,
                  ),
                  const SizedBox(height: 24),
                  // What's Included
                  const Text('ما يشمل', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold), textDirection: TextDirection.rtl),
                  const SizedBox(height: 12),
                  _buildIncludedItem('معدات تنظيف احترافية'),
                  _buildIncludedItem('منتجات صديقة للبيئة'),
                  _buildIncludedItem('موظفون مدربون ومعتمدون'),
                  _buildIncludedItem('ضمان الرضا'),
                  _buildIncludedItem('جدولة مرنة'),
                  _buildIncludedItem('تغطية تأمينية'),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
      // Bottom Bar
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          textDirection: TextDirection.rtl,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              textDirection: TextDirection.rtl,
              children: [
                const Text('السعر الإجمالي', style: TextStyle(fontSize: 12, color: Colors.grey), textDirection: TextDirection.rtl),
                const SizedBox(height: 4),
                const Text('300 ج.م', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF00A63E)), textDirection: TextDirection.rtl),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const BookingScreen()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF00A63E),
                padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 0,
              ),
              child: const Text('احجز الآن', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIncludedItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          const Icon(Icons.check_circle, color: Color(0xFF00A63E), size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Text(text, style: TextStyle(fontSize: 14, color: Colors.grey[800]), textDirection: TextDirection.rtl),
          ),
        ],
      ),
    );
  }
}
