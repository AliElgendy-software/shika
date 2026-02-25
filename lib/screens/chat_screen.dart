import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final String providerName;

  const ChatScreen({super.key, required this.providerName});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  final List<Map<String, dynamic>> _messages = [
    {'text': 'مرحباً، أريد حجز خدمة إصلاح سباكة', 'isMe': true, 'time': '10:30 ص'},
    {'text': 'أهلاً بك! سأكون سعيداً بمساعدتك. ما هي المشكلة بالتحديد؟', 'isMe': false, 'time': '10:32 ص'},
    {'text': 'لدي تسريب في حنفية المطبخ', 'isMe': true, 'time': '10:33 ص', 'hasImage': true},
    {'text': 'فهمت. يمكنني القدوم غداً في الساعة 10 صباحاً. هل يناسبك الوقت؟', 'isMe': false, 'time': '10:35 ص'},
    {'text': 'نعم، هذا مناسب جداً. شكراً لك!', 'isMe': true, 'time': '10:36 ص'},
    {'text': 'ممتازاً سأكون هناك في الموعد المحدد. إذا كان لديك أي أسئلة، لا تتردد في السؤال', 'isMe': false, 'time': '10:37 ص'},
  ];

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F0F0),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_forward, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        titleSpacing: 0,
        title: Row(
          textDirection: TextDirection.rtl,
          children: [
            // Avatar
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.green[100],
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.person, color: Color(0xFF00A63E), size: 24),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              textDirection: TextDirection.rtl,
              children: [
                Text(widget.providerName, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black), textDirection: TextDirection.rtl),
                const Text('متصل الآن', style: TextStyle(fontSize: 12, color: Color(0xFF00A63E)), textDirection: TextDirection.rtl),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Messages list
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(16),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final msg = _messages[index];
                return _buildMessage(msg);
              },
            ),
          ),
          // Input field
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.grey.withOpacity(0.1), spreadRadius: 1, blurRadius: 5, offset: const Offset(0, -2)),
              ],
            ),
            child: Row(
              textDirection: TextDirection.rtl,
              children: [
                // Attachment
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(Icons.attach_file, color: Colors.grey[600], size: 20),
                    onPressed: () {},
                    padding: EdgeInsets.zero,
                  ),
                ),
                const SizedBox(width: 8),
                // Text input
                Expanded(
                  child: Container(
                    height: 44,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(22),
                    ),
                    child: TextField(
                      controller: _messageController,
                      textDirection: TextDirection.rtl,
                      decoration: InputDecoration(
                        hintText: 'اكتب رسالتك...',
                        hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                // Send button
                Container(
                  width: 44,
                  height: 44,
                  decoration: const BoxDecoration(
                    color: Color(0xFF00A63E),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.send, color: Colors.white, size: 20),
                    onPressed: () {
                      if (_messageController.text.trim().isNotEmpty) {
                        setState(() {
                          _messages.add({
                            'text': _messageController.text,
                            'isMe': true,
                            'time': '10:38 ص',
                          });
                          _messageController.clear();
                        });
                      }
                    },
                    padding: EdgeInsets.zero,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessage(Map<String, dynamic> msg) {
    final isMe = msg['isMe'] as bool;
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          // Image if present
          if (msg['hasImage'] == true)
            Container(
              margin: EdgeInsets.only(
                right: isMe ? 0 : 60,
                left: isMe ? 60 : 0,
                bottom: 6,
              ),
              height: 150,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(12),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  color: Colors.grey[300],
                  child: Center(child: Icon(Icons.plumbing, size: 50, color: Colors.grey[500])),
                ),
              ),
            ),
          // Message bubble
          Container(
            constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: isMe ? const Color(0xFF00A63E) : Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(16),
                topRight: const Radius.circular(16),
                bottomLeft: Radius.circular(isMe ? 16 : 4),
                bottomRight: Radius.circular(isMe ? 4 : 16),
              ),
              boxShadow: [
                if (!isMe) BoxShadow(color: Colors.grey.withOpacity(0.1), spreadRadius: 1, blurRadius: 3),
              ],
            ),
            child: Text(
              msg['text'] as String,
              style: TextStyle(
                fontSize: 14,
                color: isMe ? Colors.white : Colors.black87,
                height: 1.4,
              ),
              textDirection: TextDirection.rtl,
            ),
          ),
          const SizedBox(height: 4),
          // Timestamp
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              msg['time'] as String,
              style: TextStyle(fontSize: 11, color: Colors.grey[500]),
            ),
          ),
        ],
      ),
    );
  }
}
