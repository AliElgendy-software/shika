import 'package:flutter/material.dart';
import 'booking_success_screen.dart';

class PaymentDetailsScreen extends StatefulWidget {
  const PaymentDetailsScreen({super.key});

  @override
  State<PaymentDetailsScreen> createState() => _PaymentDetailsScreenState();
}

class _PaymentDetailsScreenState extends State<PaymentDetailsScreen> {
  int _selectedPaymentMethod = 0; // 0=card, 1=wallet, 2=cash

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text('الدفع', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
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
            // Amount Card
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF00A63E), Color(0xFF008236)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Text('المبلغ المطلوب', style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 14), textDirection: TextDirection.rtl),
                  const SizedBox(height: 8),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    textDirection: TextDirection.rtl,
                    children: [
                      Text('250.00', style: TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.bold)),
                      SizedBox(width: 8),
                      Text('جنيه', style: TextStyle(color: Colors.white70, fontSize: 16)),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Cost breakdown
                  Row(
                    textDirection: TextDirection.rtl,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildCostItem('تكلفة الخدمة', '212.50 جنيه'),
                      _buildCostItem('رسوم الخدمة', '25.00 جنيه'),
                      _buildCostItem('ضريبة القيمة المضافة', '12.50 جنيه'),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Payment Method Section
            const Text('طريقة الدفع', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold), textDirection: TextDirection.rtl),
            const SizedBox(height: 12),

            // Credit Card option
            _buildPaymentOption(
              index: 0,
              icon: Icons.credit_card,
              iconColor: Colors.blue,
              title: 'بطاقة الائتمان/خصم',
            ),
            const SizedBox(height: 8),

            // E-Wallet option
            _buildPaymentOption(
              index: 1,
              icon: Icons.account_balance_wallet,
              iconColor: Colors.green,
              title: 'المحفظة الإلكترونية',
            ),
            const SizedBox(height: 8),

            // Cash on delivery
            _buildPaymentOption(
              index: 2,
              icon: Icons.money,
              iconColor: Colors.orange,
              title: 'الدفع عند الاستلام',
            ),
            const SizedBox(height: 24),

            // Dynamic content based on selection
            if (_selectedPaymentMethod == 0) _buildCardForm(),
            if (_selectedPaymentMethod == 1) _buildWalletOptions(),

            const SizedBox(height: 16),

            // Security notice
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              textDirection: TextDirection.rtl,
              children: [
                const Icon(Icons.lock_outline, color: Color(0xFF00A63E), size: 16),
                const SizedBox(width: 6),
                Text(
                  'جميع المعاملات مشفرة وآمنة. لن نشارك بياناتك المالية مع أي طرف ثالث.',
                  style: TextStyle(fontSize: 11, color: Colors.grey[500]),
                  textDirection: TextDirection.rtl,
                ),
              ],
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
      // Confirm Button
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.1), blurRadius: 10, offset: const Offset(0, -2))],
        ),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const BookingSuccessScreen()));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF00A63E),
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 0,
          ),
          child: const Text('تأكيد الدفع - 250.00 جنيه', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
        ),
      ),
    );
  }

  Widget _buildCostItem(String label, String value) {
    return Column(
      children: [
        Text(value, style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold)),
        const SizedBox(height: 2),
        Text(label, style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 10)),
      ],
    );
  }

  Widget _buildPaymentOption({required int index, required IconData icon, required Color iconColor, required String title}) {
    final isSelected = _selectedPaymentMethod == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedPaymentMethod = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: isSelected ? const Color(0xFF00A63E) : Colors.grey[200]!, width: isSelected ? 2 : 1),
        ),
        child: Row(
          textDirection: TextDirection.rtl,
          children: [
            Icon(icon, color: iconColor, size: 24),
            const SizedBox(width: 12),
            Expanded(
              child: Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold), textDirection: TextDirection.rtl),
            ),
            if (isSelected) const Icon(Icons.check_circle, color: Color(0xFF00A63E), size: 22),
          ],
        ),
      ),
    );
  }

  // ==================== CARD FORM ====================
  Widget _buildCardForm() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text('بيانات البطاقة', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold), textDirection: TextDirection.rtl),
          const SizedBox(height: 16),

          // Card Number
          const Text('رقم البطاقة', style: TextStyle(fontSize: 13, color: Colors.grey), textDirection: TextDirection.rtl),
          const SizedBox(height: 6),
          TextField(
            textDirection: TextDirection.ltr,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: '1234 5678 9012 3456',
              hintStyle: TextStyle(color: Colors.grey[400]),
              filled: true,
              fillColor: Colors.grey[50],
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.grey[300]!)),
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.grey[300]!)),
              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: Color(0xFF00A63E), width: 2)),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            ),
          ),
          const SizedBox(height: 16),

          // Cardholder Name
          const Text('اسم حامل البطاقة', style: TextStyle(fontSize: 13, color: Colors.grey), textDirection: TextDirection.rtl),
          const SizedBox(height: 6),
          TextField(
            textDirection: TextDirection.rtl,
            decoration: InputDecoration(
              hintText: 'الاسم كما هو على البطاقة',
              hintStyle: TextStyle(color: Colors.grey[400]),
              filled: true,
              fillColor: Colors.grey[50],
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.grey[300]!)),
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.grey[300]!)),
              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: Color(0xFF00A63E), width: 2)),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            ),
          ),
          const SizedBox(height: 16),

          // Expiry & CVV Row
          Row(
            textDirection: TextDirection.rtl,
            children: [
              // CVV
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text('CVV', style: TextStyle(fontSize: 13, color: Colors.grey), textDirection: TextDirection.rtl),
                    const SizedBox(height: 6),
                    TextField(
                      textDirection: TextDirection.ltr,
                      keyboardType: TextInputType.number,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: '123',
                        hintStyle: TextStyle(color: Colors.grey[400]),
                        filled: true,
                        fillColor: Colors.grey[50],
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.grey[300]!)),
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.grey[300]!)),
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: Color(0xFF00A63E), width: 2)),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              // Expiry
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text('تاريخ الانتهاء', style: TextStyle(fontSize: 13, color: Colors.grey), textDirection: TextDirection.rtl),
                    const SizedBox(height: 6),
                    TextField(
                      textDirection: TextDirection.ltr,
                      keyboardType: TextInputType.datetime,
                      decoration: InputDecoration(
                        hintText: 'MM/YY',
                        hintStyle: TextStyle(color: Colors.grey[400]),
                        filled: true,
                        fillColor: Colors.grey[50],
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.grey[300]!)),
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.grey[300]!)),
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: Color(0xFF00A63E), width: 2)),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ==================== WALLET OPTIONS ====================
  Widget _buildWalletOptions() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text('المحفظة الإلكترونية', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold), textDirection: TextDirection.rtl),
          const SizedBox(height: 16),
          _buildWalletItem('فودافون كاش', Colors.red),
          const SizedBox(height: 8),
          _buildWalletItem('اتصالات كاش', Colors.amber),
          const SizedBox(height: 8),
          _buildWalletItem('أورنج كاش', Colors.black87),
        ],
      ),
    );
  }

  Widget _buildWalletItem(String name, Color color) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(Icons.account_balance_wallet, color: color, size: 20),
          ),
          const SizedBox(width: 12),
          Text(name, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600), textDirection: TextDirection.rtl),
        ],
      ),
    );
  }
}
