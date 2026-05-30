import 'update_order_status_screen.dart';

class ProviderRequestsScreen extends StatefulWidget {
  const ProviderRequestsScreen({super.key});

  @override
  State<ProviderRequestsScreen> createState() => _ProviderRequestsScreenState();
}

class _ProviderRequestsScreenState extends State<ProviderRequestsScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  static const _green = Color(0xFF00A63E);

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F4F8),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text('الطلبات الجديدة', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_forward, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          Center(
            child: Container(
              margin: const EdgeInsets.only(left: 16),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(color: Colors.red.withOpacity(0.1), borderRadius: BorderRadius.circular(20)),
              child: const Text('3 طلب جديد', style: TextStyle(color: Colors.red, fontSize: 11, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          labelColor: _green,
          unselectedLabelColor: Colors.grey,
          indicatorColor: _green,
          indicatorWeight: 3,
          labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          tabs: const [
            Tab(text: 'الطلبات الجديدة'),
            Tab(text: 'الطلبات الجارية'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildNewRequests(),
          _buildActiveRequests(),
        ],
      ),
    );
  }

  Widget _buildNewRequests() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _newRequestCard('تصليح سباكة', 'عبدالرحمن نصر', 'يوجد تسريب في الحمام يحتاج إصلاح فوري', 'المعادي، القاهرة', 'اليوم 3:00 مساءً', '2.5 كم', '200 جنيه', true),
        const SizedBox(height: 12),
        _newRequestCard('تصليح سباكة', 'عبدالرحمن نصر', 'السخان لا يعمل بشكل صحيح ويحتاج فحص', 'مدينة نصر، القاهرة', 'غداً 10:00 صباحاً', '5.8 كم', '180 جنيه', false),
        const SizedBox(height: 12),
        _newRequestCard('تصليح سباكة', 'عبدالرحمن نصر', 'تركيب حنفية جديدة في المطبخ', 'الجيزة، الجيرة', 'بعد غد 2:00 مساءً', '8.2 كم', '150 جنيه', false),
      ],
    );
  }

  Widget _newRequestCard(String title, String client, String desc, String area, String time, String dist, String price, bool isUrgent) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 10, offset: const Offset(0, 3))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            textDirection: TextDirection.rtl,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              if (isUrgent)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(color: Colors.red.withOpacity(0.1), borderRadius: BorderRadius.circular(6)),
                  child: const Text('عاجل', style: TextStyle(color: Colors.red, fontSize: 10, fontWeight: FontWeight.bold)),
                ),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            textDirection: TextDirection.rtl,
            children: [
              const Icon(Icons.person_outline, size: 14, color: Colors.grey),
              const SizedBox(width: 6),
              Text(client, style: const TextStyle(fontSize: 13, color: Colors.grey)),
              const Spacer(),
              const Text('منذ 5 دقائق', style: TextStyle(fontSize: 11, color: Colors.grey)),
            ],
          ),
          const SizedBox(height: 10),
          Text(desc, style: TextStyle(fontSize: 12, color: Colors.grey[700]), textDirection: TextDirection.rtl),
          const SizedBox(height: 12),
          Row(
            textDirection: TextDirection.rtl,
            children: [
              const Icon(Icons.location_on_outlined, size: 14, color: Colors.grey),
              const SizedBox(width: 4),
              Text(area, style: const TextStyle(fontSize: 12, color: Colors.grey)),
              const SizedBox(width: 12),
              const Icon(Icons.access_time, size: 14, color: Colors.grey),
              const SizedBox(width: 4),
              Text(time, style: const TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            textDirection: TextDirection.rtl,
            children: [
              const Icon(Icons.directions_outlined, size: 14, color: Colors.grey),
              const SizedBox(width: 4),
              Text('$dist بعيداً', style: const TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            decoration: BoxDecoration(color: const Color(0xFFF1F8E9), borderRadius: BorderRadius.circular(10)),
            child: Row(
              textDirection: TextDirection.rtl,
              children: [
                const Text('السعر المقترح:', style: TextStyle(fontSize: 13, color: Colors.grey)),
                const SizedBox(width: 8),
                Text(price, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: _green)),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _green,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: const Text('قبول', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[100],
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: Text('رفض', style: TextStyle(color: Colors.grey[600], fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActiveRequests() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _activeRequestCard('12453# تصليح سباكة', 'في الطريق', Colors.blue, 'عبدالرحمن نصر', 'منذ 15 دقيقة', 'المعادي، القاهرة', 'اليوم 3:00 مساءً', '200 جنيه'),
        const SizedBox(height: 12),
        _activeRequestCard('12451# صيانة سخان', 'جاري العمل', Colors.orange, 'فاطمة حسن', 'منذ ساعة', 'مدينة نصر، القاهرة', 'اليوم 1:00 مساءً', '180 جنيه'),
      ],
    );
  }

  Widget _activeRequestCard(String title, String status, Color statusColor, String client, String elapsed, String area, String time, String price) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 10, offset: const Offset(0, 3))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            textDirection: TextDirection.rtl,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(color: statusColor.withOpacity(0.1), borderRadius: BorderRadius.circular(6)),
                child: Text(status, style: TextStyle(color: statusColor, fontSize: 11, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            textDirection: TextDirection.rtl,
            children: [
              Text(client, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              const Spacer(),
              Text(elapsed, style: const TextStyle(fontSize: 11, color: Colors.grey)),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            textDirection: TextDirection.rtl,
            children: [
              const Icon(Icons.location_on_outlined, size: 14, color: Colors.grey),
              const SizedBox(width: 4),
              Text(area, style: const TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            textDirection: TextDirection.rtl,
            children: [
              const Icon(Icons.access_time, size: 14, color: Colors.grey),
              const SizedBox(width: 4),
              Text(time, style: const TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(color: const Color(0xFFF1F8E9), borderRadius: BorderRadius.circular(8)),
            child: Text(price, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: _green), textAlign: TextAlign.right),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(child: _actionBtn(Icons.chat_bubble_outline, Colors.green, 'محادثة')),
              const SizedBox(width: 8),
              Expanded(child: _actionBtn(Icons.near_me_outlined, Colors.blue, 'خرائط')),
              const SizedBox(width: 8),
              Expanded(child: _actionBtn(Icons.camera_alt_outlined, Colors.orange, 'تحديث', onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const UpdateOrderStatusScreen()));
              })),
            ],
          ),
        ],
      ),
    );
  }

  Widget _actionBtn(IconData icon, Color color, String label, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(color: color.withOpacity(0.05), borderRadius: BorderRadius.circular(10), border: Border.all(color: color.withOpacity(0.1))),
      child: Column(
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(height: 4),
          Text(label, style: TextStyle(color: color, fontSize: 11, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
