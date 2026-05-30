import 'package:flutter/material.dart';
import 'booking_success_screen.dart';

class PaymentDetailsScreen extends StatefulWidget {
  const PaymentDetailsScreen({super.key});

  @override
  State<PaymentDetailsScreen> createState() => _PaymentDetailsScreenState();
}

class _PaymentDetailsScreenState extends State<PaymentDetailsScreen> {
  int _selectedPaymentMethod = 0; // 0=card, 1=wallet, 2=cash

  static const _green = Color(0xFF00A63E);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0FAF5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'الدفع',
          style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_forward, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildSummaryCard(),
                const SizedBox(height: 24),
                const Text(
                  'طريقة الدفع',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  textDirection: TextDirection.rtl,
                ),
                const SizedBox(height: 12),
                _buildPaymentOption(index: 0, icon: Icons.credit_card, iconColor: Colors.blue, title: 'بطاقة الائتمان/خصم'),
                const SizedBox(height: 8),
                _buildPaymentOption(index: 1, icon: Icons.account_balance_wallet_outlined, iconColor: _green, title: 'المحفظة الإلكترونية'),
                const SizedBox(height: 8),
                _buildPaymentOption(index: 2, icon: Icons.money_outlined, iconColor: Colors.orange, title: 'الدفع عند الاستلام'),
                const SizedBox(height: 20),

                // Dynamic panel
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  child: _selectedPaymentMethod == 0
                      ? _buildCardForm()
                      : _selectedPaymentMethod == 1
                          ? _buildWalletOptions()
                          : _buildCashInfo(),
                ),

                const SizedBox(height: 16),
                _buildSecurityNote(),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: _buildConfirmButton(),
    );
  }

  // ─────────────────── Summary Card ───────────────────
  Widget _buildSummaryCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF00C44F), Color(0xFF00A63E)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(color: _green.withOpacity(0.3), blurRadius: 15, offset: const Offset(0, 6)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text('ملخص الدفع', style: TextStyle(color: Colors.white70, fontSize: 13), textDirection: TextDirection.rtl),
          const SizedBox(height: 6),
          const Row(
            textDirection: TextDirection.rtl,
            children: [
              Text('250.00', style: TextStyle(color: Colors.white, fontSize: 38, fontWeight: FontWeight.bold)),
              SizedBox(width: 8),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text('جنيه', style: TextStyle(color: Colors.white70, fontSize: 16)),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Divider(color: Colors.white24, thickness: 1),
          const SizedBox(height: 12),
          Row(
            textDirection: TextDirection.rtl,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _costRow('تكلفة الخدمة', '212.50 جنيه'),
              _costRow('رسوم الخدمة', '25.00 جنيه'),
              _costRow('ضريبة القيمة المضافة', '12.50 جنيه'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _costRow(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(value, style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold)),
        const SizedBox(height: 2),
        Text(label, style: const TextStyle(color: Colors.white60, fontSize: 10)),
      ],
    );
  }

  // ─────────────────── Payment Option ───────────────────
  Widget _buildPaymentOption({required int index, required IconData icon, required Color iconColor, required String title}) {
    final isSelected = _selectedPaymentMethod == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedPaymentMethod = index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isSelected ? _green : Colors.grey.shade200,
            width: isSelected ? 2 : 1,
          ),
          boxShadow: isSelected
              ? [BoxShadow(color: _green.withOpacity(0.12), blurRadius: 8, offset: const Offset(0, 3))]
              : [],
        ),
        child: Row(
          textDirection: TextDirection.rtl,
          children: [
            Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: iconColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: iconColor, size: 20),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                textDirection: TextDirection.rtl,
              ),
            ),
            if (isSelected)
              const Icon(Icons.check_circle, color: _green, size: 22)
            else
              Icon(Icons.radio_button_unchecked, color: Colors.grey.shade300, size: 22),
          ],
        ),
      ),
    );
  }

  // ─────────────────── Card Form ───────────────────
  Widget _buildCardForm() {
    return Container(
      key: const ValueKey('card'),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        textDirection: TextDirection.rtl,
        children: [
          const Text('بيانات البطاقة', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold), textDirection: TextDirection.rtl),
          const SizedBox(height: 16),
          _fieldLabel('رقم البطاقة'),
          _textField(hint: '1234 5678 9012 3456', inputType: TextInputType.number, ltr: true),
          const SizedBox(height: 12),
          _fieldLabel('اسم حامل البطاقة'),
          _textField(hint: 'الاسم كما هو على البطاقة'),
          const SizedBox(height: 12),
          Row(
            textDirection: TextDirection.rtl,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _fieldLabel('تاريخ الانتهاء'),
                    _textField(hint: 'MM/YY', inputType: TextInputType.datetime, ltr: true),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _fieldLabel('CVV'),
                    _textField(hint: '123', inputType: TextInputType.number, ltr: true, obscure: true),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _fieldLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(text, style: TextStyle(fontSize: 12, color: Colors.grey[600]), textDirection: TextDirection.rtl),
    );
  }

  Widget _textField({required String hint, TextInputType inputType = TextInputType.text, bool ltr = false, bool obscure = false}) {
    return TextField(
      textDirection: ltr ? TextDirection.ltr : TextDirection.rtl,
      keyboardType: inputType,
      obscureText: obscure,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey[400], fontSize: 13),
        filled: true,
        fillColor: Colors.grey[50],
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.grey[300]!)),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.grey[300]!)),
        focusedBorder: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)), borderSide: BorderSide(color: _green, width: 2)),
      ),
    );
  }

  // ─────────────────── Wallet Options ───────────────────
  Widget _buildWalletOptions() {
    return Container(
      key: const ValueKey('wallet'),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text('المحفظة الإلكترونية', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold), textDirection: TextDirection.rtl),
          const SizedBox(height: 14),
          _walletItem('فودافون كاش', Color(0xFFE60000), Icons.phone_android),
          const SizedBox(height: 8),
          _walletItem('اتصالات كاش', Color(0xFFF4B400), Icons.phone_android),
          const SizedBox(height: 8),
          _walletItem('أورنج كاش', Color(0xFFFF6600), Icons.phone_android),
        ],
      ),
    );
  }

  Widget _walletItem(String name, Color color, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(color: color.withOpacity(0.12), borderRadius: BorderRadius.circular(8)),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(width: 12),
          Text(name, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600), textDirection: TextDirection.rtl),
          const Spacer(),
          Icon(Icons.arrow_back_ios, color: Colors.grey.shade400, size: 14),
        ],
      ),
    );
  }

  // ─────────────────── Cash on Delivery Info ───────────────────
  Widget _buildCashInfo() {
    return Container(
      key: const ValueKey('cash'),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.orange.shade50,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.orange.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            textDirection: TextDirection.rtl,
            children: [
              const Icon(Icons.info_outline, color: Colors.orange, size: 20),
              const SizedBox(width: 8),
              const Text(
                'معلومات الدفع عند الاستلام',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.orange),
                textDirection: TextDirection.rtl,
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            'سيتم الدفع نقداً عند استلام الخدمة. تأكد من توفر المبلغ المطلوب.',
            style: TextStyle(fontSize: 13, color: Colors.black87, height: 1.5),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),
          Row(
            textDirection: TextDirection.rtl,
            children: [
              const Icon(Icons.check_circle_outline, color: _green, size: 16),
              const SizedBox(width: 6),
              const Expanded(
                child: Text(
                  'جميع المعاملات مشفرة وآمنة. لن نشارك بياناتك المالية مع أي طرف ثالث.',
                  style: TextStyle(fontSize: 11, color: Colors.black54),
                  textDirection: TextDirection.rtl,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ─────────────────── Security Note ───────────────────
  Widget _buildSecurityNote() {
    if (_selectedPaymentMethod == 2) return const SizedBox.shrink();
    return Row(
      textDirection: TextDirection.rtl,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.lock_outline, color: _green, size: 15),
        const SizedBox(width: 6),
        Flexible(
          child: Text(
            'جميع المعاملات مشفرة وآمنة. لن نشارك بياناتك المالية مع أي طرف ثالث.',
            style: TextStyle(fontSize: 11, color: Colors.grey[500]),
            textDirection: TextDirection.rtl,
          ),
        ),
      ],
    );
  }

  // ─────────────────── Bottom Button ───────────────────
  Widget _buildConfirmButton() {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 12, offset: const Offset(0, -3))],
      ),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const BookingSuccessScreen()));
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: _green,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          elevation: 0,
        ),
        child: const Text(
          'تأكيد الدفع - 250.00 جنيه',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}
