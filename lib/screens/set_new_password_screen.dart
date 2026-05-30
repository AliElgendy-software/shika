import 'package:flutter/material.dart';
import 'auth/password_changed_success_screen.dart';

class SetNewPasswordScreen extends StatefulWidget {
  const SetNewPasswordScreen({super.key});

  @override
  State<SetNewPasswordScreen> createState() => _SetNewPasswordScreenState();
}

class _SetNewPasswordScreenState extends State<SetNewPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _obscureNewPassword = true;
  bool _obscureConfirmPassword = true;
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            // Background abstract shapes
            Positioned(
              top: -50,
              right: -50,
              child: Container(
                width: 350,
                height: 450,
                decoration: BoxDecoration(
                  color: const Color(0xFFE5F5EB).withOpacity(0.6),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(250),
                    bottomRight: Radius.circular(50),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 100,
              left: -50,
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  color: const Color(0xFFE5F5EB).withOpacity(0.5),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Column(
              children: [
                // Top Bar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    textDirection: TextDirection.rtl,
                    children: [
                      /* No back button depicted in the second screen mockup based on the common structure, but it's good to keep if needed. However, the image doesn't explicitly show it. I will keep it for navigation */
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 60),
                          // Title
                          const Text(
                            'إعداد كلمة مرور جديدة',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                            textDirection: TextDirection.rtl,
                          ),
                          const SizedBox(height: 16),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              'من فضلك، قم بإعداد كلمة مرور جديدة لحسابك',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                                height: 1.5,
                              ),
                              textAlign: TextAlign.center,
                              textDirection: TextDirection.rtl,
                            ),
                          ),
                          const SizedBox(height: 48),
                          // New Password Label
                          const Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              'كلمة المرور الجديدة',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                              textDirection: TextDirection.rtl,
                            ),
                          ),
                          const SizedBox(height: 8),
                          // New Password Field
                          TextFormField(
                            controller: _newPasswordController,
                            obscureText: _obscureNewPassword,
                            textDirection: TextDirection.rtl,
                            style: const TextStyle(fontSize: 14),
                            decoration: InputDecoration(
                              hintText: 'أدخل كلمة المرور الجديدة',
                              hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
                              prefixIcon: const Icon(Icons.lock_outline, color: Colors.grey, size: 20),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscureNewPassword
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  color: Colors.grey,
                                  size: 20,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _obscureNewPassword = !_obscureNewPassword;
                                  });
                                },
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: const EdgeInsets.symmetric(vertical: 16),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: Colors.grey.shade300),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: Colors.grey.shade300),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(color: Color(0xFF00A63E), width: 2),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'يرجى إدخال كلمة المرور الجديدة';
                              }
                              if (value.length < 6) {
                                return 'كلمة المرور يجب أن تكون 6 أحرف على الأقل';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 24),
                          // Confirm Password Label
                          const Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              'تأكيد كلمة المرور',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                              textDirection: TextDirection.rtl,
                            ),
                          ),
                          const SizedBox(height: 8),
                          // Confirm Password Field
                          TextFormField(
                            controller: _confirmPasswordController,
                            obscureText: _obscureConfirmPassword,
                            textDirection: TextDirection.rtl,
                            style: const TextStyle(fontSize: 14),
                            decoration: InputDecoration(
                              hintText: 'أعد إدخال كلمة المرور',
                              hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
                              prefixIcon: const Icon(Icons.lock_outline, color: Colors.grey, size: 20),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscureConfirmPassword
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  color: Colors.grey,
                                  size: 20,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _obscureConfirmPassword = !_obscureConfirmPassword;
                                  });
                                },
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: const EdgeInsets.symmetric(vertical: 16),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: Colors.grey.shade300),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: Colors.grey.shade300),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(color: Color(0xFF00A63E), width: 2),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'يرجى تأكيد كلمة المرور';
                              }
                              if (value != _newPasswordController.text) {
                                return 'كلمة المرور غير متطابقة';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 32),
                          // Save Button
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const PasswordChangedSuccessScreen()),
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF00A63E),
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: const Text(
                                'حفظ كلمة المرور الجديدة',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          // Cancel
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'إلغاء',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                              textDirection: TextDirection.rtl,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
