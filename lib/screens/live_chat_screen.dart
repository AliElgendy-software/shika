import 'package:flutter/material.dart';

class LiveChatScreen extends StatefulWidget {
  const LiveChatScreen({super.key});

  @override
  State<LiveChatScreen> createState() => _LiveChatScreenState();
}

class _LiveChatScreenState extends State<LiveChatScreen> {
  final TextEditingController _messageController = TextEditingController();

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
            Icon(Icons.headset_mic, color: Colors.white),
            SizedBox(width: 8),
            Text(
              'الدردشة المباشرة',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(30),
          child: Container(
            padding: const EdgeInsets.only(bottom: 8),
            child: const Text(
              'فريق الدعم متاح الآن',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _buildDateDivider('اليوم'),
                const SizedBox(height: 16),
                _buildMessage(
                  text: 'مرحباً! كيف يمكنني مساعدتك اليوم؟',
                  isMe: false,
                  time: '10:30 ص',
                ),
                _buildMessage(
                  text: 'أهلاً، عندي استفسار عن الخدمات المتاحة',
                  isMe: true,
                  time: '10:31 ص',
                ),
                _buildMessage(
                  text: 'بالتأكيد يسعدني مساعدتك. لدينا العديد من الخدمات المنزلية مثل السباكة والكهرباء والتنظيف والصيانة. هل تبحث عن خدمة محددة؟',
                  isMe: false,
                  time: '10:31 ص',
                ),
                _buildMessage(
                  text: 'انا عبد الرحمن عايز سباك قريب من عرب المعادي يكون بسعر 200 جنيه',
                  isMe: true,
                  time: '10:32 ص',
                ),
                _buildMessage(
                  text: 'موجود فني اسمه محمد في البساتين تقدر تقولي انت محتاجه يعمل ايه بالتحديد او صوره للمشكله',
                  isMe: false,
                  time: '10:33 ص',
                ),
              ],
            ),
          ),
          // Input Field
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.attach_file, color: Colors.grey),
                  onPressed: () {},
                ),
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    textDirection: TextDirection.rtl,
                    decoration: InputDecoration(
                      hintText: 'اكتب رسالتك هنا...',
                      hintStyle: const TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[100],
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send, color: Color(0xFF00A63E)),
                  onPressed: () {
                    if (_messageController.text.isNotEmpty) {
                      setState(() {
                        _messageController.clear();
                      });
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateDivider(String date) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          date,
          style: TextStyle(
            color: Colors.grey[700],
            fontSize: 12,
          ),
          textDirection: TextDirection.rtl,
        ),
      ),
    );
  }

  Widget _buildMessage({
    required String text,
    required bool isMe,
    required String time,
  }) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(12),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.7,
        ),
        decoration: BoxDecoration(
          color: isMe ? const Color(0xFF00A63E) : Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: TextStyle(
                color: isMe ? Colors.white : Colors.black,
                fontSize: 14,
              ),
              textDirection: TextDirection.rtl,
            ),
            const SizedBox(height: 4),
            Text(
              time,
              style: TextStyle(
                color: isMe ? Colors.white70 : Colors.grey[600],
                fontSize: 10,
              ),
              textDirection: TextDirection.rtl,
            ),
          ],
        ),
      ),
    );
  }
}

