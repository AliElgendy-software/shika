import 'package:flutter/material.dart';
import 'search_results_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String selectedCategory = 'الكل';
  bool _showFilters = false;
  final List<String> recentSearches = [
    'سباكة',
    'كهرباء',
    'نظافة',
    'صيانة تكييف',
  ];
  final List<String> mostSearched = [
    'تركيب سخان',
    'كشف تسربات',
    'صيانة غسالة',
    'دهان شقة',
    'تنظيف عميق',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            textDirection: TextDirection.rtl,
            children: [
              // Search Bar Area
              Row(
                textDirection: TextDirection.rtl,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_forward), // Right-pointing arrow for RTL back
                    onPressed: () => Navigator.pop(context),
                  ),
                  Expanded(
                    child: Container(
                      height: 48,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(color: Colors.grey[200]!),
                      ),
                      child: TextField(
                        textDirection: TextDirection.rtl,
                        decoration: InputDecoration(
                          hintText: 'ابحث عن خدمة أو مقدم خدمة...',
                          hintStyle: TextStyle(color: Colors.grey[400], fontSize: 13),
                          prefixIcon: Icon(Icons.search, color: Colors.grey[400]),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        ),
                        onSubmitted: (value) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SearchResultsScreen(searchQuery: value),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _showFilters = !_showFilters;
                      });
                    },
                    child: Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: _showFilters ? const Color(0xFF00A63E) : Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey[200]!),
                      ),
                      child: Icon(
                        Icons.tune,
                        color: _showFilters ? Colors.white : Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Filter Categories (Horizontal List)
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                reverse: true, // RTL
                child: Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    _buildCategoryChip('الكل'),
                    _buildCategoryChip('سباكة', icon: Icons.plumbing),
                    _buildCategoryChip('كهرباء', icon: Icons.bolt),
                    _buildCategoryChip('نظافة', icon: Icons.cleaning_services),
                    _buildCategoryChip('تكييف', icon: Icons.ac_unit),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              // Filters Section
              if (_showFilters) ...[
                const Text(
                  'نطاق السعر (جنيه)',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  textDirection: TextDirection.rtl,
                ),
                const SizedBox(height: 12),
                Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    Expanded(
                      child: _buildPriceField('0'),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text('-', style: TextStyle(color: Colors.grey)),
                    ),
                    Expanded(
                      child: _buildPriceField('1000'),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                const Text(
                  'التقييم الأدنى',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  textDirection: TextDirection.rtl,
                ),
                const SizedBox(height: 12),
                Row(
                  textDirection: TextDirection.rtl,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: _buildRatingChip('الكل', isSelected: true)),
                    const SizedBox(width: 8),
                    Expanded(child: _buildRatingChip('3+')),
                    const SizedBox(width: 8),
                    Expanded(child: _buildRatingChip('4+')),
                    const SizedBox(width: 8),
                    Expanded(child: _buildRatingChip('4.5+')),
                  ],
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _showFilters = false;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00A63E),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: const Text('تطبيق الفلاتر', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                ),
                const SizedBox(height: 24),
                Divider(color: Colors.grey[200]),
                const SizedBox(height: 16),
              ],
              // Recent Searches
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                textDirection: TextDirection.rtl,
                children: [
                  Row(
                    textDirection: TextDirection.rtl,
                    children: [
                      const Icon(Icons.access_time, size: 18, color: Colors.black87),
                      const SizedBox(width: 8),
                      const Text(
                        'عمليات البحث الأخيرة',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black87),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        recentSearches.clear();
                      });
                    },
                    child: const Text('مسح الكل', style: TextStyle(color: Color(0xFF00A63E), fontSize: 13, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                textDirection: TextDirection.rtl,
                children: recentSearches.map((search) {
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey[200]!),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      textDirection: TextDirection.rtl,
                      children: [
                        Text(search, style: TextStyle(fontSize: 13, color: Colors.grey[700])),
                        const SizedBox(width: 6),
                        Icon(Icons.close, size: 16, color: Colors.grey[500]),
                      ],
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 32),
              // Most Searched
              Row(
                textDirection: TextDirection.rtl,
                children: [
                  const Icon(Icons.show_chart, size: 18, color: Colors.black87),
                  const SizedBox(width: 8),
                  const Text(
                    'الأكثر بحثاً',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black87),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ...mostSearched.asMap().entries.map((entry) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchResultsScreen(searchQuery: entry.value),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    margin: const EdgeInsets.only(bottom: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey[200]!),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      textDirection: TextDirection.rtl,
                      children: [
                        Row(
                          textDirection: TextDirection.rtl,
                          children: [
                            Text(
                              '#${entry.key + 1}',
                              style: const TextStyle(color: Color(0xFF00A63E), fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                            const SizedBox(width: 16),
                            Text(
                              entry.value,
                              style: const TextStyle(fontSize: 14, color: Colors.black87, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Icon(Icons.arrow_back, color: Colors.grey[400], size: 18),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryChip(String label, {IconData? icon}) {
    final isSelected = selectedCategory == label;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = label;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(left: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF00A63E) : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: isSelected ? const Color(0xFF00A63E) : Colors.grey[200]!),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          textDirection: TextDirection.rtl,
          children: [
            if (icon != null) ...[
              Icon(icon, size: 16, color: isSelected ? Colors.white : Colors.grey[600]),
              const SizedBox(width: 6),
            ],
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.grey[800],
                fontSize: 13,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceField(String hint) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: TextField(
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        ),
      ),
    );
  }

  Widget _buildRatingChip(String label, {bool isSelected = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF00A63E) : Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: isSelected ? const Color(0xFF00A63E) : Colors.grey[200]!),
      ),
      alignment: Alignment.center,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        textDirection: TextDirection.rtl,
        children: [
          if (label != 'الكل') ...[
            Text(label, style: TextStyle(color: isSelected ? Colors.white : Colors.black87, fontSize: 13, fontWeight: FontWeight.bold)),
            const SizedBox(width: 4),
            Icon(Icons.star, size: 14, color: isSelected ? Colors.white : Colors.amber),
          ] else ...[
            Text(label, style: TextStyle(color: isSelected ? Colors.white : Colors.black87, fontSize: 13, fontWeight: FontWeight.bold)),
          ],
        ],
      ),
    );
  }
}
