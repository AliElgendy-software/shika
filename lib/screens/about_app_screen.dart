import 'package:flutter/material.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({super.key});

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
          'حول التطبيق',
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
            child: Icon(Icons.home_outlined, color: Colors.white),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          textDirection: TextDirection.rtl,
          children: [
            // App Info Card
            Container(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey[200]!),
              ),
              child: Column(
                children: [
                  Container(
                    width: 72,
                    height: 72,
                    decoration: BoxDecoration(
                      color: const Color(0xFF00A63E),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(
                      Icons.home,
                      color: Colors.white,
                      size: 36,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'الخدمات المنزلية',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'الإصدار 1.0.0',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'منصتك المتكاملة لجميع الخدمات المنزلية في مصر',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Statistics Grid
            Row(
              textDirection: TextDirection.rtl,
              children: [
                Expanded(
                  child: _buildStatCard('500+', 'فني محترف', const Color(0xFF00A63E)),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildStatCard('10,000+', 'عميل سعيد', const Color(0xFF00A63E)),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              textDirection: TextDirection.rtl,
              children: [
                Expanded(
                  child: _buildStatCard('4.9', 'تقييم العملاء', const Color(0xFF00A63E)),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildStatCard('50,000+', 'خدمة مكتملة', const Color(0xFF00A63E)),
                ),
              ],
            ),
            const SizedBox(height: 24),
            // About Us
            const Text(
              'من نحن',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.right,
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey[200]!),
              ),
              child: Text(
                'نحن منصة رائدة في مجال الخدمات المنزلية في مصر، نربط بين العملاء وأفضل الفنيين المحترفين في مختلف المجالات.\n\nهدفنا هو توفير خدمات عالية الجودة بأسعار تنافسية، مع ضمان رضا العملاء وسلامة المعاملات.',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey[700],
                  height: 1.6,
                ),
                textAlign: TextAlign.right,
                textDirection: TextDirection.rtl,
              ),
            ),
            const SizedBox(height: 24),
            // Why Us
            const Text(
              'لماذا نحن؟',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.right,
            ),
            const SizedBox(height: 12),
            Row(
              textDirection: TextDirection.rtl,
              children: [
                Expanded(
                  child: _buildFeatureCard(
                    icon: Icons.people_outline,
                    iconColor: Colors.blue,
                    title: '+10,000 عميل',
                    subtitle: 'ثقة آلاف العملاء',
                    iconBgColor: Colors.blue[50]!,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildFeatureCard(
                    icon: Icons.emoji_events_outlined,
                    iconColor: Colors.orange,
                    title: 'جودة عالية',
                    subtitle: 'فنيون محترفون ومعتمدون',
                    iconBgColor: Colors.orange[50]!,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              textDirection: TextDirection.rtl,
              children: [
                Expanded(
                  child: _buildFeatureCard(
                    icon: Icons.bolt,
                    iconColor: Colors.purple,
                    title: 'خدمة سريعة',
                    subtitle: 'استجابة فورية',
                    iconBgColor: Colors.purple[50]!,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildFeatureCard(
                    icon: Icons.shield_outlined,
                    iconColor: const Color(0xFF00A63E),
                    title: 'أمان وثقة',
                    subtitle: 'معاملات آمنة 100%',
                    iconBgColor: const Color(0xFFE8F5E9),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            // Mission
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFE8F5E9),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Row(
                textDirection: TextDirection.rtl,
                children: [
                  Icon(Icons.verified_user_outlined, color: Color(0xFF00A63E), size: 24),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      textDirection: TextDirection.rtl,
                      children: [
                        Text(
                          'رسالتنا',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'نسعى لجعل حياتك أسهل من خلال توفير خدمات منزلية موثوقة وسريعة مع الحفاظ على أعلى معايير الجودة والأمان.',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF2E7D32),
                            height: 1.5,
                          ),
                          textAlign: TextAlign.right,
                          textDirection: TextDirection.rtl,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            // Footer
            Center(
              child: Column(
                children: [
                  Text(
                    '© 2025 الخدمات المنزلية جميع الحقوق محفوظة',
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.grey[500],
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    textDirection: TextDirection.rtl,
                    children: [
                      Text(
                        'صُنع بـ ',
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.grey[500],
                        ),
                        textDirection: TextDirection.rtl,
                      ),
                      const Icon(Icons.favorite, color: Colors.red, size: 12),
                      Text(
                        ' في مصر',
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.grey[500],
                        ),
                        textDirection: TextDirection.rtl,
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String number, String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        children: [
          Text(
            number,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: color,
            ),
            textDirection: TextDirection.ltr,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
            ),
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureCard({
    required IconData icon,
    required Color iconColor,
    required Color iconBgColor,
    required String title,
    required String subtitle,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: iconBgColor,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: 24),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 11,
              color: Colors.grey[500],
            ),
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
          ),
        ],
      ),
    );
  }
}

