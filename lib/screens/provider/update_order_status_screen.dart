import 'package:flutter/material.dart';

class UpdateOrderStatusScreen extends StatefulWidget {
  final String orderId;
  const UpdateOrderStatusScreen({super.key, this.orderId = '1'});

  @override
  State<UpdateOrderStatusScreen> createState() => _UpdateOrderStatusScreenState();
}

class _UpdateOrderStatusScreenState extends State<UpdateOrderStatusScreen> {
  static const _green = Color(0xFF00A63E);
  String _selectedStatus = 'في الطريق';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text('تحديث حالة الطلب', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_forward, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // Order Info
            Row(
              textDirection: TextDirection.rtl,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('رقم الطلب', style: TextStyle(fontSize: 13, color: Colors.grey)),
                Text('#${widget.orderId}', style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 24),

            // Status Selection
            const Text('اختر الحالة الجديدة', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            _statusOption(Icons.directions_car_filled_outlined, 'في الطريق', '🚗'),
            _statusOption(Icons.architecture, 'بدأت العمل', '🔨'),
            _statusOption(Icons.check_box_outlined, 'العمل مكتمل', '✅'),
            const SizedBox(height: 24),

            // Proof Images
            const Text('صور إثبات (اختياري)', style: TextStyle(fontSize: 13, color: Colors.grey)),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 30),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300, style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey.shade50,
              ),
              child: Column(
                children: [
                  Icon(Icons.camera_alt_outlined, color: Colors.grey.shade400, size: 32),
                  const SizedBox(height: 8),
                  Text('رفع صور', style: TextStyle(color: Colors.grey.shade500, fontSize: 13)),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Notes
            const Text('ملاحظات (اختياري)', style: TextStyle(fontSize: 13, color: Colors.grey)),
            const SizedBox(height: 10),
            TextField(
              maxLines: 4,
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                hintText: 'أضف أي ملاحظات أو تفاصيل إضافية...',
                hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 13),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.grey.shade200)),
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.grey.shade200)),
              ),
            ),
            const SizedBox(height: 40),

            // Submit Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: _green,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: 4,
                  shadowColor: _green.withOpacity(0.4),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.file_upload_outlined, color: Colors.white),
                    SizedBox(width: 8),
                    Text('تحديث الحالة', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _statusOption(IconData icon, String label, String emoji) {
    final isSelected = _selectedStatus == label;
    return GestureDetector(
      onTap: () => setState(() => _selectedStatus = label),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: isSelected ? _green : Colors.grey.shade200, width: isSelected ? 2 : 1),
        ),
        child: Row(
          textDirection: TextDirection.rtl,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(color: Colors.grey.shade50, borderRadius: BorderRadius.circular(8)),
              child: Text(emoji, style: const TextStyle(fontSize: 16)),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(label, style: TextStyle(fontSize: 15, fontWeight: isSelected ? FontWeight.bold : FontWeight.w500, color: isSelected ? _green : Colors.grey.shade700)),
            ),
            if (isSelected) const Icon(Icons.check_circle, color: _green, size: 22),
          ],
        ),
      ),
    );
  }
}
