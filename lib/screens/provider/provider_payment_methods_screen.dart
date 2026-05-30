import 'package:flutter/material.dart';
import 'withdraw_earnings_screen.dart';

class ProviderPaymentMethodsScreen extends StatefulWidget {
  const ProviderPaymentMethodsScreen({super.key});

  @override
  State<ProviderPaymentMethodsScreen> createState() => _ProviderPaymentMethodsScreenState();
}

class _ProviderPaymentMethodsScreenState extends State<ProviderPaymentMethodsScreen> {
  static const _green = Color(0xFF00A63E);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F4F8),
      appBar: AppBar(
        title: const Text('طرق الدفع والأرباح', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: _green,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_forward, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // --- Earnings Summary Card ---
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF008D33), // Darker green
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Row(
                    textDirection: TextDirection.rtl,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                       Icon(Icons.attach_money, color: Colors.white70, size: 24),
                       SizedBox(width: 8),
                       Text('ملخص الأرباح', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    textDirection: TextDirection.rtl,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _summaryItem('إجمالي الأرباح', '12,450 ج.م'),
                      _summaryItem('قيد الانتظار', '1,200 ج.م'),
                      _summaryItem('تم السحب', '11,250 ج.م'),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => const WithdrawEarningsScreen()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        elevation: 0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.payment_outlined, color: _green, size: 18),
                          SizedBox(width: 8),
                          Text('سحب الأرباح', style: TextStyle(color: _green, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // --- Add Method Button ---
            Container(
              width: double.infinity,
              height: 56,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: _green, width: 1.5, style: BorderStyle.solid),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                   Text('إضافة طريقة دفع جديدة', style: TextStyle(color: _green, fontWeight: FontWeight.bold)),
                   SizedBox(width: 8),
                   Icon(Icons.add, color: _green),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // --- Saved Methods ---
            const Align(
              alignment: Alignment.centerRight,
              child: Text('طرق الدفع المحفوظة', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 12),
            _paymentCard('بطاقة ائتمان', '****  ****  ****  1234', 'عبدالرحمن نصر', 'ينتهي في 12/26', Icons.credit_card, isDefault: true),
            const SizedBox(height: 12),
            _paymentCard('حساب بنكي', '****  ****  ****  5678', 'بنك مصر', null, Icons.account_balance, isDefault: false),

            const SizedBox(height: 24),
            // Footer Info
             Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: Colors.blue.shade50, borderRadius: BorderRadius.circular(12)),
              child: Row(
                textDirection: TextDirection.rtl,
                children: const [
                  Icon(Icons.info_outline, color: Colors.blue),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'يتم تحويل الأرباح تلقائياً إلى طريقة الدفع الافتراضية كل أسبوع، الحد الأدنى للسحب 500 جنيه',
                      style: TextStyle(color: Colors.blue, fontSize: 11, height: 1.4),
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _summaryItem(String label, String value) {
    return Column(
      children: [
        Text(value, style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Colors.white54, fontSize: 10)),
      ],
    );
  }

  Widget _paymentCard(String type, String number, String holder, String? expiry, IconData icon, {bool isDefault = false}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 10, offset: const Offset(0, 4))],
      ),
      child: Column(
        children: [
          Row(
            textDirection: TextDirection.rtl,
            children: [
              Icon(icon, color: Colors.grey[400]),
              const Spacer(),
              Text(type, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
              if (isDefault) ...[
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(color: _green, borderRadius: BorderRadius.circular(10)),
                  child: const Text('افتراضية', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
                ),
              ],
            ],
          ),
          const SizedBox(height: 20),
          Text(number, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: 1.5)),
          const SizedBox(height: 12),
          Row(
            textDirection: TextDirection.rtl,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(holder, style: TextStyle(color: Colors.grey[500], fontSize: 12)),
              if (expiry != null) Text(expiry, style: TextStyle(color: Colors.grey[400], fontSize: 12)),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              if (!isDefault) ...[
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE8F5E9),
                      foregroundColor: _green,
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: const Text('جعلها افتراضية', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(width: 12),
              ],
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red.shade50,
                    foregroundColor: Colors.red,
                    elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.delete_outline, size: 16),
                      SizedBox(width: 4),
                      Text('حذف', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
