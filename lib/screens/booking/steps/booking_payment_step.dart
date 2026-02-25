import 'package:flutter/material.dart';

class BookingPaymentStep extends StatefulWidget {
  final Function(String method) onPaymentMethodSelected;

  const BookingPaymentStep({super.key, required this.onPaymentMethodSelected});

  @override
  State<BookingPaymentStep> createState() => _BookingPaymentStepState();
}

class _BookingPaymentStepState extends State<BookingPaymentStep> {
  String _selectedMethod = 'cash'; // Default

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'طريقة الدفع',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 16),
          _buildPaymentOption(
            id: 'cash',
            title: 'الدفع عند الاستلام',
            icon: Icons.money,
            subtitle: 'ادفع نقداً لمقدم الخدمة بعد الانتهاء',
          ),
          const SizedBox(height: 12),
          _buildPaymentOption(
            id: 'wallet',
            title: 'محفظة إلكترونية',
            icon: Icons.account_balance_wallet,
            subtitle: 'فودافون كاش، اتصالات كاش، أورنج كاش',
          ),
          const SizedBox(height: 12),
          _buildPaymentOption(
            id: 'card',
            title: 'بطاقة ائتمان / خصم مباشر',
            icon: Icons.credit_card,
            subtitle: 'Visa, Mastercard',
          ),
          const SizedBox(height: 24),
          if (_selectedMethod == 'wallet')
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: Column(
                children: [
                   const Text(
                    'اختر المحفظة',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildWalletIcon('assets/vodafone.png', 'Vodafone'), // Placeholder assets
                      _buildWalletIcon('assets/orange.png', 'Orange'),
                      _buildWalletIcon('assets/etisalat.png', 'Etisalat'),
                    ],
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildPaymentOption({
    required String id,
    required String title,
    required IconData icon,
    required String subtitle,
  }) {
    final isSelected = _selectedMethod == id;
    return InkWell(
      onTap: () {
        setState(() {
          _selectedMethod = id;
        });
        widget.onPaymentMethodSelected(id);
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? const Color(0xFF00A63E) : Colors.grey[300]!,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xFF00A63E).withOpacity(0.1) : Colors.grey[100],
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: isSelected ? const Color(0xFF00A63E) : Colors.grey,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: isSelected ? const Color(0xFF00A63E) : Colors.black,
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                ],
              ),
            ),
            if (isSelected)
              const Icon(Icons.check_circle, color: Color(0xFF00A63E)),
          ],
        ),
      ),
    );
  }

  Widget _buildWalletIcon(String asset, String label) {
    return Column(
      children: [
        const Icon(Icons.phone_android, size: 32, color: Colors.grey), // Placeholder icon
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 10)),
      ],
    );
  }
}
