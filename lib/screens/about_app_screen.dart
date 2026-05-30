import 'package:flutter/material.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({super.key});

  static const _green = Color(0xFF00A63E);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F4F8),
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [Color(0xFF00C44F), _green], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
        ),
        elevation: 0,
        centerTitle: true,
        title: const Text('عن التطبيق', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_forward, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // --- Header Card ---
                  _card(
                    padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                    child: Column(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: const BoxDecoration(color: _green, shape: BoxShape.circle),
                          child: const Icon(Icons.home_work, color: Colors.white, size: 40),
                        ),
                        const SizedBox(height: 16),
                        const Text('الخدمات المنزلية', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 4),
                        const Text('الإصدار 1.0.0', style: TextStyle(fontSize: 12, color: Colors.grey)),
                        const SizedBox(height: 12),
                        const Text(
                          'منصتك المتكاملة لجميع الخدمات المنزلية في مصر',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),

                  // --- Stats Grid ---
                  Row(
                    children: [
                      Expanded(child: _statItem('500+', 'فني محترف', _green)),
                      const SizedBox(width: 12),
                      Expanded(child: _statItem('10,000+', 'عميل سعيد', _green)),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(child: _statItem('4.9', 'تقييم العملاء', _green)),
                      const SizedBox(width: 12),
                      Expanded(child: _statItem('50,000+', 'خدمة مكتملة', _green)),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // --- Who We Are ---
                  _sectionTitle('من نحن'),
                  _card(
                    padding: const EdgeInsets.all(16),
                    child: const Text(
                      'نحن منصة رائدة في مجال الخدمات المنزلية في مصر، نربط بين العملاء وأفضل الفنيين المحترفين في مختلف المجالات.\n\nهدفنا هو توفير خدمات عالية الجودة بأسهار تنافسية، مع ضمان رضا العملاء وسلامة المعاملات.',
                      style: TextStyle(fontSize: 13, height: 1.6, color: Colors.black87),
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // --- Why Us? ---
                  _sectionTitle('لماذا نحن؟'),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(child: _featureBox(Icons.people_alt_outlined, Colors.blue, '+10,000 عميل', 'ثقة آلاف العملاء')),
                      const SizedBox(width: 12),
                      Expanded(child: _featureBox(Icons.workspace_premium_outlined, Colors.orange, 'جودة عالية', 'فنيون محترفون ومعتمدون')),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(child: _featureBox(Icons.bolt, Colors.purple, 'خدمة سريعة', 'استجابة فورية')),
                      const SizedBox(width: 12),
                      Expanded(child: _featureBox(Icons.shield_outlined, Colors.green, 'أمان وثقة', 'معاملات آمنة 100%')),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // --- Mission ---
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE6F7EE),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: _green.withOpacity(0.2)),
                    ),
                    child: Row(
                      textDirection: TextDirection.rtl,
                      children: [
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text('رسالتنا', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold), textDirection: TextDirection.rtl),
                              SizedBox(height: 8),
                              Text(
                                'نسعى لجعل حياتك أسهل من خلال توفير خدمات منزلية موثوقة وسريعة، مع الحفاظ على أعلى معايير الجودة والأمان.',
                                style: TextStyle(fontSize: 13, height: 1.5, color: Colors.black87),
                                textDirection: TextDirection.rtl,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(color: _green, shape: BoxShape.circle),
                          child: const Icon(Icons.favorite, color: Colors.white, size: 24),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),

                  // --- Footer ---
                  const Center(
                    child: Column(
                      children: [
                        Text('© 2025 الخدمات المنزلية. جميع الحقوق محفوظة.', style: TextStyle(fontSize: 11, color: Colors.grey)),
                        SizedBox(height: 4),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('صنع بـ ', style: TextStyle(fontSize: 11, color: Colors.grey)),
                            Icon(Icons.favorite, color: Colors.red, size: 12),
                            Text(' في مصر', style: TextStyle(fontSize: 11, color: Colors.grey)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // --- Widgets ---

  Widget _card({required Widget child, EdgeInsetsGeometry? padding}) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 10, offset: const Offset(0, 3))],
      ),
      child: child,
    );
  }

  Widget _statItem(String value, String label, Color color) {
    return _card(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: [
          Text(value, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: color)),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12, right: 4),
      child: Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold), textDirection: TextDirection.rtl),
    );
  }

  Widget _featureBox(IconData icon, Color color, String title, String sub) {
    return _card(
      padding: const EdgeInsets.all(14),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(height: 12),
          Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(sub, style: const TextStyle(fontSize: 10, color: Colors.grey), textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
