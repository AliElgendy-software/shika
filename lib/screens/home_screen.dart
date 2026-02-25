import 'package:flutter/material.dart';
import '../widgets/service_provider_card.dart';
import '../widgets/category_item.dart';
import 'addresses_screen.dart';
import 'search_screen.dart';
import 'orders_screen.dart';
import 'messages_screen.dart';
import 'profile_screen.dart';
import 'faq_screen.dart';
import 'contact_us_screen.dart';
import 'rate_app_screen.dart';
import 'about_app_screen.dart';
import 'login_screen.dart';
import 'favorites_screen.dart';
import 'wallet_screen.dart';
import 'refer_and_earn_screen.dart';
import 'technicians_list_screen.dart';
import 'services_list_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 3; // Home is selected by default

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // مطابق لقيمة #F9FAFB من التصميم
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            // تدرج أفقي 90 درجة: #00A63E → #009966
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color(0xFF00A63E),
                Color(0xFF009966),
              ],
            ),
          ),
        ),
        elevation: 0,
        toolbarHeight: 72,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.menu, color: Colors.white, size: 20),
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
            padding: EdgeInsets.zero,
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.white, size: 18),
                      SizedBox(width: 4),
                      Text(
                        'القاهرة، مصر',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'الخدمات المنزلية',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Stack(
              children: [
                IconButton(
                  icon: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.notifications, color: Colors.white, size: 20),
                  ),
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                ),
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    spreadRadius: 0,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: TextField(
                textDirection: TextDirection.rtl,
                decoration: const InputDecoration(
                  hintText: 'ابحث عن خدمة',
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SearchScreen()),
                  );
                },
              ),
            ),
          ),
        ),
      ),
      drawer: _buildDrawer(),
      body: _selectedIndex == 3 ? _buildHomeContent() : _buildOtherScreens(),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          selectedItemColor: const Color(0xFF00A63E),
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.transparent,
          elevation: 0,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 12,
          ),
          items: [
            BottomNavigationBarItem(
              icon: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: _selectedIndex == 0 
                      ? const Color(0xFF00A63E).withOpacity(0.1)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.person),
              ),
              label: 'الحساب',
            ),
            BottomNavigationBarItem(
              icon: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: _selectedIndex == 1 
                      ? const Color(0xFF00A63E).withOpacity(0.1)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.chat_bubble_outline),
              ),
              label: 'الرسائل',
            ),
            BottomNavigationBarItem(
              icon: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: _selectedIndex == 2 
                      ? const Color(0xFF00A63E).withOpacity(0.1)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.shopping_bag_outlined),
              ),
              label: 'الطلبات',
            ),
            BottomNavigationBarItem(
              icon: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: _selectedIndex == 3 
                      ? const Color(0xFF00A63E).withOpacity(0.1)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.home),
              ),
              label: 'الرئيسية',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHomeContent() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // Categories Section
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'الفئات',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textDirection: TextDirection.rtl,
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    CategoryItem(
                      icon: Icons.auto_awesome,
                      label: 'تنظيف شامل',
                      color: const Color(0xFF81C784), // أخضر فاتح
                    ),
                    CategoryItem(
                      icon: Icons.format_paint,
                      label: 'دهان',
                      color: const Color(0xFFBA68C8), // بنفسجي فاتح
                    ),
                    CategoryItem(
                      icon: Icons.bolt,
                      label: 'كهرباء',
                      color: const Color(0xFFFFB74D), // برتقالي فاتح
                    ),
                    CategoryItem(
                      icon: Icons.build,
                      label: 'سباكة',
                      color: const Color(0xFF64B5F6), // أزرق فاتح
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Best Service Providers Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'أفضل مقدمي الخدمة',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textDirection: TextDirection.rtl,
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'عرض الكل',
                    style: TextStyle(
                      color: Color(0xFF00A63E),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),

          // Service Provider Cards - Vertical List
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                ServiceProviderCard(
                  name: 'عبد الرحمن نصر',
                  service: 'سباكة',
                  price: '150 ج.م / ساعة',
                  rating: 5.0,
                  reviews: 120,
                  hasHotOffer: true,
                ),
                SizedBox(height: 12),
                ServiceProviderCard(
                  name: 'سارة محمد',
                  service: 'تنظيف',
                  price: '180 ج.م / ساعة',
                  rating: 4.0,
                  reviews: 95,
                  hasHotOffer: false,
                ),
                SizedBox(height: 12),
                ServiceProviderCard(
                  name: 'عبد الرحمن نصر',
                  service: 'كهرباء',
                  price: '200 ج.م / ساعة',
                  rating: 5.0,
                  reviews: 150,
                  hasHotOffer: false,
                ),
              ],
            ),
          ),

          const SizedBox(height: 80), // Space for bottom navigation
        ],
      ),
    );
  }

  Widget _buildCategoryChip(String label, String emoji, bool isSelected) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 8),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ServicesListScreen()),
          );
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF00A63E) : Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: isSelected ? const Color(0xFF00A63E) : Colors.grey[300]!,
            ),
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

  Widget _buildOtherScreens() {
    if (_selectedIndex == 0) {
      return const ProfileScreen();
    } else if (_selectedIndex == 1) {
      return const MessagesScreen();
    } else if (_selectedIndex == 2) {
      return OrdersScreen(
        onBackPressed: () {
          setState(() {
            _selectedIndex = 3; // العودة إلى الصفحة الرئيسية
          });
        },
      );
    }
    return _buildHomeContent();
  }

  Widget _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 120,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF00A63E),
                  Color(0xFF008236),
                  Color(0xFF006045),
                ],
              ),
            ),
            child: const Center(
              child: Text(
                'الخدمات المنزلية',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          _buildDrawerItem(
            icon: Icons.location_on,
            title: 'العناوين المحفوظة',
            iconColor: const Color(0xFF16A34A), // أخضر
            useCircleIcon: true,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddressesScreen()),
              );
            },
          ),
          _buildDrawerItem(
            icon: Icons.history,
            title: 'الطلبات السابقة',
            iconColor: const Color(0xFF1D4ED8), // أزرق
            useCircleIcon: true,
            onTap: () {
              Navigator.pop(context);
              setState(() {
                _selectedIndex = 2;
              });
            },
          ),
          _buildDrawerItem(
            icon: Icons.favorite,
            title: 'المفضلة',
            iconColor: const Color(0xFFEF4444), // أحمر
            useCircleIcon: true,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FavoritesScreen()),
              );
            },
          ),
          _buildDrawerItem(
            icon: Icons.account_balance_wallet,
            title: 'المحفظة',
            iconColor: const Color(0xFF0EA5E9),
            useCircleIcon: true,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const WalletScreen()),
              );
            },
          ),
          _buildDrawerItem(
            icon: Icons.card_giftcard,
            title: 'ادعُ واكسب',
            iconColor: const Color(0xFFF97316),
            useCircleIcon: true,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ReferAndEarnScreen()),
              );
            },
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'المساعدة والدعم',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Color(0xFF98A2B3), // رمادي فاتح زي التصميم
              ),
              textDirection: TextDirection.rtl,
            ),
          ),
          _buildDrawerItem(
            icon: Icons.help_outline,
            title: 'الأسئلة الشائعة',
            iconColor: const Color(0xFFA855F7), // بنفسجي
            useCircleIcon: true,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FAQScreen()),
              );
            },
          ),
          _buildDrawerItem(
            icon: Icons.phone,
            title: 'تواصل معنا',
            iconColor: const Color(0xFF16A34A), // أخضر
            useCircleIcon: true,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ContactUsScreen()),
              );
            },
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'إضافات',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Color(0xFF98A2B3),
              ),
              textDirection: TextDirection.rtl,
            ),
          ),
          _buildDrawerItem(
            icon: Icons.star,
            title: 'تقييم التطبيق',
            iconColor: const Color(0xFFF59E0B), // برتقالي
            useCircleIcon: true,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RateAppScreen()),
              );
            },
          ),
          _buildDrawerItem(
            icon: Icons.share,
            title: 'مشاركة التطبيق',
            iconColor: const Color(0xFF2563EB), // أزرق
            useCircleIcon: true,
            onTap: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('سيتم تفعيل المشاركة قريباً')),
              );
            },
          ),
          _buildDrawerItem(
            icon: Icons.info,
            title: 'حول التطبيق',
            iconColor: Colors.grey, // رمادي
            useCircleIcon: true,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutAppScreen()),
              );
            },
          ),
          const Divider(),
          _buildDrawerItem(
            icon: Icons.logout,
            title: 'تسجيل خروج',
            onTap: () {
              Navigator.pop(context);
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
                (route) => false,
              );
            },
            textColor: Colors.red,
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color? textColor,
    Color? iconColor,
    bool useCircleIcon = false,
  }) {
    final Color effectiveIconColor =
        iconColor ?? textColor ?? const Color(0xFF4B5563); // رمادي غامق

    return ListTile(
      leading: useCircleIcon
          ? Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: effectiveIconColor, width: 1.8),
              ),
              child: Icon(
                icon,
                color: effectiveIconColor,
                size: 18,
              ),
            )
          : Icon(icon, color: effectiveIconColor),
      title: Text(
        title,
        textDirection: TextDirection.rtl,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: textColor ?? const Color(0xFF101828),
        ),
      ),
      onTap: onTap,
    );
  }
}
