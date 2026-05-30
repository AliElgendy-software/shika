import 'package:flutter/material.dart';
import 'service_details_screen.dart';

class TechniciansListScreen extends StatefulWidget {
  const TechniciansListScreen({super.key});

  @override
  State<TechniciansListScreen> createState() => _TechniciansListScreenState();
}

class _TechniciansListScreenState extends State<TechniciansListScreen> {
  String _selectedCategory = 'الكل';

  final List<Map<String, String>> _categories = [
    {'label': 'الكل', 'icon': '👥'},
    {'label': 'سباكة', 'icon': '🔧'},
    {'label': 'كهرباء', 'icon': '⚡'},
    {'label': 'نظافة', 'icon': '🧹'},
    {'label': 'تكييف', 'icon': '❄️'},
    {'label': 'دهان', 'icon': '🎨'},
  ];

  final List<_TechnicianData> _allTechnicians = [
    _TechnicianData(
      name: 'أحمد محمد السباك',
      initials: 'أما',
      specialty: 'فني سباكة محترف • خبرة 12 سنة',
      price: '150 جنيه/ساعة',
      rating: 4.9,
      reviews: 312,
      services: 456,
      location: 'المعادي، القاهرة',
      responseTime: 'متاح • رد خلال 30 دقيقة',
      badge: 'الأعلى تقييماً 🏆',
      badgeColor: const Color(0xFF00A63E),
      isOnline: true,
      isVerified: true,
      category: 'سباكة',
    ),
    _TechnicianData(
      name: 'محمد علي حسن',
      initials: 'معح',
      specialty: 'كهربائي معتمد • خبرة 15 سنة',
      price: '180 جنيه/ساعة',
      rating: 4.8,
      reviews: 289,
      services: 398,
      location: 'مدينة نصر، القاهرة',
      responseTime: 'متاح • رد خلال 45 دقيقة',
      badge: 'الأكثر طلباً 🔥',
      badgeColor: const Color(0xFF00A63E),
      isOnline: true,
      isVerified: true,
      category: 'كهرباء',
    ),
    _TechnicianData(
      name: 'خالد حسن إبراهيم',
      initials: 'خحإ',
      specialty: 'فني تكييف وتبريد • خبرة 10 سنوات',
      price: '160 جنيه/ساعة',
      rating: 4.7,
      reviews: 234,
      services: 312,
      location: 'مصر الجديدة، القاهرة',
      responseTime: 'غير متاح حالياً',
      badge: '',
      badgeColor: Colors.grey,
      isOnline: false,
      isVerified: true,
      category: 'تكييف',
    ),
    _TechnicianData(
      name: 'عمر السيد محمود',
      initials: 'عام',
      specialty: 'معلم دهان وديكور • خبرة 18 سنة',
      price: '140 جنيه/ساعة',
      rating: 4.9,
      reviews: 198,
      services: 267,
      location: 'الزمالك، القاهرة',
      responseTime: 'متاح • رد خلال 20 دقيقة',
      badge: '',
      badgeColor: Colors.grey,
      isOnline: true,
      isVerified: true,
      category: 'دهان',
    ),
    _TechnicianData(
      name: 'محمود عبد الرحمن',
      initials: 'معا',
      specialty: 'سباك منازل • خبرة 6 سنوات',
      price: '120 جنيه/ساعة',
      rating: 4.5,
      reviews: 143,
      services: 198,
      location: 'حلوان، القاهرة',
      responseTime: 'متاح • رد خلال 50 دقيقة',
      badge: '',
      badgeColor: Colors.grey,
      isOnline: true,
      isVerified: true,
      category: 'سباكة',
    ),
    _TechnicianData(
      name: 'سارة محمد أحمد',
      initials: 'سما',
      specialty: 'متخصصة نظافة منازل • خبرة 8 سنوات',
      price: '130 جنيه/ساعة',
      rating: 4.8,
      reviews: 267,
      services: 345,
      location: 'الدقي، القاهرة',
      responseTime: 'متاح • رد خلال 15 دقيقة',
      badge: 'الأعلى تقييماً 🏆',
      badgeColor: const Color(0xFF00A63E),
      isOnline: true,
      isVerified: true,
      category: 'نظافة',
    ),
    _TechnicianData(
      name: 'علي حسين محمد',
      initials: 'عحم',
      specialty: 'كهربائي منازل • خبرة 9 سنوات',
      price: '150 جنيه/ساعة',
      rating: 4.6,
      reviews: 178,
      services: 234,
      location: 'المهندسين، القاهرة',
      responseTime: 'متاح • رد خلال 40 دقيقة',
      badge: '',
      badgeColor: Colors.grey,
      isOnline: true,
      isVerified: true,
      category: 'كهرباء',
    ),
    _TechnicianData(
      name: 'حسن إبراهيم علي',
      initials: 'حإع',
      specialty: 'فني تكييف مركزي • خبرة 14 سنة',
      price: '200 جنيه/ساعة',
      rating: 4.9,
      reviews: 310,
      services: 420,
      location: 'التجمع الخامس، القاهرة',
      responseTime: 'متاح • رد خلال 25 دقيقة',
      badge: 'الأكثر طلباً 🔥',
      badgeColor: const Color(0xFF00A63E),
      isOnline: true,
      isVerified: true,
      category: 'تكييف',
    ),
  ];

  List<_TechnicianData> get _filteredTechnicians {
    if (_selectedCategory == 'الكل') return _allTechnicians;
    return _allTechnicians.where((t) => t.category == _selectedCategory).toList();
  }

  @override
  Widget build(BuildContext context) {
    final filtered = _filteredTechnicians;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color(0xFFF7F8FA),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: const Text('سباكة', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
          leading: IconButton(
            icon: const Icon(Icons.arrow_forward, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.tune, color: Colors.black),
              onPressed: () {},
            ),
          ],
        ),
        body: Column(
          children: [
            // Tabs
            Container(
              color: Colors.white,
              child: TabBar(
                indicatorColor: const Color(0xFF00A63E),
                indicatorWeight: 3,
                labelColor: const Color(0xFF00A63E),
                unselectedLabelColor: Colors.grey,
                labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                tabs: [
                  Tab(text: 'الفنيين (${filtered.length})'),
                  const Tab(text: 'الخدمات (6)'),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  // Technicians Tab
                  Column(
                    children: [
                      // Sort Chips
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            textDirection: TextDirection.rtl,
                            children: [
                              _buildSortChip('الأعلى تقييماً', true),
                              const SizedBox(width: 8),
                              _buildSortChip('الأقل سعراً', false),
                              const SizedBox(width: 8),
                              _buildSortChip('الأكثر طلباً', false),
                            ],
                          ),
                        ),
                      ),
                      // Technicians List
                      Expanded(
                        child: ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          itemCount: filtered.length,
                          itemBuilder: (context, index) {
                            return _buildTechnicianCard(filtered[index]);
                          },
                        ),
                      ),
                    ],
                  ),
                  // Services Tab
                  _buildSubServicesList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSortChip(String label, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF00A63E) : Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: isSelected ? const Color(0xFF00A63E) : Colors.grey[300]!),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black87,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildSubServicesList() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildSubServiceItem('كشف تسريبات المياه بالضغط', '150 جنيه', 'كشف دقيق باستخدام أحدث الأجهزة'),
        _buildSubServiceItem('تركيب سخان كهربائي أو غاز', '200 جنيه', 'تركيب احترافي مع ضمان سنة'),
        _buildSubServiceItem('إصلاح وصيانة الحنيفيات', '80 جنيه', 'تغيير وإصلاح جميع أنواع الحنيفيات'),
      ],
    );
  }

  Widget _buildSubServiceItem(String title, String price, String desc) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            textDirection: TextDirection.rtl,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFF00A63E),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.plumbing, color: Colors.white, size: 24),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  textDirection: TextDirection.rtl,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      textDirection: TextDirection.rtl,
                      children: [
                        Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                        Text(price, style: const TextStyle(color: Color(0xFF00A63E), fontWeight: FontWeight.bold, fontSize: 14)),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(desc, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            textDirection: TextDirection.rtl,
            children: [
              Text('عرض الملف الشخصي ←', style: TextStyle(color: Colors.blue[800], fontSize: 12, fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTechnicianCard(_TechnicianData tech) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4)),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const ServiceDetailsScreen()));
          },
          borderRadius: BorderRadius.circular(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                textDirection: TextDirection.rtl,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Avatar
                  Container(
                    width: 60,
                    height: 60,
                    decoration: const BoxDecoration(
                      color: Color(0xFF00A63E),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        tech.initials,
                        style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Details
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      textDirection: TextDirection.rtl,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          textDirection: TextDirection.rtl,
                          children: [
                            Text(tech.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                            Text(tech.price, style: const TextStyle(color: Color(0xFF00A63E), fontWeight: FontWeight.bold, fontSize: 14)),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          textDirection: TextDirection.rtl,
                          children: [
                            const Icon(Icons.verified, color: Colors.blue, size: 14),
                            const SizedBox(width: 4),
                            Text('موثق', style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                            const SizedBox(width: 8),
                            Text('•', style: TextStyle(color: Colors.grey[400])),
                            const SizedBox(width: 8),
                            Text('خبرة 12 سنة', style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          textDirection: TextDirection.rtl,
                          children: [
                            const Icon(Icons.star, color: Colors.amber, size: 16),
                            const SizedBox(width: 2),
                            Text('${tech.rating}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                            Text(' (${tech.reviews})', style: TextStyle(color: Colors.grey[500], fontSize: 11)),
                            const SizedBox(width: 8),
                            Text('•', style: TextStyle(color: Colors.grey[400])),
                            const SizedBox(width: 8),
                            Text('${tech.services} خدمة', style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          textDirection: TextDirection.rtl,
                          children: [
                            Icon(Icons.location_on_outlined, size: 14, color: Colors.grey[500]),
                            const SizedBox(width: 4),
                            Text(tech.location, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TechnicianData {
  final String name;
  final String initials;
  final String specialty;
  final String price;
  final double rating;
  final int reviews;
  final int services;
  final String location;
  final String responseTime;
  final String badge;
  final Color badgeColor;
  final bool isOnline;
  final bool isVerified;
  final String category;

  _TechnicianData({
    required this.name,
    required this.initials,
    required this.specialty,
    required this.price,
    required this.rating,
    required this.reviews,
    required this.services,
    required this.location,
    required this.responseTime,
    required this.badge,
    required this.badgeColor,
    required this.isOnline,
    required this.isVerified,
    required this.category,
  });
}
