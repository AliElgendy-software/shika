import 'package:flutter/material.dart';
import 'tracking_screen.dart';
import 'rate_provider_screen.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF7F8FA),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'تفاصيل الطلب',
          style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_forward, color: Colors.black), // RTL back arrow
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Order Status & Header
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey[200]!),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                textDirection: TextDirection.rtl,
                children: [
                  Row(
                    textDirection: TextDirection.rtl,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'إصلاح سباكة',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        textDirection: TextDirection.rtl,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.blue[50],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          'قيد التنفيذ',
                          style: TextStyle(color: Colors.blue, fontSize: 12, fontWeight: FontWeight.bold),
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'رقم الطلب: #12345',
                    style: TextStyle(color: Colors.grey[500], fontSize: 13),
                    textDirection: TextDirection.rtl,
                  ),
                  const SizedBox(height: 16),
                  // Big Image Placeholder
                  Container(
                    height: 160,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey[300],
                    ),
                    child: const ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      child: Icon(Icons.plumbing, size: 80, color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Date and Time
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey[200]!),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                textDirection: TextDirection.rtl,
                children: [
                  const Text(
                    'التاريخ والوقت',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    textDirection: TextDirection.rtl,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    textDirection: TextDirection.rtl,
                    children: [
                      const Icon(Icons.calendar_today, color: Color(0xFF00A63E), size: 20),
                      const SizedBox(width: 8),
                      Text('15 نوفمبر 2024', style: TextStyle(color: Colors.grey[700], fontSize: 14)),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    textDirection: TextDirection.rtl,
                    children: [
                      const Icon(Icons.access_time, color: Color(0xFF00A63E), size: 20),
                      const SizedBox(width: 8),
                      Text('10:00 ص - 12:00 م', style: TextStyle(color: Colors.grey[700], fontSize: 14)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Provider Details
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey[200]!),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                textDirection: TextDirection.rtl,
                children: [
                  const Text(
                    'مقدم الخدمة',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    textDirection: TextDirection.rtl,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    textDirection: TextDirection.rtl,
                    children: [
                      const CircleAvatar(
                        radius: 20,
                        backgroundColor: Color(0xFF00A63E),
                        child: Icon(Icons.person, color: Colors.white),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          textDirection: TextDirection.rtl,
                          children: [
                            const Text('محمد أحمد', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 4),
                            Row(
                              textDirection: TextDirection.rtl,
                              children: [
                                const Text('4.8', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                                const SizedBox(width: 4),
                                const Icon(Icons.star, color: Color(0xFF00A63E), size: 14),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    textDirection: TextDirection.rtl,
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.chat_bubble_outline, size: 18),
                          label: const Text('محادثة', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF00A63E),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            elevation: 0,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.phone_outlined, size: 18, color: Colors.grey),
                          label: const Text('اتصال', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black87)),
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            side: BorderSide(color: Colors.grey[200]!),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Address
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey[200]!),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                textDirection: TextDirection.rtl,
                children: [
                  const Text(
                    'العنوان',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    textDirection: TextDirection.rtl,
                  ),
                  const SizedBox(height: 12),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    textDirection: TextDirection.rtl,
                    children: [
                      const Icon(Icons.location_on_outlined, color: Color(0xFF00A63E), size: 20),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'شارع النيل، المعادي، القاهرة',
                          style: TextStyle(color: Colors.grey[700], fontSize: 14, height: 1.5),
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Notes
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey[200]!),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                textDirection: TextDirection.rtl,
                children: [
                  const Text(
                    'ملاحظات',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    textDirection: TextDirection.rtl,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'يرجى الحضور في الموعد المحدد. المشكلة في حنفية المطبخ.',
                    style: TextStyle(color: Colors.grey[700], fontSize: 13, height: 1.5),
                    textDirection: TextDirection.rtl,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: const Color(0xFF00A63E),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                textDirection: TextDirection.rtl,
                children: [
                  const Text('إجمالي التكلفة', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    textDirection: TextDirection.rtl,
                    children: [
                      const Text('250', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(width: 4),
                      Text('ج.م', style: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 14)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            // Tracking & Rate buttons
            Row(
              textDirection: TextDirection.rtl,
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const TrackingScreen()));
                    },
                    icon: const Icon(Icons.location_on_outlined, size: 20, color: Color(0xFF00A63E)),
                    label: const Text('تتبع مقدم الخدمة', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFF00A63E))),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xFF00A63E)),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const RateProviderScreen()));
                    },
                    icon: const Icon(Icons.star_outline, size: 20, color: Colors.amber),
                    label: const Text('تقييم الخدمة', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.amber)),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.amber),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              textDirection: TextDirection.rtl,
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.check_circle_outline, size: 20),
                    label: const Text('إتمام الطلب', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF00A63E),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.cancel_outlined, size: 20),
                    label: const Text('إلغاء الطلب', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
