import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'home_screen.dart';
import 'provider_onboarding_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;
  int _selectedAccountType = 0; // 0: عميل, 1: مقدم خدمة
  bool _acceptTerms = true;
  bool _allowNotifications = true;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // بيانات افتراضية للتسجيل السريع
    _nameController.text = 'أحمد محمد';
    _emailController.text = 'user@homefix.com';
    _phoneController.text = '+20 1012345678';
    _passwordController.text = '123456';
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
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // App Icon
              Center(
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: const Color(0xFF00A63E).withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.home,
                    color: Color(0xFF00A63E),
                    size: 40,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // Title
              const Text(
                'إنشاء حساب جديد',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textDirection: TextDirection.rtl,
              ),
              const SizedBox(height: 8),
              const Text(
                'انضم إلينا واحصل على أفضل الخدمات',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
                textDirection: TextDirection.rtl,
              ),
              const SizedBox(height: 24),
              // Account Type
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'نوع الحساب',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w600,
                  ),
                  textDirection: TextDirection.rtl,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F7F9),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFE0E0E0)),
                ),
                child: Row(
                  children: [
                    _buildAccountTypeTab(
                      index: 0,
                      icon: Icons.person,
                      label: 'عميل',
                    ),
                    _buildAccountTypeTab(
                      index: 1,
                      icon: Icons.home_repair_service,
                      label: 'مقدم خدمة',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              // Full Name
              _buildTextField(
                controller: _nameController,
                label: 'الاسم الكامل',
                hint: 'أدخل اسمك الكامل',
                icon: Icons.person,
                keyboardType: TextInputType.name,
              ),
              const SizedBox(height: 16),
              // Email
              _buildTextField(
                controller: _emailController,
                label: 'البريد الإلكتروني',
                hint: 'أدخل بريدك الإلكتروني',
                icon: Icons.email,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              // Phone
              _buildTextField(
                controller: _phoneController,
                label: 'رقم الهاتف',
                hint: '+20 1012345678',
                icon: Icons.phone,
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 16),
              // Password
              TextFormField(
                controller: _passwordController,
                obscureText: _obscurePassword,
                textDirection: TextDirection.rtl,
                decoration: InputDecoration(
                  labelText: 'كلمة المرور',
                  hintText: 'أدخل كلمة المرور',
                  prefixIcon: const Icon(Icons.lock, color: Color(0xFF00A63E)),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword ? Icons.visibility : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFF00A63E), width: 2),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // Personal photo
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'الصورة الشخصية',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w600,
                  ),
                  textDirection: TextDirection.rtl,
                ),
              ),
              const SizedBox(height: 8),
              _buildUploadButton(
                label: 'رفع صورة',
                icon: Icons.photo_camera_outlined,
                onPressed: () {},
              ),
              const SizedBox(height: 16),
              // ID / License
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'بطاقة الهوية / رخصة القيادة',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w600,
                  ),
                  textDirection: TextDirection.rtl,
                ),
              ),
              const SizedBox(height: 8),
              _buildUploadButton(
                label: 'رفع المستند',
                icon: Icons.upload_file,
                onPressed: () {},
              ),
              const SizedBox(height: 16),
              // Toggles
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Switch(
                          value: _allowNotifications,
                          activeColor: const Color(0xFF00A63E),
                          onChanged: (v) {
                            setState(() => _allowNotifications = v);
                          },
                        ),
                        const Flexible(
                          child: Text(
                            'أرسل لي عروضاً مميزة',
                            style: TextStyle(fontSize: 12),
                            textDirection: TextDirection.rtl,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Checkbox(
                          value: _acceptTerms,
                          activeColor: const Color(0xFF00A63E),
                          onChanged: (v) {
                            setState(() => _acceptTerms = v ?? false);
                          },
                        ),
                        const Flexible(
                          child: Text(
                            'أوافق على الشروط والأحكام',
                            style: TextStyle(fontSize: 12),
                            textDirection: TextDirection.rtl,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              // Sign Up Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate() && _acceptTerms) {
                      if (_selectedAccountType == 1) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProviderOnboardingScreen(),
                          ),
                        );
                      } else {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const HomeScreen()),
                        );
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00A63E),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'إنشاء الحساب',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Login Link
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginScreen()),
                    );
                  },
                  child: const Text(
                    'لديك حساب بالفعل؟ تسجيل الدخول',
                    style: TextStyle(
                      color: Color(0xFF00A63E),
                      fontSize: 16,
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAccountTypeTab({
    required int index,
    required IconData icon,
    required String label,
  }) {
    final bool isSelected = _selectedAccountType == index;
    return Expanded(
      child: InkWell(
        onTap: () {
          setState(() => _selectedAccountType = index);
        },
        child: Container(
          height: 56,
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            border: isSelected
                ? Border.all(color: const Color(0xFF00A63E), width: 1.5)
                : null,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: isSelected ? const Color(0xFF00A63E) : Colors.grey,
                size: 20,
              ),
              const SizedBox(width: 6),
              Text(
                label,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: isSelected ? const Color(0xFF00A63E) : Colors.grey[700],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUploadButton({
    required String label,
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, color: Colors.grey[700]),
        label: Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 14),
          side: const BorderSide(color: Color(0xFFE0E0E0)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    TextInputType? keyboardType,
    bool readOnly = false,
    VoidCallback? onTap,
  }) {
    return TextFormField(
      controller: controller,
      textDirection: TextDirection.rtl,
      keyboardType: keyboardType,
      readOnly: readOnly,
      onTap: onTap,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(icon, color: const Color(0xFF00A63E)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF00A63E), width: 2),
        ),
      ),
    );
  }
}

