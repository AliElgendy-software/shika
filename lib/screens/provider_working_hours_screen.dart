import 'package:flutter/material.dart';
import 'provider/provider_main_screen.dart';

class ProviderWorkingHoursScreen extends StatefulWidget {
  const ProviderWorkingHoursScreen({super.key});

  @override
  State<ProviderWorkingHoursScreen> createState() =>
      _ProviderWorkingHoursScreenState();
}

class _ProviderWorkingHoursScreenState
    extends State<ProviderWorkingHoursScreen> {
  final List<_DayHours> _days = [
    _DayHours(name: 'السبت'),
    _DayHours(name: 'الأحد'),
    _DayHours(name: 'الإثنين'),
    _DayHours(name: 'الثلاثاء'),
    _DayHours(name: 'الأربعاء'),
    _DayHours(name: 'الخميس'),
    _DayHours(name: 'الجمعة', enabled: false),
  ];

  Future<void> _pickTime(_DayHours day, bool isFrom) async {
    final now = TimeOfDay.now();
    final picked = await showTimePicker(
      context: context,
      initialTime: now,
    );
    if (picked != null) {
      setState(() {
        if (isFrom) {
          day.from = picked;
        } else {
          day.to = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF7F8FA),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              textDirection: TextDirection.rtl,
              children: [
                const Text(
                  'تحديد المواعيد المتاحة',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'حدد ساعات عملك في كل يوم',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              itemBuilder: (context, index) {
                final day = _days[index];
                return _buildDayCard(day);
              },
              separatorBuilder: (_, __) => const SizedBox(height: 16),
              itemCount: _days.length,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: const Color(0xFFF7F8FA),
            ),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProviderMainScreen(),
                    ),
                    (route) => false,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00A63E),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.check, color: Colors.white, size: 20),
                    SizedBox(width: 8),
                    Text(
                      'تأكيد',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDayCard(_DayHours day) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: day.enabled ? const Color(0xFF00A63E) : Colors.transparent,
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            textDirection: TextDirection.rtl,
            children: [
              Expanded(
                child: Text(
                  day.name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: day.enabled ? Colors.black : Colors.grey[600],
                  ),
                  textDirection: TextDirection.rtl,
                ),
              ),
              Switch(
                value: day.enabled,
                activeColor: Colors.white,
                activeTrackColor: const Color(0xFF00A63E),
                inactiveThumbColor: Colors.white,
                inactiveTrackColor: Colors.grey[300],
                onChanged: (v) {
                  setState(() => day.enabled = v);
                },
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            textDirection: TextDirection.rtl,
            children: [
              Expanded(
                child: _buildTimeInput(
                  label: 'من',
                  time: day.from,
                  enabled: day.enabled,
                  onTap: () => _pickTime(day, true),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildTimeInput(
                  label: 'إلى',
                  time: day.to,
                  enabled: day.enabled,
                  onTap: () => _pickTime(day, false),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTimeInput({
    required String label,
    required TimeOfDay? time,
    required bool enabled,
    required VoidCallback onTap,
  }) {
    final text = time == null ? '' : time.format(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      textDirection: TextDirection.rtl,
      children: [
        Text(
          label,
          style: TextStyle(
             fontSize: 12,
             color: Colors.grey[600],
          ),
          textDirection: TextDirection.rtl,
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: enabled ? onTap : null,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Colors.grey[200]!,
              ),
            ),
            child: Row(
              textDirection: TextDirection.rtl,
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      text,
                      style: TextStyle(
                        fontSize: 14,
                        color: enabled ? Colors.black : Colors.grey[400],
                        fontWeight: FontWeight.w500,
                      ),
                      textDirection: TextDirection.ltr,
                    ),
                  ),
                ),
                Icon(
                  Icons.access_time, 
                  size: 18, 
                  color: enabled ? Colors.grey[400] : Colors.grey[300]
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _DayHours {
  final String name;
  bool enabled;
  TimeOfDay? from;
  TimeOfDay? to;

  _DayHours({
    required this.name,
    this.enabled = true,
  });
}


