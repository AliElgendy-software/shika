import 'package:flutter/material.dart';

class ProviderWalletScreen extends StatefulWidget {
  const ProviderWalletScreen({super.key});

  @override
  State<ProviderWalletScreen> createState() => _ProviderWalletScreenState();
}

class _ProviderWalletScreenState extends State<ProviderWalletScreen> {
  static const _green = Color(0xFF00A63E);
  String _selectedPeriod = 'هذا الشهر';

  final List<Map<String, dynamic>> _transactions = [
    {
      'title': 'صيانة تكييف',
      'client': 'أحمد محمد',
      'date': '23 مارس 2026 • 10:30 ص',
      'amount': '+200 ج.م',
      'status': 'مكتمل',
      'type': 'service',
      'color': _green,
    },
    {
      'title': 'سحب أرباح',
      'client': 'تحويل بنكي',
      'date': '20 مارس 2026 • 02:15 م',
      'amount': '-5,000 ج.م',
      'status': 'تم التحويل',
      'type': 'withdraw',
      'color': Color(0xFF1565C0),
    },
    {
      'title': 'تنظيف منزل',
      'client': 'سارة أحمد',
      'date': '22 مارس 2026 • 11:00 ص',
      'amount': '+350 ج.م',
      'status': 'مكتمل',
      'type': 'service',
      'color': _green,
    },
    {
      'title': 'إصلاح سباكة',
      'client': 'محمود علي',
      'date': '21 مارس 2026 • 03:45 م',
      'amount': '+180 ج.م',
      'status': 'مكتمل',
      'type': 'service',
      'color': _green,
    },
    {
      'title': 'تركيب ستائر',
      'client': 'فاطمة حسن',
      'date': '19 مارس 2026 • 09:20 ص',
      'amount': '+300 ج.م',
      'status': 'مكتمل',
      'type': 'service',
      'color': _green,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F4F8),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text('الأرباح والمدفوعات', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_forward, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // --- Wallet Balance Card ---
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: _green,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [BoxShadow(color: _green.withOpacity(0.3), blurRadius: 15, offset: const Offset(0, 8))],
              ),
              child: Column(
                children: [
                   Row(
                    textDirection: TextDirection.rtl,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(color: Colors.white24, borderRadius: BorderRadius.circular(8)),
                        child: const Icon(Icons.trending_up, color: Colors.white, size: 20),
                      ),
                    ],
                  ),
                  const Text('إجمالي الأرباح', style: TextStyle(color: Colors.white70, fontSize: 13)),
                  const SizedBox(height: 6),
                  const Text('12,450 ج.م', style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
                  const Text('رصيدك الحالي', style: TextStyle(color: Colors.white54, fontSize: 11)),
                  const SizedBox(height: 24),
                  Row(
                    textDirection: TextDirection.rtl,
                    children: [
                      _balanceDetail('قيد الانتظار', '1,250 ج.م'),
                      Container(width: 1, height: 30, color: Colors.white24, margin: const EdgeInsets.symmetric(horizontal: 20)),
                      _balanceDetail('تم السحب', '11,200 ج.م'),
                    ],
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _navigateToPaymentMethods,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        elevation: 0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.account_balance_wallet_outlined, color: _green, size: 18),
                          SizedBox(width: 8),
                          Text('سحب الأرباح', style: TextStyle(color: _green, fontWeight: FontWeight.bold, fontSize: 15)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // --- Time Filters ---
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              reverse: true,
              child: Row(
                children: [
                  _filterBox('هذا العام'),
                  _filterBox('هذا الشهر'),
                  _filterBox('هذا الأسبوع'),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // --- Stats Row ---
            _sectionHeader('إحصائيات الشهر'),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(child: _statBox('24', 'طلب مكتمل', Colors.blue, Colors.blue.shade50)),
                const SizedBox(width: 12),
                Expanded(child: _statBox('3,850', 'ج.م', Colors.green, Colors.green.shade50)),
                const SizedBox(width: 12),
                Expanded(child: _statBox('160', 'ج.م متوسط', Colors.purple, Colors.purple.shade50)),
              ],
            ),
            const SizedBox(height: 24),

            // --- Transaction History ---
            Row(
              textDirection: TextDirection.rtl,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('سجل المعاملات', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.file_download_outlined, size: 16),
                  label: const Text('تصدير', style: TextStyle(fontSize: 13)),
                  style: TextButton.styleFrom(foregroundColor: _green),
                ),
              ],
            ),
            const SizedBox(height: 8),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _transactions.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) => _transactionCard(_transactions[index]),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _balanceDetail(String label, String value) {
    return Expanded(
      child: Column(
        children: [
          Text(label, style: const TextStyle(color: Colors.white70, fontSize: 11)),
          const SizedBox(height: 4),
          Text(value, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _filterBox(String label) {
    final isSelected = _selectedPeriod == label;
    return GestureDetector(
      onTap: () => setState(() => _selectedPeriod = label),
      child: Container(
        margin: const EdgeInsets.only(left: 8),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? _green : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: isSelected ? _green : Colors.grey.shade200),
        ),
        child: Text(label, style: TextStyle(color: isSelected ? Colors.white : Colors.grey, fontWeight: isSelected ? FontWeight.bold : FontWeight.normal, fontSize: 13)),
      ),
    );
  }

  Widget _statBox(String value, String label, Color color, Color bg) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(16), border: Border.all(color: color.withOpacity(0.1))),
      child: Column(
        children: [
          Text(value, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: color)),
          const SizedBox(height: 4),
          Text(label, style: TextStyle(fontSize: 10, color: color.withOpacity(0.7))),
        ],
      ),
    );
  }

  Widget _sectionHeader(String title) {
    return Align(
      alignment: Alignment.centerRight,
      child: Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
    );
  }

  Widget _transactionCard(Map<String, dynamic> tx) {
    final Color color = tx['color'] as Color;
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8, offset: const Offset(0, 2))],
      ),
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: color.withOpacity(0.1), shape: BoxShape.circle),
            child: Icon(tx['type'] == 'service' ? Icons.handyman_outlined : Icons.account_balance_outlined, color: color, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(tx['title'] as String, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                Text(tx['client'] as String, style: TextStyle(fontSize: 11, color: Colors.grey[500])),
                const SizedBox(height: 4),
                Text(tx['date'] as String, style: TextStyle(fontSize: 10, color: Colors.grey[400])),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(tx['amount'] as String, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: color)),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(6)),
                child: Text(tx['status'] as String, style: TextStyle(color: color, fontSize: 9, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
