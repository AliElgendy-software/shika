import 'package:flutter/material.dart';
import 'provider_profile_setup_screen.dart';

class ProviderOnboardingScreen extends StatefulWidget {
  const ProviderOnboardingScreen({super.key});

  @override
  State<ProviderOnboardingScreen> createState() =>
      _ProviderOnboardingScreenState();
}

class _ProviderOnboardingScreenState extends State<ProviderOnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<_OnboardingPageData> _pages = const [
    _OnboardingPageData(
      title: 'ارفع مهاراتك وقدّم خدماتك\nبسهولة',
      description:
          'انضم لمنصتنا واعرض خدماتك لآلاف العملاء في جميع\nأنحاء مصر',
      iconContent: Text('🚀', style: TextStyle(fontSize: 50)),
      iconBgColor: Color(0xFFE5F7EB),
    ),
    _OnboardingPageData(
      title: 'استقبل طلبات جديدة في أي وقت',
      description:
          'تلقي إشعارات فورية بالطلبات الجديدة وتحكم في قبولها أو رفضها',
      iconContent: Icon(Icons.smartphone_outlined, size: 50, color: Color(0xFF287D3C)),
      iconBgColor: Color(0xFFE8F1FF),
    ),
    _OnboardingPageData(
      title: 'تابع أرباحك وتقييماتك',
      description:
          'اطلع على إحصائيات دقيقة لأرباحك وتقييمات عملائك بشكل مستمر',
      iconContent: Icon(Icons.attach_money, size: 50, color: Color(0xFF287D3C)),
      iconBgColor: Color(0xFFFFF3D6),
    ),
  ];

  void _goToPage(int index) {
    if (index < 0 || index >= _pages.length) return;
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _finishOnboarding() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const ProviderProfileSetupScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const SizedBox.shrink(), // No back button needed in onboarding
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: _pages.length,
              onPageChanged: (index) {
                setState(() => _currentPage = index);
              },
              itemBuilder: (context, index) {
                final data = _pages[index];
                return _buildPage(data);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: Column(
              children: [
                _buildPageIndicator(),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_currentPage == _pages.length - 1) {
                        _finishOnboarding();
                      } else {
                        _goToPage(_currentPage + 1);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF287D3C),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      textDirection: TextDirection.rtl,
                      children: [
                        Text(
                          _currentPage == _pages.length - 1
                              ? 'ابدأ الآن'
                              : 'التالي',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        if (_currentPage < _pages.length - 1) ...[
                          const SizedBox(width: 8),
                          const Icon(Icons.chevron_left, color: Colors.white, size: 20),
                        ],
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: _finishOnboarding,
                  child: const Text(
                    'تخطي',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 16), // Bottom padding
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPage(_OnboardingPageData data) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 140,
            height: 140,
            decoration: BoxDecoration(
              color: data.iconBgColor,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: data.iconContent,
          ),
          const SizedBox(height: 48),
          Text(
            data.title,
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w900,
              color: Color(0xFF1F2937),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            data.description,
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF6B7280),
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      textDirection: TextDirection.rtl, // RTL layout for dot positioning
      children: List.generate(_pages.length, (index) {
        final bool isActive = index == _currentPage;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: isActive ? 24 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: isActive ? const Color(0xFF287D3C) : Colors.grey[300],
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }),
    );
  }
}

class _OnboardingPageData {
  final String title;
  final String description;
  final Widget iconContent;
  final Color iconBgColor;

  const _OnboardingPageData({
    required this.title,
    required this.description,
    required this.iconContent,
    required this.iconBgColor,
  });
}


