import 'package:flutter/material.dart';

class TrackingScreen extends StatelessWidget {
  const TrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text('تتبع مقدم الخدمة', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_forward, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          // Map placeholder
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.grey[200],
              child: Stack(
                children: [
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.map, size: 80, color: Colors.grey[400]),
                        const SizedBox(height: 12),
                        Text('خريطة التتبع المباشر', style: TextStyle(fontSize: 16, color: Colors.grey[500])),
                      ],
                    ),
                  ),
                  // Provider location marker
                  Positioned(
                    top: 100,
                    right: 120,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: Color(0xFF00A63E),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.person, color: Colors.white, size: 24),
                    ),
                  ),
                  // Customer location marker
                  Positioned(
                    bottom: 100,
                    left: 100,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.blue[600],
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.location_on, color: Colors.white, size: 24),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Bottom Panel
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // ETA
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF00A63E).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      textDirection: TextDirection.rtl,
                      children: [
                        Icon(Icons.access_time, color: Color(0xFF00A63E), size: 20),
                        SizedBox(width: 8),
                        Text(
                          'وقت الوصول المتوقع: 15 دقيقة',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF00A63E)),
                          textDirection: TextDirection.rtl,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Provider Info
                  Row(
                    textDirection: TextDirection.rtl,
                    children: [
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
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          textDirection: TextDirection.rtl,
                          children: [
                            Text('عبد الرحمن نصر', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold), textDirection: TextDirection.rtl),
                            Text('فني سباكة', style: TextStyle(fontSize: 13, color: Colors.grey), textDirection: TextDirection.rtl),
                          ],
                        ),
                      ),
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: const Color(0xFF00A63E).withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.phone, color: Color(0xFF00A63E), size: 20),
                          onPressed: () {},
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: const Color(0xFF00A63E).withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.chat_bubble_outline, color: Color(0xFF00A63E), size: 20),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  // Status steps
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    textDirection: TextDirection.rtl,
                    children: [
                      _buildStatusStep('تم القبول', true),
                      _buildStatusStep('في الطريق', true),
                      _buildStatusStep('وصل', false),
                      _buildStatusStep('اكتمل', false),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusStep(String label, bool isCompleted) {
    return Column(
      children: [
        Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(
            color: isCompleted ? const Color(0xFF00A63E) : Colors.grey[300],
            shape: BoxShape.circle,
          ),
          child: Icon(
            isCompleted ? Icons.check : Icons.circle,
            color: Colors.white,
            size: 16,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: TextStyle(
            fontSize: 11,
            color: isCompleted ? const Color(0xFF00A63E) : Colors.grey[500],
            fontWeight: isCompleted ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
