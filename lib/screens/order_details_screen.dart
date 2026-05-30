import 'package:flutter/material.dart';
import 'rate_provider_screen.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  static const _green = Color(0xFF00A63E);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text('تفاصيل الطلب', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_forward, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Title + status row
                  _card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          textDirection: TextDirection.rtl,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(color: _green.withOpacity(0.1), borderRadius: BorderRadius.circular(20)),
                              child: Row(
                                children: [
                                  const Icon(Icons.check_circle, color: _green, size: 14),
                                  const SizedBox(width: 4),
                                  const Text('تتبع الطلب', style: TextStyle(color: _green, fontSize: 12, fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text('إصلاح سباكة', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                SizedBox(height: 2),
                                Text('رقم الطلب: #12345', style: TextStyle(fontSize: 12, color: Colors.grey)),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 14),
                        // Service image
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            height: 150,
                            color: Colors.grey.shade200,
                            child: const Center(
                              child: Icon(Icons.plumbing, size: 60, color: Colors.grey),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 14),

                  // Date & Time
                  _card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text('التاريخ والوقت', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold), textDirection: TextDirection.rtl),
                        const SizedBox(height: 12),
                        _iconRow(Icons.calendar_today_outlined, Colors.blue, '15 نوفمبر 2024'),
                        const SizedBox(height: 8),
                        _iconRow(Icons.access_time, _green, '10:00 ص - 12:00 م'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 14),

                  // Provider
                  _card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text('مقدم الخدمة', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold), textDirection: TextDirection.rtl),
                        const SizedBox(height: 12),
                        Row(
                          textDirection: TextDirection.rtl,
                          children: [
                            CircleAvatar(backgroundColor: _green.withOpacity(0.15), radius: 26, child: const Text('أم', style: TextStyle(color: _green, fontWeight: FontWeight.bold, fontSize: 16))),
                            const SizedBox(width: 12),
                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text('محمد أحمد', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                                  SizedBox(height: 2),
                                  Row(
                                    textDirection: TextDirection.rtl,
                                    children: [
                                      Icon(Icons.star, color: Colors.amber, size: 14),
                                      SizedBox(width: 4),
                                      Text('4.8', style: TextStyle(fontSize: 12, color: Colors.grey)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                _contactBtn(Icons.phone_outlined, 'اتصال', Colors.blue),
                                const SizedBox(width: 8),
                                _contactBtnFilled(Icons.chat_bubble_outline, 'محادثة'),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 14),

                  // Address
                  _card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text('العنوان', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold), textDirection: TextDirection.rtl),
                        const SizedBox(height: 10),
                        _iconRow(Icons.location_on_outlined, _green, 'شارع النيل، المعادي، القاهرة'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 14),

                  // Notes
                  _card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text('ملاحظات', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold), textDirection: TextDirection.rtl),
                        const SizedBox(height: 10),
                        const Text(
                          'يرجى الحضور في الموعد المحدد. المشكلة في حنفية المطبخ.',
                          style: TextStyle(fontSize: 13, color: Colors.grey, height: 1.5),
                          textDirection: TextDirection.rtl,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Rate button
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => const RateProviderScreen()));
                    },
                    icon: const Icon(Icons.star_border, color: Colors.white),
                    label: const Text('تقييم الخدمة', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _green,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                      elevation: 0,
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  static Widget _card({required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 10, offset: const Offset(0, 3))],
      ),
      child: child,
    );
  }

  static Widget _iconRow(IconData icon, Color color, String text) {
    return Row(
      textDirection: TextDirection.rtl,
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
          child: Icon(icon, color: color, size: 18),
        ),
        const SizedBox(width: 10),
        Text(text, style: const TextStyle(fontSize: 13), textDirection: TextDirection.rtl),
      ],
    );
  }

  static Widget _contactBtn(IconData icon, String label, Color color) {
    return OutlinedButton.icon(
      onPressed: () {},
      icon: Icon(icon, size: 16, color: color),
      label: Text(label, style: TextStyle(color: color, fontSize: 12)),
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: color.withOpacity(0.4)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      ),
    );
  }

  static Widget _contactBtnFilled(IconData icon, String label) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(icon, size: 16, color: Colors.white),
      label: Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF00A63E),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        elevation: 0,
      ),
    );
  }
}
