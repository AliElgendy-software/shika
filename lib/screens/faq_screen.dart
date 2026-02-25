import 'package:flutter/material.dart';

class FAQScreen extends StatefulWidget {
  const FAQScreen({super.key});

  @override
  State<FAQScreen> createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  final Map<String, bool> _expandedItems = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFF00A63E),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'الأسئلة الشائعة',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Icon(Icons.help_outline, color: Colors.white),
          )
        ],
      ),
      body: Column(
        children: [
          // Search Bar
          Container(
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey[200]!),
            ),
            child: const TextField(
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                hintText: 'ابحث في الأسئلة',
                hintTextDirection: TextDirection.rtl,
                hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                suffixIcon: Icon(Icons.search, color: Colors.grey),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              ),
            ),
          ),
          // FAQ List
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _buildCategory('عام', [
                  _FAQItem(
                    question: 'كيف أحجز خدمة؟',
                    answer: 'يمكنك حجز خدمة من خلال التطبيق بسهولة...',
                  ),
                  _FAQItem(
                    question: 'ما هي طرق الدفع المتاحة؟',
                    answer: 'توفر عدة طرق للدفع: الدفع عند الاستلام، بطاقات الائتمان، المحافظ الإلكترونية (فودافون كاش، فورى، وغيرها).',
                  ),
                  _FAQItem(
                    question: 'هل يمكنني إلغاء الحجز؟',
                    answer: 'نعم، يمكنك إلغاء الحجز قبل موعد الخدمة...',
                  ),
                ]),
                _buildCategory('الفنيين', [
                  _FAQItem(
                    question: 'كيف يتم اختيار الفنيين؟',
                    answer: 'نختار الفنيين بعناية بناءً على خبرتهم وتقييمات العملاء...',
                  ),
                  _FAQItem(
                    question: 'هل الفنيون مؤمن عليهم؟',
                    answer: 'نعم، جميع الفنيين مؤمن عليهم...',
                  ),
                ]),
                _buildCategory('الدفع والأسعار', [
                  _FAQItem(
                    question: 'كيف يتم احتساب التكلفة؟',
                    answer: 'يتم احتساب التكلفة بناءً على نوع الخدمة والوقت المطلوب...',
                  ),
                  _FAQItem(
                    question: 'هل السعر المعروض نهائي؟',
                    answer: 'السعر المعروض هو سعر تقريبي وقد يختلف قليلاً حسب تفاصيل الخدمة...',
                  ),
                ]),
                _buildCategory('الضمان', [
                  _FAQItem(
                    question: 'هل هناك ضمان على الخدمة؟',
                    answer: 'نعم، نقدم ضمان على جميع الخدمات...',
                  ),
                  _FAQItem(
                    question: 'ماذا أفعل إذا لم أكن راضياً عن الخدمة؟',
                    answer: 'يمكنك التواصل معنا وسنقوم بحل المشكلة فوراً...',
                  ),
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategory(String category, List<_FAQItem> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            category,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.right,
          ),
        ),
        ...items.map((item) => _buildFAQItem(item)),
        const SizedBox(height: 8),
      ],
    );
  }

  Widget _buildFAQItem(_FAQItem item) {
    final isExpanded = _expandedItems[item.question] ?? false;
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          title: Text(
            item.question,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: isExpanded ? const Color(0xFF00A63E) : Colors.black87,
            ),
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.right,
          ),
          iconColor: const Color(0xFF00A63E),
          collapsedIconColor: const Color(0xFF00A63E),
          trailing: Icon(
            isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
          ),
          onExpansionChanged: (expanded) {
            setState(() {
              _expandedItems[item.question] = expanded;
            });
          },
          childrenPadding: EdgeInsets.zero,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFE8F5E9),
                borderRadius: BorderRadius.circular(6),
                border: const Border(
                  right: BorderSide(color: Color(0xFF00A63E), width: 3),
                ),
              ),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  item.answer,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF2E7D32),
                    height: 1.5,
                  ),
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.right,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FAQItem {
  final String question;
  final String answer;

  _FAQItem({required this.question, required this.answer});
}

