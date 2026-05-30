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
      backgroundColor: const Color(0xFFF7F8FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF7F8FA),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'جميع الفئات',
          style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_forward, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                child: Text(
                  'اختر الفئة للعثور على مقدمي الخدمة المناسبين',
                  style: TextStyle(color: Colors.grey[600], fontSize: 13),
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  itemCount: filtered.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 0.9,
                  ),
                  itemBuilder: (context, index) {
                    return _buildServiceCard(filtered[index]);
                  },
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
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TechniciansListScreen()),
            );
          },
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              textDirection: TextDirection.rtl,
              children: [
                // Top row: Icon box
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: const Color(0xFF00A63E),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(data.icon, color: Colors.white, size: 18),
                  ),
                ),
                const SizedBox(height: 6),
                // Title
                Text(
                  data.category,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  textDirection: TextDirection.rtl,
                ),
                const SizedBox(height: 1),
                // Description
                Text(
                  data.description,
                  style: TextStyle(fontSize: 11, color: Colors.grey[500], height: 1.1),
                  textDirection: TextDirection.rtl,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const Spacer(),
                // Bottom row: Tech count + Arrow
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  textDirection: TextDirection.rtl,
                  children: [
                    Text(
                      '${data.techCount} فني',
                      style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Color(0xFF00A63E)),
                      textDirection: TextDirection.rtl,
                    ),
                    Container(
                      width: 20,
                      height: 20,
                      decoration: const BoxDecoration(
                        color: Color(0xFF00A63E),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.arrow_forward, color: Colors.white, size: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
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
