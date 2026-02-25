import 'package:flutter/material.dart';

class RateAppScreen extends StatefulWidget {
  const RateAppScreen({super.key});

  @override
  State<RateAppScreen> createState() => _RateAppScreenState();
}

class _RateAppScreenState extends State<RateAppScreen> {
  int _selectedRating = 0;
  final TextEditingController _feedbackController = TextEditingController();
  bool _isSubmitted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFF00A63E),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'تقييم التطبيق',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Icon(Icons.arrow_forward, color: Colors.white),
          )
        ],
      ),
      body: _isSubmitted ? _buildSuccessState() : _buildRatingState(),
    );
  }

  Widget _buildRatingState() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey[200]!),
            ),
            child: Column(
              children: [
                // App Icon
                Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    color: const Color(0xFF00A63E),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Icon(
                    Icons.smartphone,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
                const SizedBox(height: 24),
                // Question
                const Text(
                  'هل أعجبك تطبيقنا؟',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textDirection: TextDirection.rtl,
                ),
                const SizedBox(height: 8),
                Text(
                  'رأيك يهمنا، ساعدنا في تحسين خدماتنا',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,
                ),
                const SizedBox(height: 32),
                // Rating Selection
                const Text(
                  'اختر تقييمك',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                  textDirection: TextDirection.rtl,
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  textDirection: TextDirection.rtl,
                  children: List.generate(5, (index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedRating = index + 1;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Icon(
                          Icons.star_rounded,
                          size: 40,
                          color: index < _selectedRating ? const Color(0xFFFFB800) : Colors.grey[300],
                        ),
                      ),
                    );
                  }),
                ),
                if (_selectedRating > 0) ...[
                  const SizedBox(height: 12),
                  Text(
                    _getRatingText(_selectedRating),
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Feedback Field
          if (_selectedRating > 0) ...[
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey[200]!),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                textDirection: TextDirection.rtl,
                children: [
                  const Text(
                    'ما الذي أعجبك في التطبيق؟ (اختياري)',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: _feedbackController,
                    textDirection: TextDirection.rtl,
                    maxLines: 4,
                    decoration: InputDecoration(
                      hintText: 'اكتب ملاحظاتك هنا...',
                      hintStyle: TextStyle(color: Colors.grey[400], fontSize: 13),
                      filled: true,
                      fillColor: Colors.grey[50],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey[200]!),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey[200]!),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Color(0xFF00A63E)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Submit Button
            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  _isSubmitted = true;
                });
              },
              icon: const Text(
                'إرسال التقييم',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              label: const Icon(Icons.rate_review_outlined, color: Colors.white),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF00A63E),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 0,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'تقييمك سيساعدنا في تقديم خدمة أفضل لك ولجميع المستخدمين',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[500],
              ),
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
            ),
          ] else ...[
            Text(
              'تقييمك سيساعدنا في تقديم خدمة أفضل لك ولجميع المستخدمين',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[500],
              ),
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildSuccessState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: const BoxDecoration(
              color: Color(0xFFE8F5E9),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.star_rounded,
              color: Color(0xFFFFB800),
              size: 48,
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'شكراً لتقييمك!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),
          Text(
            'نقدر وقتك ورأيك يساعدنا في تحسين خدماتنا',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            textDirection: TextDirection.rtl,
            children: List.generate(5, (index) {
              return const Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.0),
                child: Icon(
                  Icons.star_rounded,
                  size: 32,
                  color: Color(0xFFFFB800),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  String _getRatingText(int rating) {
    switch (rating) {
      case 1:
        return 'سيء';
      case 2:
        return 'مقبول';
      case 3:
        return 'جيد';
      case 4:
        return 'جيد جداً';
      case 5:
        return 'ممتاز';
      default:
        return '';
    }
  }
}

