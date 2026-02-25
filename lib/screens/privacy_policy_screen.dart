import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text('سياسة الخصوصية', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_forward, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          textDirection: TextDirection.rtl,
          children: [
            Text('آخر تحديث: 1 يناير 2025', style: TextStyle(fontSize: 12, color: Colors.grey[500]), textDirection: TextDirection.rtl),
            const SizedBox(height: 24),
            _buildSection('مقدمة', 'نحن في تطبيق الخدمات المنزلية نلتزم بحماية خصوصيتك. توضح سياسة الخصوصية هذه كيفية جمع واستخدام وحماية معلوماتك الشخصية عند استخدام تطبيقنا.'),
            _buildSection('المعلومات التي نجمعها', '• الاسم وعنوان البريد الإلكتروني ورقم الهاتف\n• عنوان الخدمة والموقع الجغرافي\n• تفاصيل الطلبات والمعاملات\n• معلومات الجهاز والتطبيق\n• سجل التصفح داخل التطبيق'),
            _buildSection('كيف نستخدم معلوماتك', '• تقديم وتحسين خدماتنا\n• معالجة الطلبات والمدفوعات\n• التواصل معك بشأن طلباتك\n• تحسين تجربة المستخدم\n• إرسال عروض وتحديثات (بموافقتك)'),
            _buildSection('حماية البيانات', 'نستخدم تدابير أمنية متقدمة لحماية معلوماتك الشخصية من الوصول غير المصرح به أو الاستخدام غير السليم. يتم تشفير جميع البيانات أثناء النقل والتخزين.'),
            _buildSection('حقوقك', '• الوصول إلى بياناتك الشخصية\n• طلب تصحيح أو حذف بياناتك\n• الانسحاب من الاتصالات التسويقية\n• تقديم شكوى إلى الجهة المنظمة'),
            _buildSection('تواصل معنا', 'إذا كان لديك أي أسئلة حول سياسة الخصوصية، يرجى التواصل معنا عبر:\n\nالبريد الإلكتروني: privacy@homeservices.com\nالهاتف: 19999'),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        textDirection: TextDirection.rtl,
        children: [
          Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87), textDirection: TextDirection.rtl),
          const SizedBox(height: 8),
          Text(content, style: TextStyle(fontSize: 14, color: Colors.grey[700], height: 1.7), textDirection: TextDirection.rtl),
        ],
      ),
    );
  }
}
