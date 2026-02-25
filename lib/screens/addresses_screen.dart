import 'package:flutter/material.dart';

class AddressesScreen extends StatelessWidget {
  const AddressesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      appBar: AppBar(
        title: const Text(
          'عناويني',
          style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const SizedBox(), // Placeholder to center title
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_forward, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Home Address (Default)
            _buildAddressCard(
              icon: Icons.home_outlined,
              iconColor: const Color(0xFF00A63E),
              iconBgColor: const Color(0xFFE8F6EE),
              title: 'المنزل',
              address: 'شارع النيل، المعادي، القاهرة، مصر',
              isDefault: true,
            ),
            const SizedBox(height: 16),

            // Work Address
            _buildAddressCard(
              icon: Icons.work_outline,
              iconColor: Colors.blue,
              iconBgColor: Colors.blue.withOpacity(0.1),
              title: 'العمل',
              address: 'شارع التحرير، وسط البلد، القاهرة، مصر',
              isDefault: false,
            ),
            const SizedBox(height: 16),

            // Other Address
            _buildAddressCard(
              icon: Icons.location_on_outlined,
              iconColor: Colors.grey[700]!,
              iconBgColor: Colors.grey[200]!,
              title: 'عنوان آخر',
              address: 'شارع الهرم، الجيزة، مصر',
              isDefault: false,
            ),
            const SizedBox(height: 24),

            // Instruction Text
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: const Color(0xFFEBF5FF), // Light Blue
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.blue.withOpacity(0.1)),
              ),
              child: Row(
                textDirection: TextDirection.rtl,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.lightbulb_outline, color: Colors.amber, size: 20),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'يمكنك إضافة عدة عناوين واختيار عنوان افتراضي لتسريع عملية الحجز',
                      style: TextStyle(
                        color: Colors.blue[800],
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddressCard({
    required IconData icon,
    required Color iconColor,
    required Color iconBgColor,
    required String title,
    required String address,
    required bool isDefault,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        textDirection: TextDirection.rtl,
        children: [
          Row(
            textDirection: TextDirection.rtl,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: iconBgColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: iconColor, size: 24),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Row(
                  textDirection: TextDirection.rtl,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                    if (isDefault)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE8F6EE),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          'افتراضي',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF00A63E),
                            fontWeight: FontWeight.bold,
                          ),
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.only(right: 56), // Align with text
            child: Text(
              address,
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey[600],
              ),
              textDirection: TextDirection.rtl,
            ),
          ),
          const SizedBox(height: 16),
          // Action Buttons
          Row(
            textDirection: TextDirection.rtl,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (!isDefault) ...[
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: const Text(
                    'تعيين كافتراضي',
                    style: TextStyle(color: Colors.grey, fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(width: 16),
              ],
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.edit_outlined, size: 16, color: Color(0xFF00A63E)),
                label: const Text(
                  'تعديل',
                  style: TextStyle(color: Color(0xFF00A63E), fontSize: 13, fontWeight: FontWeight.bold),
                ),
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              ),
              const SizedBox(width: 16),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.delete_outline, size: 16, color: Colors.red),
                label: const Text(
                  'حذف',
                  style: TextStyle(color: Colors.red, fontSize: 13, fontWeight: FontWeight.bold),
                ),
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

