import 'package:flutter/material.dart';
import 'chat_screen.dart';
import 'booking/booking_screen.dart';

class ServiceProviderDetailsScreen extends StatelessWidget {
  final String name;
  final String service;
  final String price;
  final double rating;
  final int reviews;

  const ServiceProviderDetailsScreen({
    super.key,
    this.name = 'أحمد محمد علي',
    this.service = 'فني سباكة وصيانة',
    this.price = '150 ج.م / خدمة',
    this.rating = 4.8,
    this.reviews = 156,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F5F5),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: const Text('مقدم الخدمة', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
          leading: IconButton(
            icon: const Icon(Icons.arrow_forward, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Column(
          children: [
            // Green Header Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Color(0xFF00A63E),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
              ),
              child: Column(
                children: [
                  // Provider Info Row
                  Row(
                    textDirection: TextDirection.rtl,
                    children: [
                      // Avatar
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Center(
                          child: Text(
                            name.substring(0, 2),
                            style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          textDirection: TextDirection.rtl,
                          children: [
                            Text(name, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold), textDirection: TextDirection.rtl),
                            const SizedBox(height: 4),
                            Text(service, style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 14), textDirection: TextDirection.rtl),
                            const SizedBox(height: 4),
                            Row(
                              textDirection: TextDirection.rtl,
                              children: [
                                Text('($reviews تقييم)', style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 12), textDirection: TextDirection.rtl),
                                const SizedBox(width: 4),
                                const Icon(Icons.star, color: Colors.amber, size: 16),
                                const SizedBox(width: 4),
                                Text('$rating', style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ],
                        ),
                      ),
                      // Chat & Call icons
                      Column(
                        children: [
                          Container(
                            width: 36,
                            height: 36,
                            decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), shape: BoxShape.circle),
                            child: IconButton(
                              icon: const Icon(Icons.chat_bubble_outline, color: Colors.white, size: 16),
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen(providerName: name)));
                              },
                              padding: EdgeInsets.zero,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            width: 36,
                            height: 36,
                            decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), shape: BoxShape.circle),
                            child: const Icon(Icons.phone, color: Colors.white, size: 16),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Stats Row
                  Row(
                    textDirection: TextDirection.rtl,
                    children: [
                      _buildStatBox('243', 'خدمة مكتملة'),
                      const SizedBox(width: 8),
                      _buildStatBox('15 دقيقة', 'وقت الاستجابة'),
                      const SizedBox(width: 8),
                      _buildStatBox('3+', 'سنوات خبرة'),
                    ],
                  ),
                  const SizedBox(height: 12),
                  // Badges
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    textDirection: TextDirection.rtl,
                    children: [
                      _buildBadge(Icons.verified, 'موثق'),
                      const SizedBox(width: 8),
                      _buildBadge(Icons.shield, 'مضمون'),
                    ],
                  ),
                ],
              ),
            ),
            // TabBar
            Container(
              color: Colors.white,
              child: const TabBar(
                labelColor: Color(0xFF00A63E),
                unselectedLabelColor: Colors.grey,
                indicatorColor: Color(0xFF00A63E),
                indicatorWeight: 3,
                labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                tabs: [
                  Tab(text: 'نبذة'),
                  Tab(text: 'الخدمات'),
                  Tab(text: 'التقييمات'),
                ],
              ),
            ),
            // TabBarView
            Expanded(
              child: TabBarView(
                children: [
                  _buildOverviewTab(),
                  Builder(builder: (ctx) => _buildServicesTab(ctx)),
                  _buildReviewsTab(),
                ],
              ),
            ),
          ],
        ),
        // Bottom bar
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.1), blurRadius: 10, offset: const Offset(0, -2))],
          ),
          child: Row(
            textDirection: TextDirection.rtl,
            children: [
              Expanded(
                flex: 2,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const BookingScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00A63E),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    elevation: 0,
                  ),
                  child: const Text('احجز الآن', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                flex: 2,
                child: OutlinedButton.icon(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen(providerName: name)));
                  },
                  icon: const Icon(Icons.chat_bubble_outline, size: 18, color: Colors.black87),
                  label: const Text('محادثة', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black87)),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.grey[300]!),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatBox(String value, String label) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.15),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Text(value, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(label, style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 11)),
          ],
        ),
      ),
    );
  }

  Widget _buildBadge(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white, size: 14),
          const SizedBox(width: 4),
          Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
        ],
      ),
    );
  }

  // ==================== OVERVIEW TAB ====================
  Widget _buildOverviewTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // About
          _buildCard(
            title: 'نبذة عن مقدم الخدمة',
            child: Text(
              'فني سباكة محترف مع خبرة 10 سنوات في جميع أعمال السباكة والصيانة. متخصص في كشف التسربات، تركيب السخانات، وصيانة الحمامات والمطابخ.',
              style: TextStyle(fontSize: 14, color: Colors.grey[700], height: 1.7),
              textDirection: TextDirection.rtl,
            ),
          ),
          const SizedBox(height: 12),
          // Badges & Achievements
          _buildCard(
            title: 'الشارات والإنجازات',
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              textDirection: TextDirection.rtl,
              children: [
                _buildAchievementChip('محترف معتمد'),
                _buildAchievementChip('الأكثر طلباً'),
                _buildAchievementChip('استجابة سريعة'),
              ],
            ),
          ),
          const SizedBox(height: 12),
          // Contact Info
          _buildCard(
            title: 'معلومات الاتصال',
            child: Column(
              children: [
                _buildContactRow(Icons.location_on_outlined, 'المعادي، القاهرة'),
                const SizedBox(height: 12),
                _buildContactRow(Icons.phone_outlined, '01012345678'),
                const SizedBox(height: 12),
                _buildContactRow(Icons.calendar_today_outlined, 'عضو منذ يناير 2022'),
              ],
            ),
          ),
          const SizedBox(height: 12),
          // Working Hours
          _buildCard(
            title: 'ساعات العمل',
            child: Column(
              children: [
                _buildWorkingHoursRow('السبت', '9 ص - 9 م'),
                _buildWorkingHoursRow('الأحد', '9 ص - 9 م'),
                _buildWorkingHoursRow('الاثنين', '9 ص - 9 م'),
                _buildWorkingHoursRow('الثلاثاء', '9 ص - 9 م'),
                _buildWorkingHoursRow('الأربعاء', '9 ص - 9 م'),
                _buildWorkingHoursRow('الخميس', '9 ص - 9 م'),
                _buildWorkingHoursRow('الجمعة', 'مغلق', isClosed: true),
              ],
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildCard({required String title, required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87), textDirection: TextDirection.rtl),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }

  Widget _buildAchievementChip(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFF00A63E).withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFF00A63E).withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.emoji_events, color: Color(0xFF00A63E), size: 14),
          const SizedBox(width: 4),
          Text(text, style: const TextStyle(color: Color(0xFF00A63E), fontSize: 12, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  Widget _buildContactRow(IconData icon, String text) {
    return Row(
      textDirection: TextDirection.rtl,
      children: [
        Icon(icon, color: Colors.grey[600], size: 18),
        const SizedBox(width: 8),
        Text(text, style: TextStyle(fontSize: 14, color: Colors.grey[700]), textDirection: TextDirection.rtl),
      ],
    );
  }

  Widget _buildWorkingHoursRow(String day, String hours, {bool isClosed = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        textDirection: TextDirection.rtl,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(day, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500), textDirection: TextDirection.rtl),
          Text(hours, style: TextStyle(fontSize: 14, color: isClosed ? Colors.red : Colors.grey[600]), textDirection: TextDirection.rtl),
        ],
      ),
    );
  }

  // ==================== SERVICES TAB ====================
  Widget _buildServicesTab(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildServiceListItem(context, 'كشف تسربات المياه', '150 جنيه', '1-2 ساعة'),
        _buildServiceListItem(context, 'تركيب سخان كهربائي', '200 جنيه', '2-3 ساعة'),
        _buildServiceListItem(context, 'صيانة حنفيات', '100 جنيه', '30 دقيقة'),
        _buildServiceListItem(context, 'تسليك بالوعة', '120 جنيه', '1 ساعة'),
        _buildServiceListItem(context, 'تركيب خلاطات', '150 جنيه', '1-2 ساعة'),
        const SizedBox(height: 32),
      ],
    );
  }

  Widget _buildServiceListItem(BuildContext context, String title, String price, String duration) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Row(
        textDirection: TextDirection.rtl,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            textDirection: TextDirection.rtl,
            children: [
              Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black87), textDirection: TextDirection.rtl),
              const SizedBox(height: 4),
              Row(
                textDirection: TextDirection.rtl,
                children: [
                  const Icon(Icons.access_time, size: 14, color: Colors.grey),
                  const SizedBox(width: 4),
                  Text(duration, style: TextStyle(fontSize: 12, color: Colors.grey[600]), textDirection: TextDirection.rtl),
                ],
              ),
              const SizedBox(height: 8),
              Text(price, style: const TextStyle(fontSize: 14, color: Color(0xFF00A63E), fontWeight: FontWeight.bold), textDirection: TextDirection.rtl),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const BookingScreen()));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF00A63E),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              elevation: 0,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            ),
            child: const Text('احجز', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  // ==================== REVIEWS TAB ====================
  Widget _buildReviewsTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Overall Rating Card
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey[200]!),
            ),
            child: Row(
              textDirection: TextDirection.rtl,
              children: [
                // Rating bars
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      _buildRatingBar(5, 0.7),
                      _buildRatingBar(4, 0.2),
                      _buildRatingBar(3, 0.05),
                      _buildRatingBar(2, 0.03),
                      _buildRatingBar(1, 0.02),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                // Score
                Column(
                  children: [
                    Text('$rating', style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
                    Row(
                      children: List.generate(5, (i) => Icon(
                        Icons.star,
                        color: i < rating.round() ? Colors.amber : Colors.grey[300],
                        size: 16,
                      )),
                    ),
                    const SizedBox(height: 4),
                    Text('$reviews تقييم', style: TextStyle(fontSize: 12, color: Colors.grey[500])),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Individual Reviews
          _buildReviewItem('محمد أحمد', 5, 'منذ 3 أيام', 'كشف تسربات المياه', 'ممتاز جداً. محترف ودقيق في المواعيد. أنصح بالتعامل معه.'),
          _buildReviewItem('سارة حسن', 5, 'منذ أسبوع', 'تركيب سخان', 'شغل نظيف واحترافي. السعر مناسب جداً.'),
          _buildReviewItem('خالد عمر', 4, 'منذ أسبوعين', 'صيانة حنفيات', 'جيد. لكن تأخر قليلاً عن الموعد.'),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildRatingBar(int stars, double percentage) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          const Icon(Icons.star_border, size: 14, color: Colors.grey),
          const SizedBox(width: 4),
          Text('$stars', style: TextStyle(fontSize: 12, color: Colors.grey[600])),
          const SizedBox(width: 8),
          Expanded(
            child: Container(
              height: 8,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(4),
              ),
              child: FractionallySizedBox(
                alignment: Alignment.centerRight,
                widthFactor: percentage,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewItem(String name, int stars, String time, String service, String comment) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(name, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold), textDirection: TextDirection.rtl),
              Text(time, style: TextStyle(fontSize: 12, color: Colors.grey[500])),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            textDirection: TextDirection.rtl,
            children: List.generate(5, (i) => Icon(
              i < stars ? Icons.star : Icons.star_border,
              color: Colors.amber,
              size: 16,
            )),
          ),
          const SizedBox(height: 4),
          Text(service, style: TextStyle(fontSize: 12, color: Colors.grey[500]), textDirection: TextDirection.rtl),
          const SizedBox(height: 8),
          Text(comment, style: TextStyle(fontSize: 13, color: Colors.grey[700], height: 1.4), textDirection: TextDirection.rtl),
        ],
      ),
    );
  }
}
