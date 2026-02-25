import 'package:flutter/material.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF7F8FA),
        elevation: 0,
        centerTitle: true,
        title: const Text('المحفظة', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_forward, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Balance Card
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF00A63E), Color(0xFF009966)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('الرصيد الحالي', style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 14)),
                  const SizedBox(height: 8),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    textDirection: TextDirection.rtl,
                    children: [
                      Text('500.00', style: TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.bold)),
                      SizedBox(width: 8),
                      Text('ج.م', style: TextStyle(color: Colors.white70, fontSize: 18)),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.add, color: Color(0xFF00A63E)),
                    label: const Text('إضافة رصيد', style: TextStyle(color: Color(0xFF00A63E), fontWeight: FontWeight.bold)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      elevation: 0,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text('المعاملات الأخيرة', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold), textDirection: TextDirection.rtl),
            const SizedBox(height: 12),
            _buildTransaction('خدمة تنظيف منزلي', '-300.00 ج.م', '25 أكتوبر 2025', Icons.cleaning_services, Colors.red),
            _buildTransaction('إضافة رصيد', '+500.00 ج.م', '24 أكتوبر 2025', Icons.add_circle_outline, const Color(0xFF00A63E)),
            _buildTransaction('خدمة سباكة', '-150.00 ج.م', '22 أكتوبر 2025', Icons.plumbing, Colors.red),
            _buildTransaction('استرداد مبلغ', '+200.00 ج.م', '20 أكتوبر 2025', Icons.replay, const Color(0xFF00A63E)),
            _buildTransaction('خدمة كهرباء', '-250.00 ج.م', '18 أكتوبر 2025', Icons.bolt, Colors.red),
          ],
        ),
      ),
    );
  }

  Widget _buildTransaction(String title, String amount, String date, IconData icon, Color amountColor) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: amountColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: amountColor, size: 22),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              textDirection: TextDirection.rtl,
              children: [
                Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold), textDirection: TextDirection.rtl),
                const SizedBox(height: 4),
                Text(date, style: TextStyle(fontSize: 12, color: Colors.grey[500]), textDirection: TextDirection.rtl),
              ],
            ),
          ),
          Text(amount, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: amountColor), textDirection: TextDirection.rtl),
        ],
      ),
    );
  }
}
