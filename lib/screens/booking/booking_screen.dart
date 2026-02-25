import 'package:flutter/material.dart';
import 'payment_details_screen.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  int _selectedTimeIndex = 1; // 10:00 selected by default
  final TextEditingController _notesController = TextEditingController();

  final List<String> _timeSlots = [
    '9:00 صباحاً',
    '10:00 صباحاً',
    '11:00 صباحاً',
    '12:00 ظهراً',
    '1:00 مساءً',
    '2:00 مساءً',
    '3:00 مساءً',
    '4:00 مساءً',
    '5:00 مساءً',
    '6:00 مساءً',
  ];

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text('حجز الخدمة', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Service Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey[200]!),
              ),
              child: Row(
                textDirection: TextDirection.rtl,
                children: [
                  // Service image placeholder
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.green[50],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(Icons.cleaning_services, color: Color(0xFF00A63E), size: 30),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      textDirection: TextDirection.rtl,
                      children: [
                        const Text('تنظيف منزلي', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold), textDirection: TextDirection.rtl),
                        const SizedBox(height: 4),
                        Text('بواسطة سارة محمد', style: TextStyle(fontSize: 13, color: Colors.grey[500]), textDirection: TextDirection.rtl),
                        const SizedBox(height: 4),
                        const Text('300 ج.م', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF00A63E)), textDirection: TextDirection.rtl),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Date Selection
            _buildSectionCard(
              icon: Icons.calendar_today,
              title: 'اختر التاريخ',
              child: Container(
                height: 56,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: InkWell(
                  onTap: () async {
                    await showDatePicker(
                      context: context,
                      initialDate: DateTime.now().add(const Duration(days: 1)),
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(const Duration(days: 60)),
                    );
                  },
                  child: const Center(
                    child: Text('اضغط لاختيار التاريخ', style: TextStyle(color: Colors.grey)),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Time Selection
            _buildSectionCard(
              icon: Icons.access_time,
              title: 'اختر الوقت',
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                textDirection: TextDirection.rtl,
                children: List.generate(_timeSlots.length, (index) {
                  final isSelected = _selectedTimeIndex == index;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedTimeIndex = index;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      decoration: BoxDecoration(
                        color: isSelected ? const Color(0xFF00A63E) : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: isSelected ? const Color(0xFF00A63E) : Colors.grey[300]!),
                      ),
                      child: Text(
                        _timeSlots[index],
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                          color: isSelected ? Colors.white : Colors.black87,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(height: 16),

            // Address
            _buildSectionCard(
              icon: Icons.location_on_outlined,
              title: 'عنوان الخدمة',
              child: Container(
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Notes
            _buildSectionCard(
              icon: null,
              title: 'ملاحظات إضافية (اختياري)',
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  controller: _notesController,
                  textDirection: TextDirection.rtl,
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText: 'أي تعليمات أو متطلبات خاصة...',
                    hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.all(16),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Payment Method
            _buildSectionCard(
              icon: Icons.credit_card,
              title: 'طريقة الدفع',
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFF00A63E)),
                ),
                child: Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: const Color(0xFF00A63E).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.money, color: Color(0xFF00A63E), size: 20),
                    ),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        textDirection: TextDirection.rtl,
                        children: [
                          Text('الدفع عند الاستلام', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold), textDirection: TextDirection.rtl),
                          Text('ادفع عند إتمام الخدمة', style: TextStyle(fontSize: 12, color: Colors.grey), textDirection: TextDirection.rtl),
                        ],
                      ),
                    ),
                    const Icon(Icons.check_circle, color: Color(0xFF00A63E), size: 22),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Price Summary
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey[200]!),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text('ملخص السعر', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold), textDirection: TextDirection.rtl),
                  const SizedBox(height: 12),
                  _buildPriceRow('رسوم الخدمة', '300.00 ج.م'),
                  _buildPriceRow('الضريبة', '30.00 ج.م'),
                  const Divider(height: 24),
                  Row(
                    textDirection: TextDirection.rtl,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('الإجمالي', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold), textDirection: TextDirection.rtl),
                      Text('330.00 ج.م', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF00A63E)), textDirection: TextDirection.rtl),
                    ],
                  ),
                ],
              ),
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
            Navigator.push(context, MaterialPageRoute(builder: (context) => const PaymentDetailsScreen()));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF00A63E),
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 0,
          ),
          child: const Text('تأكيد الحجز', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
        ),
      ),
    );
  }

  Widget _buildSectionCard({IconData? icon, required String title, required Widget child}) {
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
          Row(
            textDirection: TextDirection.rtl,
            children: [
              if (icon != null) ...[
                Icon(icon, color: const Color(0xFF00A63E), size: 20),
                const SizedBox(width: 8),
              ],
              Expanded(
                child: Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold), textDirection: TextDirection.rtl),
              ),
            ],
          ),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }

  Widget _buildPriceRow(String label, String price) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        textDirection: TextDirection.rtl,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontSize: 14, color: Colors.grey[600]), textDirection: TextDirection.rtl),
          Text(price, style: TextStyle(fontSize: 14, color: Colors.grey[700]), textDirection: TextDirection.rtl),
        ],
      ),
    );
  }
}
