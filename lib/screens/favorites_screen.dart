import 'package:flutter/material.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  int _selectedTab = 0; // 0 = Services, 1 = Technicians

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: const Color(0xFF00A63E),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Row(
          children: [
            Icon(Icons.favorite, color: Colors.white),
            SizedBox(width: 8),
            Text(
              'المفضلة',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_forward, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Tabs
          Container(
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Expanded(
                  child: _buildTab('الخدمات', 0),
                ),
                Expanded(
                  child: _buildTab('الفنيين', 1),
                ),
              ],
            ),
          ),
          // Content
          Expanded(
            child: _selectedTab == 0 ? _buildServicesTab() : _buildTechniciansTab(),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(String label, int index) {
    final isSelected = _selectedTab == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTab = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF00A63E) : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey[700],
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            fontSize: 16,
          ),
          textDirection: TextDirection.rtl,
        ),
      ),
    );
  }

  Widget _buildServicesTab() {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      children: [
        _buildServiceCard(
          icon: Icons.plumbing,
          iconColor: Colors.blue,
          title: 'سباكة',
          subtitle: '15 فني متاح',
        ),
        const SizedBox(height: 12),
        _buildServiceCard(
          icon: Icons.cleaning_services,
          iconColor: Colors.green,
          title: 'تنظيف',
          subtitle: '23 فني متاح',
        ),
        const SizedBox(height: 12),
        _buildServiceCard(
          icon: Icons.bolt,
          iconColor: Colors.amber,
          title: 'كهرباء',
          subtitle: '12 فني متاح',
        ),
      ],
    );
  }

  Widget _buildTechniciansTab() {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      children: [
        _buildTechnicianCard(
          name: 'عبد الرحمن نصر',
          service: 'سباكة',
          price: '150 ج.م /ساعة',
          rating: 5.0,
          reviews: 120,
        ),
        const SizedBox(height: 12),
        _buildTechnicianCard(
          name: 'سارة محمد',
          service: 'تنظيف',
          price: '180 ج.م /ساعة',
          rating: 4.8,
          reviews: 95,
        ),
        const SizedBox(height: 12),
        _buildTechnicianCard(
          name: 'خالد علي',
          service: 'كهرباء',
          price: '200 ج.م /ساعة',
          rating: 5.0,
          reviews: 150,
        ),
      ],
    );
  }

  Widget _buildServiceCard({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.favorite, color: Colors.red),
            onPressed: () {},
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textDirection: TextDirection.rtl,
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                  textDirection: TextDirection.rtl,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: iconColor, size: 32),
          ),
        ],
      ),
    );
  }

  Widget _buildTechnicianCard({
    required String name,
    required String service,
    required String price,
    required double rating,
    required int reviews,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: () {},
          ),
          const CircleAvatar(
            radius: 30,
            backgroundColor: Color(0xFF00A63E),
            child: Icon(Icons.person, color: Colors.white),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  textDirection: TextDirection.rtl,
                ),
                const SizedBox(height: 4),
                Text(
                  service,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                  textDirection: TextDirection.rtl,
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 16),
                        const SizedBox(width: 4),
                        Text(
                          '$rating ($reviews)',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                    Text(
                      price,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF00A63E),
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

