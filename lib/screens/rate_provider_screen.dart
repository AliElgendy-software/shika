import 'package:flutter/material.dart';

class RateProviderScreen extends StatefulWidget {
  const RateProviderScreen({super.key});

  @override
  State<RateProviderScreen> createState() => _RateProviderScreenState();
}

class _RateProviderScreenState extends State<RateProviderScreen> {
  int _rating = 0;
  final TextEditingController _commentController = TextEditingController();

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text('تقييم الخدمة', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_forward, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 16),
            // Provider avatar
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.green[100],
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.person, color: Color(0xFF00A63E), size: 48),
            ),
            const SizedBox(height: 16),
            const Text('عبد الرحمن نصر', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), textDirection: TextDirection.rtl),
            const SizedBox(height: 4),
            Text('خدمة سباكة', style: TextStyle(fontSize: 14, color: Colors.grey[600]), textDirection: TextDirection.rtl),
            const SizedBox(height: 32),
            const Text(
              'كيف كانت تجربتك؟',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87),
              textDirection: TextDirection.rtl,
            ),
            const SizedBox(height: 24),
            // Stars
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _rating = index + 1;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Icon(
                      index < _rating ? Icons.star : Icons.star_border,
                      color: Colors.amber,
                      size: 48,
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 8),
            Text(
              _rating == 0 ? '' : _rating <= 2 ? 'يحتاج تحسين' : _rating <= 3 ? 'جيد' : _rating == 4 ? 'ممتاز' : 'رائع جداً!',
              style: TextStyle(fontSize: 16, color: Colors.grey[600], fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 32),
            // Comment
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey[200]!),
              ),
              child: TextField(
                controller: _commentController,
                textDirection: TextDirection.rtl,
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: 'اكتب تعليقك هنا (اختياري)...',
                  hintStyle: TextStyle(color: Colors.grey[400]),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.all(16),
                ),
              ),
            ),
            const SizedBox(height: 24),
            // Quick tags
            Wrap(
              spacing: 8,
              runSpacing: 8,
              alignment: WrapAlignment.center,
              children: [
                _buildQuickTag('محترف'),
                _buildQuickTag('دقيق في المواعيد'),
                _buildQuickTag('سعر مناسب'),
                _buildQuickTag('عمل متقن'),
                _buildQuickTag('تعامل ممتاز'),
                _buildQuickTag('سريع'),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: _rating > 0 ? () {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('شكراً لتقييمك!', textDirection: TextDirection.rtl),
                backgroundColor: Color(0xFF00A63E),
              ),
            );
          } : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF00A63E),
            disabledBackgroundColor: Colors.grey[300],
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 0,
          ),
          child: const Text('إرسال التقييم', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
        ),
      ),
    );
  }

  Widget _buildQuickTag(String label) {
    return GestureDetector(
      onTap: () {
        final current = _commentController.text;
        _commentController.text = current.isEmpty ? label : '$current، $label';
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: const Color(0xFF00A63E).withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xFF00A63E).withOpacity(0.3)),
        ),
        child: Text(
          label,
          style: const TextStyle(fontSize: 13, color: Color(0xFF00A63E), fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
