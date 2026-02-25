import 'package:flutter/material.dart';

class BookingSummaryStep extends StatelessWidget {
  final String providerName;
  final String serviceName;
  final String price;
  final String date;
  final String time;
  final String address;
  final String paymentMethod;

  const BookingSummaryStep({
    super.key,
    required this.providerName,
    required this.serviceName,
    required this.price,
    required this.date,
    required this.time,
    required this.address,
    required this.paymentMethod,
  });

  @override
  Widget build(BuildContext context) {
    // Parse price string to double for calculation (assuming format "150 EGP")
    // Simple parsing logic for demo
    double basePrice = 150.0; // Default fallback
    try {
      final numericString = price.replaceAll(RegExp(r'[^0-9.]'), '');
      if (numericString.isNotEmpty) {
        basePrice = double.parse(numericString);
      }
    } catch (_) {}
    
    final tax = basePrice * 0.14; // 14% VAT
    final total = basePrice + tax;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'ملخص الحجز',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 16),
          
          // Provider Info Card
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey[200]!),
            ),
            child: Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Color(0xFF00A63E),
                  child: Icon(Icons.person, color: Colors.white),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      providerName,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      textDirection: TextDirection.rtl,
                    ),
                    Text(
                      serviceName,
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                      textDirection: TextDirection.rtl,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Details Section
          _buildSummaryRow(Icons.calendar_today, 'التاريخ والوقت', '$date - $time'),
          const SizedBox(height: 12),
          _buildSummaryRow(Icons.location_on, 'العنوان', address.isEmpty ? 'لم يتم تحديد العنوان' : address),
          const SizedBox(height: 12),
          _buildSummaryRow(Icons.payment, 'طريقة الدفع', _getPaymentLabel(paymentMethod)),
          
          const Divider(height: 32),

          // Price Breakdown
          _buildPriceRow('سعر الخدمة', '${basePrice.toStringAsFixed(2)} ج.م'),
          const SizedBox(height: 8),
          _buildPriceRow('الضريبة (14%)', '${tax.toStringAsFixed(2)} ج.م'),
          const Divider(height: 24),
          _buildPriceRow(
            'الإجمالي', 
            '${total.toStringAsFixed(2)} ج.م',
            isTotal: true,
          ),
        ],
      ),
    );
  }

  String _getPaymentLabel(String method) {
    switch (method) {
      case 'wallet': return 'محفظة إلكترونية';
      case 'card': return 'بطاقة ائتمان';
      default: return 'الدفع عند الاستلام';
    }
  }

  Widget _buildSummaryRow(IconData icon, String title, String value) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.grey),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
              textDirection: TextDirection.rtl,
            ),
            Text(
              value,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              textDirection: TextDirection.rtl,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPriceRow(String label, String value, {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: isTotal ? 16 : 14,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            color: isTotal ? Colors.black : Colors.grey[700],
          ),
          textDirection: TextDirection.rtl,
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: isTotal ? 16 : 14,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            color: isTotal ? const Color(0xFF00A63E) : Colors.black,
          ),
          textDirection: TextDirection.rtl,
        ),
      ],
    );
  }
}
