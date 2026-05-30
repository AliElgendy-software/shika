import 'package:flutter/material.dart';

class TrackingScreen extends StatelessWidget {
  const TrackingScreen({super.key});

  static const _green = Color(0xFF00A63E);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text('تتبع الطلب', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
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
                  // Map placeholder
                  Container(
                    height: 180,
                    decoration: BoxDecoration(
                      color: const Color(0xFFDCEEFF),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 10, offset: const Offset(0, 4))],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(color: _green.withOpacity(0.15), shape: BoxShape.circle),
                          child: const Icon(Icons.location_on, color: _green, size: 28),
                        ),
                        const SizedBox(height: 10),
                        const Text('خريطة موقع مقدم الخدمة', style: TextStyle(color: _green, fontSize: 14, fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Status Card
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(colors: [Color(0xFF00C44F), _green], begin: Alignment.topLeft, end: Alignment.bottomRight),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [BoxShadow(color: _green.withOpacity(0.3), blurRadius: 12, offset: const Offset(0, 4))],
                    ),
                    child: Row(
                      textDirection: TextDirection.rtl,
                      children: [
                        Container(
                          width: 46,
                          height: 46,
                          decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), borderRadius: BorderRadius.circular(12)),
                          child: const Icon(Icons.directions_car, color: Colors.white, size: 26),
                        ),
                        const SizedBox(width: 12),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text('الحالة الحالية', style: TextStyle(color: Colors.white70, fontSize: 12)),
                              SizedBox(height: 2),
                              Text('في الطريق', style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold)),
                              SizedBox(height: 2),
                              Text('مقدم الخدمة في طريقه إليك', style: TextStyle(color: Colors.white70, fontSize: 12)),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Column(
                          children: [
                            Icon(Icons.access_time, color: Colors.white70, size: 16),
                            SizedBox(height: 2),
                            Text('11:00 ص', style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Provider Info
                  _infoCard(
                    title: 'معلومات مقدم الخدمة',
                    child: Row(
                      textDirection: TextDirection.rtl,
                      children: [
                        CircleAvatar(backgroundColor: _green.withOpacity(0.15), radius: 24, child: const Text('أم', style: TextStyle(color: _green, fontWeight: FontWeight.bold, fontSize: 15))),
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
                                  SizedBox(width: 3),
                                  Text('4.8 (156 خدمة)', style: TextStyle(color: Colors.grey, fontSize: 12)),
                                ],
                              ),
                              SizedBox(height: 2),
                              Text('السيارة: تويوتا كورولا - ABC 123', style: TextStyle(color: Colors.grey, fontSize: 11)),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            _actionBtn(Icons.phone_outlined, Colors.blue),
                            const SizedBox(height: 8),
                            _actionBtn(Icons.message_outlined, _green),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Order Timeline
                  _infoCard(
                    title: 'سير الطلب',
                    child: Column(
                      children: [
                        _timelineStep(icon: Icons.check_circle, color: _green, label: 'تم الطلب', sub: 'تم استلام طلبك بنجاح', time: '10:30 ص', isDone: true),
                        _timelineStep(icon: Icons.check_circle, color: _green, label: 'تم التأكيد', sub: 'قبل مقدم الخدمة الطلب', time: '10:45 ص', isDone: true),
                        _timelineStep(icon: Icons.directions_car, color: _green, label: 'في الطريق', sub: 'مقدم الخدمة في طريقه إليك', time: '11:00 ص', isDone: true, isActive: true),
                        _timelineStep(icon: Icons.handyman_outlined, color: Colors.grey, label: 'بدأ الخدمة', sub: 'يعمل على إتمام الطلب', time: '—', isDone: false, isLast: true),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  static Widget _infoCard({required String title, required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 10, offset: const Offset(0, 3))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold), textDirection: TextDirection.rtl),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }

  static Widget _actionBtn(IconData icon, Color color) {
    return Container(
      width: 38,
      height: 38,
      decoration: BoxDecoration(color: color.withOpacity(0.1), shape: BoxShape.circle),
      child: Icon(icon, color: color, size: 20),
    );
  }

  static Widget _timelineStep({
    required IconData icon,
    required Color color,
    required String label,
    required String sub,
    required String time,
    required bool isDone,
    bool isActive = false,
    bool isLast = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 0),
      child: Row(
        textDirection: TextDirection.rtl,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              const SizedBox(height: 2),
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: isDone ? color.withOpacity(0.12) : Colors.grey.shade100,
                  shape: BoxShape.circle,
                  border: isActive ? Border.all(color: const Color(0xFF00A63E), width: 2) : null,
                ),
                child: Icon(icon, color: color, size: 18),
              ),
              if (!isLast)
                Container(width: 2, height: 36, color: isDone ? const Color(0xFF00A63E).withOpacity(0.3) : Colors.grey.shade200),
            ],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 18),
              child: Row(
                textDirection: TextDirection.rtl,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(label, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: isDone ? Colors.black : Colors.grey)),
                      Text(sub, style: const TextStyle(fontSize: 11, color: Colors.grey)),
                    ],
                  ),
                  Text(time, style: TextStyle(fontSize: 11, color: isDone ? const Color(0xFF00A63E) : Colors.grey, fontWeight: FontWeight.w500)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
