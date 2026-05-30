import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ReferAndEarnScreen extends StatelessWidget {
  const ReferAndEarnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF7F8FA),
        elevation: 0,
        centerTitle: true,
        title: const Text('ادعُ واكسب', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_forward, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 24),
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: const Color(0xFF00A63E).withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.card_giftcard, color: Color(0xFF00A63E), size: 60),
            ),
            const SizedBox(height: 24),
            const Text(
              'ادعُ أصدقاءك واكسب!',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black87),
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
            ),
            const SizedBox(height: 12),
            Text(
              'شارك رمز الدعوة الخاص بك مع أصدقائك واحصل على 50 جنيه رصيد مجاني عند تسجيل كل صديق',
              style: TextStyle(fontSize: 14, color: Colors.grey[600], height: 1.5),
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
            ),
            const SizedBox(height: 32),
            // Referral Code
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFF00A63E), width: 2),
              ),
              child: Column(
                children: [
                  Text('رمز الدعوة الخاص بك', style: TextStyle(fontSize: 14, color: Colors.grey[600]), textDirection: TextDirection.rtl),
                  const SizedBox(height: 12),
                  const Text(
                    'SHIKA2025',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF00A63E), letterSpacing: 4),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Row(
              textDirection: TextDirection.rtl,
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Clipboard.setData(const ClipboardData(text: 'SHIKA2025'));
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('تم نسخ رمز الدعوة!'), backgroundColor: Color(0xFF00A63E)),
                      );
                    },
                    icon: const Icon(Icons.copy, size: 18, color: Colors.white),
                    label: const Text('نسخ الرمز', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF00A63E),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      elevation: 0,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('سيتم تفعيل المشاركة قريباً'), backgroundColor: Color(0xFF00A63E)),
                      );
                    },
                    icon: const Icon(Icons.share, size: 18, color: Color(0xFF00A63E)),
                    label: const Text('مشاركة', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF00A63E))),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xFF00A63E)),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            // Stats
            Row(
              textDirection: TextDirection.rtl,
              children: [
                _buildStatCard('3', 'أصدقاء مدعوين'),
                const SizedBox(width: 12),
                _buildStatCard('150 ج.م', 'رصيد مكتسب'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String value, String label) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey[200]!),
        ),
        child: Column(
          children: [
            Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF00A63E))),
            const SizedBox(height: 4),
            Text(label, style: TextStyle(fontSize: 12, color: Colors.grey[600]), textDirection: TextDirection.rtl),
          ],
        ),
      ),
    );
  }
}
