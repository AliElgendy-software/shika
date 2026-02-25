import 'package:flutter/material.dart';

class BookingLocationStep extends StatefulWidget {
  final Function(Map<String, String> address) onAddressChanged;

  const BookingLocationStep({super.key, required this.onAddressChanged});

  @override
  State<BookingLocationStep> createState() => _BookingLocationStepState();
}

class _BookingLocationStepState extends State<BookingLocationStep> {
  final _formKey = GlobalKey<FormState>();
  final _governorateController = TextEditingController();
  final _cityController = TextEditingController();
  final _streetController = TextEditingController();
  final _buildingController = TextEditingController();
  final _detailsController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _governorateController.addListener(_updateAddress);
    _cityController.addListener(_updateAddress);
    _streetController.addListener(_updateAddress);
    _buildingController.addListener(_updateAddress);
    _detailsController.addListener(_updateAddress);
  }

  void _updateAddress() {
    widget.onAddressChanged({
      'governorate': _governorateController.text,
      'city': _cityController.text,
      'street': _streetController.text,
      'building': _buildingController.text,
      'details': _detailsController.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'عنوان الخدمة',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textDirection: TextDirection.rtl,
            ),
            const SizedBox(height: 16),
            _buildTextField(
              controller: _governorateController,
              label: 'المحافظة',
              icon: Icons.map,
            ),
            const SizedBox(height: 12),
            _buildTextField(
              controller: _cityController,
              label: 'المدينة / المنطقة',
              icon: Icons.location_city,
            ),
            const SizedBox(height: 12),
            _buildTextField(
              controller: _streetController,
              label: 'اسم الشارع',
              icon: Icons.add_road,
            ),
            const SizedBox(height: 12),
            _buildTextField(
              controller: _buildingController,
              label: 'رقم المبنى / الشقة',
              icon: Icons.home,
            ),
            const SizedBox(height: 12),
            _buildTextField(
              controller: _detailsController,
              label: 'علامة مميزة / تفاصيل أخرى',
              icon: Icons.info_outline,
              maxLines: 3,
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.amber.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.amber),
              ),
              child: const Row(
                children: [
                  Icon(Icons.lightbulb_outline, color: Colors.amber),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'تأكد من كتابة العنوان بدقة لتسهيل وصول مقدم الخدمة إليك.',
                      style: TextStyle(fontSize: 12),
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

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    int maxLines = 1,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      textDirection: TextDirection.rtl,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF00A63E)),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
  }
}
