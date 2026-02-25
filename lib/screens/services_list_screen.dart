import 'package:flutter/material.dart';
import 'technicians_list_screen.dart';

class ServicesListScreen extends StatefulWidget {
  const ServicesListScreen({super.key});

  @override
  State<ServicesListScreen> createState() => _ServicesListScreenState();
}

class _ServicesListScreenState extends State<ServicesListScreen> {
  String _selectedCategory = 'الكل';
  String _sortBy = 'الأكثر طلباً';

  final List<Map<String, String>> _categories = [
    {'label': 'الكل', 'icon': '👥'},
    {'label': 'سباكة', 'icon': '🔧'},
    {'label': 'كهرباء', 'icon': '⚡'},
    {'label': 'نظافة', 'icon': '🧹'},
    {'label': 'تكييف', 'icon': '❄️'},
    {'label': 'دهان', 'icon': '🎨'},
    {'label': 'نجارة', 'icon': '🪚'},
  ];

  final List<_ServiceData> _allServices = [
    _ServiceData(
      title: 'سباكة منزلية',
      description: 'تسليك مجاري، إصلاح تسريبات، تركيب خلاطات',
      price: '150 جنيه',
      icon: Icons.plumbing,
      iconColor: const Color(0xFF00A63E),
      bgColor: const Color(0xFF00A63E),
      rating: 4.8,
      techCount: 45,
      category: 'سباكة',
    ),
    _ServiceData(
      title: 'كهرباء منازل',
      description: 'تركيب نجف، صيانة دوائر، مفاتيح وبرايز',
      price: '120 جنيه',
      icon: Icons.bolt,
      iconColor: const Color(0xFF00A63E),
      bgColor: const Color(0xFF00A63E),
      rating: 4.9,
      techCount: 38,
      category: 'كهرباء',
    ),
    _ServiceData(
      title: 'صيانة تكييف',
      description: 'تنظيف، صيانة دورية، إصلاح أعطال',
      price: '200 جنيه',
      icon: Icons.ac_unit,
      iconColor: const Color(0xFF1D4ED8),
      bgColor: const Color(0xFF1D4ED8),
      rating: 4.7,
      techCount: 32,
      category: 'تكييف',
    ),
    _ServiceData(
      title: 'تنظيف شامل',
      description: 'تنظيف منازل، شقق، فلل بالكامل',
      price: '300 جنيه',
      icon: Icons.cleaning_services,
      iconColor: const Color(0xFF00A63E),
      bgColor: const Color(0xFF00A63E),
      rating: 4.6,
      techCount: 56,
      category: 'نظافة',
    ),
    _ServiceData(
      title: 'نجارة',
      description: 'تصليح أثاث، تجميع، أبواب وشبابيك',
      price: '180 جنيه',
      icon: Icons.carpenter,
      iconColor: const Color(0xFF92400E),
      bgColor: const Color(0xFF92400E),
      rating: 4.5,
      techCount: 28,
      category: 'نجارة',
    ),
    _ServiceData(
      title: 'دهانات',
      description: 'دهان حوائط، ديكورات، ترميمات',
      price: '250 جنيه',
      icon: Icons.format_paint,
      iconColor: const Color(0xFF7C3AED),
      bgColor: const Color(0xFF7C3AED),
      rating: 4.7,
      techCount: 35,
      category: 'دهان',
    ),
  ];

  List<_ServiceData> get _filteredServices {
    if (_selectedCategory == 'الكل') return _allServices;
    return _allServices.where((s) => s.category == _selectedCategory).toList();
  }

  @override
  Widget build(BuildContext context) {
    final filtered = _filteredServices;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          // Green Header
          Container(
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF00A63E), Color(0xFF008236)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              children: [
                // Top bar with back arrow
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_forward, color: Colors.white),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                ),
                // Title
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    'كل خدمات البيت في مكان واحد',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    'اختر الخدمة المناسبة واحجز فني محترف في دقائق',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.85),
                      fontSize: 14,
                    ),
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 16),
                // Search bar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const TextField(
                      textDirection: TextDirection.rtl,
                      decoration: InputDecoration(
                        hintText: 'ابحث عن خدمة...',
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                        suffixIcon: Icon(Icons.search, color: Colors.grey),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),

          // Category Filter Chips
          Container(
            color: Colors.white,
            padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                textDirection: TextDirection.rtl,
                children: _categories.map((cat) => _buildCategoryChip(cat['label']!, cat['icon']!)).toList(),
              ),
            ),
          ),

          // Section header
          Container(
            color: Colors.white,
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
            child: Row(
              textDirection: TextDirection.rtl,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  textDirection: TextDirection.rtl,
                  children: [
                    const Text(
                      'الخدمات المتاحة',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      textDirection: TextDirection.rtl,
                    ),
                    Text(
                      'جميع الخدمات (${filtered.length})',
                      style: TextStyle(fontSize: 12, color: Colors.grey[500]),
                      textDirection: TextDirection.rtl,
                    ),
                  ],
                ),
                // Sort dropdown
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[300]!),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.keyboard_arrow_down, size: 18, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(_sortBy, style: const TextStyle(fontSize: 12), textDirection: TextDirection.rtl),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 4),

          // Services Grid
          Expanded(
            child: filtered.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.search_off, size: 64, color: Colors.grey[300]),
                        const SizedBox(height: 16),
                        Text(
                          'لا توجد خدمات في هذا التخصص',
                          style: TextStyle(fontSize: 16, color: Colors.grey[500]),
                          textDirection: TextDirection.rtl,
                        ),
                      ],
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: GridView.builder(
                      padding: const EdgeInsets.only(top: 8, bottom: 24),
                      itemCount: filtered.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        childAspectRatio: 0.72,
                      ),
                      itemBuilder: (context, index) {
                        return _buildServiceCard(filtered[index]);
                      },
                    ),
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

  Widget _buildServiceCard(_ServiceData data) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          textDirection: TextDirection.rtl,
          children: [
            // Icon
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: data.bgColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(data.icon, color: data.iconColor, size: 24),
            ),
            const SizedBox(height: 10),
            // Title
            Text(
              data.title,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              textDirection: TextDirection.rtl,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            // Description
            Text(
              data.description,
              style: TextStyle(fontSize: 11, color: Colors.grey[600], height: 1.3),
              textDirection: TextDirection.rtl,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const Spacer(),
            // Rating + Tech count row
            Row(
              textDirection: TextDirection.rtl,
              children: [
                Text('${data.techCount} فني', style: TextStyle(fontSize: 11, color: Colors.grey[500])),
                const Spacer(),
                const Icon(Icons.star, color: Colors.amber, size: 14),
                const SizedBox(width: 2),
                Text('${data.rating}', style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 6),
            // Price
            Text(
              'يبدأ من   ${data.price}',
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF00A63E)),
              textDirection: TextDirection.rtl,
            ),
            const SizedBox(height: 8),
            // Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const TechniciansListScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00A63E),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  elevation: 0,
                ),
                child: const Text('عرض الفنيين', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ServiceData {
  final String title;
  final String description;
  final String price;
  final IconData icon;
  final Color iconColor;
  final Color bgColor;
  final double rating;
  final int techCount;
  final String category;

  _ServiceData({
    required this.title,
    required this.description,
    required this.price,
    required this.icon,
    required this.iconColor,
    required this.bgColor,
    required this.rating,
    required this.techCount,
    required this.category,
  });
}
