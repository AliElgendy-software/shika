import 'package:flutter/material.dart';
import 'set_new_password_screen.dart';
import 'login_screen.dart';
import 'auth/otp_verification_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

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
                  borderRadius: const BorderRadius.only(
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
                      IconButton(
                        icon: const Icon(Icons.arrow_forward, color: Colors.black),
                        onPressed: () => Navigator.pop(context),
                      ),
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
                          const SizedBox(height: 20),
                          // App Icon in white card
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  blurRadius: 15,
                                  offset: const Offset(0, 5),
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.home,
                              color: Color(0xFF00A63E),
                              size: 40,
                            ),
                          ),
                          const SizedBox(height: 24),
                          // Title
                          const Text(
                            'نسيت كلمة المرور',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 16),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              'أدخل عنوان بريدك الإلكتروني وسنرسل لك رابطاً لإعادة تعيين كلمة المرور',
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
                          // Email Field Label
                          const Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              'البريد الإلكتروني',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                              textDirection: TextDirection.rtl,
                            ),
                          ),
                          const SizedBox(height: 8),
                          // Email Field
                          TextFormField(
                            controller: _emailController,
                            textDirection: TextDirection.rtl,
                            keyboardType: TextInputType.emailAddress,
                            style: const TextStyle(fontSize: 14),
                            decoration: InputDecoration(
                              hintText: 'أدخل بريدك الإلكتروني',
                              hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
                              prefixIcon: const Icon(Icons.email_outlined, color: Colors.grey, size: 20),
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
                                return 'يرجى إدخال البريد الإلكتروني';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 24),
                          // Send Reset Link Button
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => OtpVerificationScreen(
                                              destination: _emailController.text,
                                            )),
                                  ).then((verified) {
                                    if (verified == true) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => const SetNewPasswordScreen()),
                                      );
                                    }
                                  });
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
                                'إرسال رابط إعادة التعيين',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),
                          // Back to Login
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen()),
                              );
                            },
                            child: const Text(
                              'العودة إلى تسجيل الدخول',
                              style: TextStyle(
                                color: Color(0xFF00A63E),
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
