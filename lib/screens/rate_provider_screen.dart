import 'package:flutter/material.dart';

class RateProviderScreen extends StatefulWidget {
  const RateProviderScreen({super.key});

  @override
  State<RateProviderScreen> createState() => _RateProviderScreenState();
}

class _RateProviderScreenState extends State<RateProviderScreen> {
  static const _green = Color(0xFF00A63E);

  double _overallRating = 0;
  double _qualityRating = 0;
  double _punctualityRating = 0;
  double _professionalismRating = 0;
  double _cleanlinessRating = 0;
  final _commentController = TextEditingController();
  final Set<String> _selectedTags = {};

  static const _tags = ['ممتاز', 'محترم', 'ملتزم بالمواعيد', 'نظيف', 'سريع'];

  @override
  void dispose() {
    _commentController.dispose();
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
        title: const Text('تقييم الخدمة', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_forward, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Provider card
                  _card(
                    child: Row(
                      textDirection: TextDirection.rtl,
                      children: [
                        CircleAvatar(backgroundColor: _green.withOpacity(0.15), radius: 26, child: const Text('عن', style: TextStyle(color: _green, fontWeight: FontWeight.bold, fontSize: 15))),
                        const SizedBox(width: 12),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text('عبدالرحمن نصر', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                              SizedBox(height: 2),
                              Text('صيانة تكييف', style: TextStyle(fontSize: 12, color: Colors.grey)),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(Icons.calendar_today_outlined, size: 13, color: Colors.grey),
                            const SizedBox(width: 4),
                            const Text('23 مارس 2026', style: TextStyle(fontSize: 11, color: Colors.grey)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Overall rating
                  _card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text('كيف كانت تجربتك؟', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold), textDirection: TextDirection.rtl),
                        const SizedBox(height: 4),
                        const Text('قيّم الخدمة التي حصلت عليها', style: TextStyle(fontSize: 12, color: Colors.grey), textDirection: TextDirection.rtl),
                        const SizedBox(height: 16),
                        _starRow(_overallRating, 32, (v) => setState(() => _overallRating = v)),
                        const SizedBox(height: 12),
                        Text(
                          _overallRating == 0 ? 'اختر تقييمك' : _ratingLabel(_overallRating),
                          style: TextStyle(fontSize: 13, color: _overallRating == 0 ? Colors.grey : _green, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Detailed ratings
                  _card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text('تقييم تفصيلي', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold), textDirection: TextDirection.rtl),
                        const SizedBox(height: 14),
                        _detailRow(Icons.thumb_up_outlined, Colors.blue, 'جودة العمل', _qualityRating, (v) => setState(() => _qualityRating = v)),
                        const SizedBox(height: 12),
                        _detailRow(Icons.access_time, _green, 'الالتزام بالمواعيد', _punctualityRating, (v) => setState(() => _punctualityRating = v)),
                        const SizedBox(height: 12),
                        _detailRow(Icons.workspace_premium_outlined, Colors.purple, 'الاحترافية', _professionalismRating, (v) => setState(() => _professionalismRating = v)),
                        const SizedBox(height: 12),
                        _detailRow(Icons.cleaning_services_outlined, Colors.orange, 'النظافة', _cleanlinessRating, (v) => setState(() => _cleanlinessRating = v)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Comment
                  _card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text('أضف تعليقك (اختياري)', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold), textDirection: TextDirection.rtl),
                        const SizedBox(height: 12),
                        TextField(
                          controller: _commentController,
                          maxLines: 4,
                          maxLength: 500,
                          textDirection: TextDirection.rtl,
                          decoration: InputDecoration(
                            hintText: 'شارك تجربتك مع الآخرين...',
                            hintStyle: TextStyle(color: Colors.grey[400], fontSize: 13),
                            filled: true,
                            fillColor: Colors.grey.shade50,
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.grey.shade200)),
                            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.grey.shade200)),
                            focusedBorder: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12)), borderSide: BorderSide(color: _green, width: 2)),
                            contentPadding: const EdgeInsets.all(14),
                          ),
                          onChanged: (_) => setState(() {}),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Quick tags
                  _card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text('أضف وسوماً سريعة', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold), textDirection: TextDirection.rtl),
                        const SizedBox(height: 12),
                        Wrap(
                          alignment: WrapAlignment.end,
                          spacing: 8,
                          runSpacing: 8,
                          children: _tags.map((tag) {
                            final selected = _selectedTags.contains(tag);
                            return GestureDetector(
                              onTap: () => setState(() {
                                if (selected) _selectedTags.remove(tag); else _selectedTags.add(tag);
                              }),
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 180),
                                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
                                decoration: BoxDecoration(
                                  color: selected ? _green : Colors.grey.shade100,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: selected ? _green : Colors.grey.shade300),
                                ),
                                child: Text(tag, style: TextStyle(fontSize: 13, color: selected ? Colors.white : Colors.grey.shade700, fontWeight: FontWeight.w500)),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Submit button
                  ElevatedButton(
                    onPressed: _overallRating > 0 ? () => Navigator.popUntil(context, (r) => r.isFirst) : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _green,
                      disabledBackgroundColor: Colors.grey.shade300,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                      elevation: 0,
                    ),
                    child: const Text('إرسال التقييم', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String _ratingLabel(double r) {
    if (r >= 5) return 'ممتاز';
    if (r >= 4) return 'جيد جداً';
    if (r >= 3) return 'جيد';
    if (r >= 2) return 'مقبول';
    return 'سيء';
  }

  Widget _starRow(double value, double size, ValueChanged<double> onChange) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (i) {
        return GestureDetector(
          onTap: () => onChange(i + 1.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Icon(i < value ? Icons.star : Icons.star_border, color: Colors.amber, size: size),
          ),
        );
      }),
    );
  }

  Widget _detailRow(IconData icon, Color color, String label, double value, ValueChanged<double> onChange) {
    return Row(
      textDirection: TextDirection.rtl,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          textDirection: TextDirection.rtl,
          children: [
            Icon(icon, color: color, size: 18),
            const SizedBox(width: 8),
            Text(label, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500), textDirection: TextDirection.rtl),
          ],
        ),
        Row(
          children: List.generate(5, (i) {
            return GestureDetector(
              onTap: () => onChange(i + 1.0),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: Icon(i < value ? Icons.star : Icons.star_border, color: Colors.amber, size: 22),
              ),
            );
          }),
        ),
      ],
    );
  }

  static Widget _card({required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 10, offset: const Offset(0, 3))],
      ),
      child: child,
    );
  }
}
