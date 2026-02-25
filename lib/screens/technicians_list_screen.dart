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

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          textDirection: TextDirection.rtl,
          children: const [
            Icon(Icons.filter_list, color: Colors.black87, size: 22),
            SizedBox(width: 8),
            Text('جميع الفنيين', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_forward, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          // Search bar
          Container(
            color: Colors.white,
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Container(
              height: 44,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(10),
              ),
              child: const TextField(
                textDirection: TextDirection.rtl,
                decoration: InputDecoration(
                  hintText: 'ابحث عن فني...',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                  suffixIcon: Icon(Icons.search, color: Colors.grey),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                ),
              ),
            ),
          ),
          // Category Filter Chips
          Container(
            color: Colors.white,
            padding: const EdgeInsets.fromLTRB(0, 4, 0, 12),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                textDirection: TextDirection.rtl,
                children: _categories.map((cat) => _buildCategoryChip(cat['label']!, cat['icon']!)).toList(),
              ),
            ),
          ),
          // Count
          Container(
            color: Colors.white,
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '${filtered.length} فني متاح',
                  style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                  textDirection: TextDirection.rtl,
                ),
              ],
            ),
          ),
          // Technicians List
          Expanded(
            child: filtered.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.person_search, size: 64, color: Colors.grey[300]),
                        const SizedBox(height: 16),
                        Text('لا يوجد فنيين في هذا التخصص', style: TextStyle(fontSize: 16, color: Colors.grey[500])),
                      ],
                    ),
                  )
                : ListView.separated(
                    padding: const EdgeInsets.all(16),
                    itemCount: filtered.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (context, index) => _buildTechnicianCard(filtered[index]),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryChip(String label, String emoji) {
    final isSelected = _selectedCategory == label;
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 8),
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedCategory = label;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF00A63E) : Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: isSelected ? const Color(0xFF00A63E) : Colors.grey[300]!),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(emoji, style: const TextStyle(fontSize: 14)),
              const SizedBox(width: 4),
              Text(
                label,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  color: isSelected ? Colors.white : Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTechnicianCard(_TechnicianData tech) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const ServiceDetailsScreen()));
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(color: Colors.grey.withOpacity(0.08), blurRadius: 8, offset: const Offset(0, 2)),
          ],
        ),
        child: Column(
          children: [
            // Top Row: Avatar + Name + Price
            Row(
              textDirection: TextDirection.rtl,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Avatar with initials
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: const Color(0xFF2D5A27),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Center(
                    child: Text(
                      tech.initials,
                      style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                // Name + Verified + Specialty
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    textDirection: TextDirection.rtl,
                    children: [
                      Row(
                        textDirection: TextDirection.rtl,
                        children: [
                          Text(tech.name, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold), textDirection: TextDirection.rtl),
                          const SizedBox(width: 4),
                          Text(tech.price, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFF00A63E)), textDirection: TextDirection.rtl),
                        ],
                      ),
                      const SizedBox(height: 4),
                      if (tech.isVerified)
                        Row(
                          textDirection: TextDirection.rtl,
                          children: [
                            const Icon(Icons.verified, color: Color(0xFF00A63E), size: 14),
                            const SizedBox(width: 4),
                            Text('موثق', style: TextStyle(fontSize: 12, color: Colors.grey[600]), textDirection: TextDirection.rtl),
                          ],
                        ),
                      const SizedBox(height: 4),
                      Text(tech.specialty, style: TextStyle(fontSize: 12, color: Colors.grey[600]), textDirection: TextDirection.rtl),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            // Stats Row: Rating + Reviews + Services
            Row(
              textDirection: TextDirection.rtl,
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 16),
                const SizedBox(width: 2),
                Text('${tech.rating}', style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                const SizedBox(width: 4),
                Text('(${tech.reviews})', style: TextStyle(fontSize: 12, color: Colors.grey[500])),
                const SizedBox(width: 8),
                Text('•', style: TextStyle(color: Colors.grey[400])),
                const SizedBox(width: 8),
                Text('${tech.services} خدمة', style: TextStyle(fontSize: 12, color: Colors.grey[600])),
              ],
            ),
            const SizedBox(height: 8),
            // Location
            Row(
              textDirection: TextDirection.rtl,
              children: [
                Icon(Icons.location_on_outlined, size: 14, color: Colors.grey[500]),
                const SizedBox(width: 4),
                Text(tech.location, style: TextStyle(fontSize: 12, color: Colors.grey[600]), textDirection: TextDirection.rtl),
              ],
            ),
            const SizedBox(height: 8),
            // Bottom Row: Response time + Badge + Online indicator
            Row(
              textDirection: TextDirection.rtl,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Response time
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: tech.isOnline ? const Color(0xFF00A63E).withOpacity(0.1) : Colors.grey[100],
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    tech.responseTime,
                    style: TextStyle(fontSize: 11, color: tech.isOnline ? const Color(0xFF00A63E) : Colors.grey[600]),
                    textDirection: TextDirection.rtl,
                  ),
                ),
                Row(
                  children: [
                    if (tech.badge.isNotEmpty)
                      Text(tech.badge, style: TextStyle(fontSize: 11, color: tech.badgeColor, fontWeight: FontWeight.bold)),
                    const SizedBox(width: 8),
                    // Online circle
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: tech.isOnline ? const Color(0xFF00A63E) : Colors.grey,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
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
