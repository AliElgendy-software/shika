import 'package:flutter/material.dart';
import 'provider_working_hours_screen.dart';

class ProviderProfileSetupScreen extends StatefulWidget {
  const ProviderProfileSetupScreen({super.key});

  @override
  State<ProviderProfileSetupScreen> createState() =>
      _ProviderProfileSetupScreenState();
}

class _ProviderProfileSetupScreenState
    extends State<ProviderProfileSetupScreen> {
  final TextEditingController _mainSpecialityController =
      TextEditingController();
  final TextEditingController _skillController = TextEditingController();
  final TextEditingController _hourPriceController = TextEditingController();
  final TextEditingController _areaController = TextEditingController();

  final List<String> _skills = [];
  final List<String> _areas = [];

  @override
  void dispose() {
    _mainSpecialityController.dispose();
    _skillController.dispose();
    _hourPriceController.dispose();
    _areaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                'إعداد ملفك الشخصي',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textDirection: TextDirection.rtl,
              ),
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'أكمل بياناتك لتبدأ استقبال الطلبات',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
                textDirection: TextDirection.rtl,
              ),
            ),
            const SizedBox(height: 32),
            _buildLabeledField(
              label: 'الصورة الشخصية',
              child: _buildAvatar(),
            ),
            const SizedBox(height: 24),
            _buildLabeledField(
              label: 'التخصص الرئيسي',
              child: _buildTextField(
                controller: _mainSpecialityController,
                hint: 'أدخل تخصصك الرئيسي',
              ),
            ),
            const SizedBox(height: 16),
            _buildLabeledField(
              label: 'المهارات',
              child: Row(
                children: [
                  Expanded(
                    child: _buildTextField(
                      controller: _skillController,
                      hint: 'أضف مهارة',
                    ),
                  ),
                  const SizedBox(width: 8),
                  _buildIconAddButton(onTap: _addSkill),
                ],
              ),
            ),
            if (_skills.isNotEmpty) ...[
              const SizedBox(height: 8),
              Wrap(
                spacing: 6,
                runSpacing: -4,
                children: _skills
                    .map(
                      (s) => Chip(
                        label: Text(
                          s,
                          textDirection: TextDirection.rtl,
                        ),
                        deleteIcon: const Icon(Icons.close, size: 16),
                        onDeleted: () {
                          setState(() {
                            _skills.remove(s);
                          });
                        },
                      ),
                    )
                    .toList(),
              ),
            ],
            const SizedBox(height: 16),
            _buildLabeledField(
              label: 'السعر المبدئي للساعة',
              child: _buildTextField(
                controller: _hourPriceController,
                hint: 'مثال: 100',
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(height: 16),
            _buildLabeledField(
              label: 'المناطق المغطاة',
              child: Row(
                children: [
                  Expanded(
                    child: _buildTextField(
                      controller: _areaController,
                      hint: 'أضف منطقة (مثال: المعادي، القاهرة)',
                    ),
                  ),
                  const SizedBox(width: 8),
                  _buildIconAddButton(onTap: _addArea),
                ],
              ),
            ),
            if (_areas.isNotEmpty) ...[
              const SizedBox(height: 8),
              Wrap(
                spacing: 6,
                runSpacing: -4,
                children: _areas
                    .map(
                      (a) => Chip(
                        label: Text(
                          a,
                          textDirection: TextDirection.rtl,
                        ),
                        deleteIcon: const Icon(Icons.close, size: 16),
                        onDeleted: () {
                          setState(() {
                            _areas.remove(a);
                          });
                        },
                      ),
                    )
                    .toList(),
              ),
            ],
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProviderWorkingHoursScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00A63E),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'حفظ واستمرار',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatar() {
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[200],
            ),
            child: Icon(
              Icons.camera_alt_outlined,
              size: 40,
              color: Colors.grey[400],
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: 32,
              height: 32,
              decoration: const BoxDecoration(
                color: Color(0xFF00A63E),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.camera_alt,
                color: Colors.white,
                size: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLabeledField({
    required String label,
    required Widget child,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
            textDirection: TextDirection.rtl,
          ),
        ),
        const SizedBox(height: 8),
        child,
      ],
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    TextInputType? keyboardType,
  }) {
    return TextField(
      controller: controller,
      textDirection: TextDirection.rtl,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hint,
        hintTextDirection: TextDirection.rtl,
        hintStyle: TextStyle(color: Colors.grey[400]),
        filled: true,
        fillColor: Colors.white,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFF00A63E)),
        ),
      ),
    );
  }

  Widget _buildIconAddButton({required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: const Color(0xFF00A63E),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  void _addSkill() {
    final text = _skillController.text.trim();
    if (text.isEmpty) return;
    setState(() {
      _skills.add(text);
      _skillController.clear();
    });
  }

  void _addArea() {
    final text = _areaController.text.trim();
    if (text.isEmpty) return;
    setState(() {
      _areas.add(text);
      _areaController.clear();
    });
  }
}


