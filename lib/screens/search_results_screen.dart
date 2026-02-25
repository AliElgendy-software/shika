import 'package:flutter/material.dart';
import 'service_details_screen.dart';

class SearchResultsScreen extends StatefulWidget {
  final String? searchQuery;

  const SearchResultsScreen({super.key, this.searchQuery});

  @override
  State<SearchResultsScreen> createState() => _SearchResultsScreenState();
}

class _SearchResultsScreenState extends State<SearchResultsScreen> {
  String selectedCategory = 'الكل';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      body: SafeArea(
        child: Column(
          children: [
            // Top Search Bar (matches SearchScreen)
            Container(
              padding: const EdgeInsets.all(16),
              color: const Color(0xFFF7F8FA),
              child: Column(
                children: [
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
                            controller: TextEditingController(text: widget.searchQuery),
                            decoration: InputDecoration(
                              hintText: 'ابحث عن خدمة أو مقدم خدمة...',
                              hintStyle: TextStyle(color: Colors.grey[400], fontSize: 13),
                              prefixIcon: Icon(Icons.search, color: Colors.grey[400]),
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey[200]!),
                        ),
                        child: const Icon(
                          Icons.tune,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
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
                ],
              ),
            ),
            // Results Section
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  textDirection: TextDirection.rtl,
                  children: [
                    Text(
                      '1 نتيجة للبحث عن "${widget.searchQuery ?? ''}"',
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      textDirection: TextDirection.rtl,
                    ),
                    const SizedBox(height: 16),
                    _buildServiceCard(
                      context,
                      title: 'تركيب سخان كهربائي',
                      providerName: 'محمد علي',
                      rating: 4.5,
                      reviews: 89,
                      location: 'مدينة نصر',
                      price: '200 جنيه',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ServiceDetailsScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
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
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
              Icon(icon, size: 16, color: isSelected ? Colors.white : Colors.grey[500]),
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

  Widget _buildServiceCard(
    BuildContext context, {
    required String title,
    required String providerName,
    required double rating,
    required int reviews,
    required String location,
    required String price,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey[200]!),
        ),
        child: Row(
          textDirection: TextDirection.rtl,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                textDirection: TextDirection.rtl,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
                    textDirection: TextDirection.rtl,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    providerName,
                    style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                    textDirection: TextDirection.rtl,
                  ),
                  const SizedBox(height: 12),
                  Row(
                    textDirection: TextDirection.rtl,
                    children: [
                      const Icon(Icons.location_on_outlined, color: Colors.grey, size: 16),
                      const SizedBox(width: 4),
                      Text(location, style: TextStyle(fontSize: 12, color: Colors.grey[600]), textDirection: TextDirection.rtl),
                      const SizedBox(width: 12),
                      const Icon(Icons.star, color: Colors.amber, size: 16),
                      const SizedBox(width: 4),
                      Text('$rating ($reviews)', style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    price,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF00A63E)),
                    textDirection: TextDirection.rtl,
                  ),
                ],
              ),
            ),
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: const Color(0xFFF0FDF4),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.build, color: Color(0xFF00A63E), size: 32),
            ),
          ],
        ),
      ),
    );
  }
}
