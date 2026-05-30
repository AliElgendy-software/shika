import 'package:flutter/material.dart';

class WithdrawEarningsScreen extends StatefulWidget {
  const WithdrawEarningsScreen({super.key});

  @override
  State<WithdrawEarningsScreen> createState() => _WithdrawEarningsScreenState();
}

class _WithdrawEarningsScreenState extends State<WithdrawEarningsScreen> {
  static const _green = Color(0xFF00A63E);
  final TextEditingController _amountController = TextEditingController();
  String _selectedMethod = 'تحويل بنكي';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F4F8),
      appBar: AppBar(
        title: const Text('سحب رصيد', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: _green,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_forward, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // --- Available balance ---
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
              child: Row(
                textDirection: TextDirection.rtl,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(color: _green.withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
                    child: const Icon(Icons.account_balance_wallet_outlined, color: _green),
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                       Text('الرصيد المتاح للسحب', style: TextStyle(color: Colors.grey, fontSize: 12)),
                       Text('1250.00 جنيه', style: TextStyle(color: _green, fontSize: 22, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // --- Amount Input ---
            const Align(
              alignment: Alignment.centerRight,
              child: Text('المبلغ المراد سحبه', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.grey.shade200)),
              child: TextField(
                controller: _amountController,
                textAlign: TextAlign.right,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'أدخل المبلغ',
                  prefixIcon: Icon(Icons.attach_money, color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                _quickAmount('50'),
                const SizedBox(width: 8),
                _quickAmount('100'),
                const SizedBox(width: 8),
                _quickAmount('200'),
                const SizedBox(width: 8),
                _quickAmount('500'),
              ],
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => setState(() => _amountController.text = '1250'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: _green,
                  side: const BorderSide(color: _green),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text('سحب كل الرصيد', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 24),

            // --- Withdrawal Method ---
            const Align(
              alignment: Alignment.centerRight,
              child: Text('طريقة السحب', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            ),
            const SizedBox(height: 12),
            _methodTile('تحويل بنكي', 'يستغرق 1-3 أيام عمل', 'رسوم السحب: 10 جنيه', Icons.account_balance_outlined),
            const SizedBox(height: 12),
            _methodTile('محفظة إلكترونية', 'فوري - فودافون كاش - أورانج كاش', 'رسوم السحب: 5 جنيه', Icons.account_balance_wallet_outlined),

            const SizedBox(height: 24),
            // --- Notes ---
             Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: Colors.orange.shade50, borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.orange.shade100)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    textDirection: TextDirection.rtl,
                    children: const [
                      Icon(Icons.info_outline, color: Colors.orange, size: 20),
                      SizedBox(width: 8),
                      Text('ملاحظات هامة:', style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 13)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text('• الحد الأدنى للسحب 50 جنيه', style: TextStyle(fontSize: 11, color: Colors.brown)),
                  const Text('• التحويل البنكي يستغرق من 1-3 أيام عمل', style: TextStyle(fontSize: 11, color: Colors.brown)),
                  const Text('• المحفظة الإلكترونية تستغرق من 5-30 دقيقة', style: TextStyle(fontSize: 11, color: Colors.brown)),
                  const Text('• تأكد من صحة البيانات قبل التأكيد', style: TextStyle(fontSize: 11, color: Colors.brown)),
                ],
              ),
            ),
            const SizedBox(height: 40),

            // --- Submit Button ---
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.shade300, // Disabled look if no amount
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: 0,
                ),
                child: const Text('تأكيد السحب', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _quickAmount(String val) {
    return Expanded(
      child: InkWell(
        onTap: () => setState(() => _amountController.text = val),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8), border: Border.all(color: Colors.grey.shade200)),
          child: Text(val, textAlign: TextAlign.center, style: TextStyle(color: Colors.grey[800], fontSize: 13)),
        ),
      ),
    );
  }

  Widget _methodTile(String title, String subtitle, String fee, IconData icon) {
    final bool isSelected = _selectedMethod == title;
    return GestureDetector(
      onTap: () => setState(() => _selectedMethod = title),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: isSelected ? _green : Colors.grey.shade100, width: isSelected ? 2 : 1),
        ),
        child: Row(
          textDirection: TextDirection.rtl,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(color: Colors.grey.shade50, borderRadius: BorderRadius.circular(12)),
              child: Icon(icon, color: isSelected ? _green : Colors.grey),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                  Text(subtitle, style: TextStyle(color: Colors.grey[500], fontSize: 11)),
                  const SizedBox(height: 4),
                  Text(fee, style: TextStyle(color: Colors.grey[400], fontSize: 10)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
