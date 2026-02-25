import 'package:flutter/material.dart';
import 'chat_screen.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'الرسائل',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          // Search Bar
          Container(
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(12),
            ),
            child: const TextField(
              textDirection: TextDirection.rtl,
              decoration: InputDecoration(
                hintText: 'ابحث في الرسائل...',
                hintStyle: TextStyle(color: Colors.grey),
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
            ),
          ),
          // Messages List
          Expanded(
            child: ListView(
              children: [
                _buildMessageItem(
                  context,
                  name: 'سارة محمد',
                  lastMessage: 'شكراً لك على الخدمة الممتازة',
                  time: 'منذ دقيقتين',
                  unreadCount: 2,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ChatScreen(providerName: 'سارة محمد'),
                      ),
                    );
                  },
                ),
                _buildMessageItem(
                  context,
                  name: 'عبد الرحمن',
                  lastMessage: 'سأكون هناك في الموعد المحدد',
                  time: 'منذ ساعة',
                  unreadCount: 0,
                ),
                _buildMessageItem(
                  context,
                  name: 'أحمد حسن',
                  lastMessage: 'هل يمكن تغيير الموعد؟',
                  time: 'منذ ساعتين',
                  unreadCount: 1,
                ),
                _buildMessageItem(
                  context,
                  name: 'خالد علي',
                  lastMessage: 'تم إكمال الطلب بنجاح',
                  time: 'أمس',
                  unreadCount: 0,
                ),
                _buildMessageItem(
                  context,
                  name: 'فاطمة أحمد',
                  lastMessage: 'شكراً لك',
                  time: 'أمس',
                  unreadCount: 0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageItem(
    BuildContext context, {
    required String name,
    required String lastMessage,
    required String time,
    required int unreadCount,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey, width: 0.2)),
        ),
        child: Row(
          children: [
            // Profile Picture
            CircleAvatar(
              radius: 28,
              backgroundColor: Colors.green[100],
              child: const Icon(Icons.person, color: Color(0xFF00A63E)),
            ),
            const SizedBox(width: 12),
            // Message Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        textDirection: TextDirection.rtl,
                      ),
                      Text(
                        time,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                        textDirection: TextDirection.rtl,
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          lastMessage,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                      if (unreadCount > 0)
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            '$unreadCount',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

