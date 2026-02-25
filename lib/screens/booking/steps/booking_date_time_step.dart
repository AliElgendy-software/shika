import 'package:flutter/material.dart';

class BookingDateTimeStep extends StatefulWidget {
  final Function(DateTime date, String time) onDateTimeSelected;

  const BookingDateTimeStep({super.key, required this.onDateTimeSelected});

  @override
  State<BookingDateTimeStep> createState() => _BookingDateTimeStepState();
}

class _BookingDateTimeStepState extends State<BookingDateTimeStep> {
  DateTime _selectedDate = DateTime.now();
  String? _selectedTime;

  final List<String> _timeSlots = [
    '09:00 صباحاً', '10:00 صباحاً', '11:00 صباحاً',
    '12:00 ظهراً', '01:00 مساءً', '02:00 مساءً',
    '03:00 مساءً', '04:00 مساءً', '05:00 مساءً',
    '06:00 مساءً', '07:00 مساءً', '08:00 مساءً',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'اختر التاريخ',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 12),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: CalendarDatePicker(
              initialDate: _selectedDate,
              firstDate: DateTime.now(),
              lastDate: DateTime.now().add(const Duration(days: 30)),
              onDateChanged: (date) {
                setState(() {
                  _selectedDate = date;
                  // Reset time if needed or keep it
                });
                _updateSelection();
              },
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'اختر الوقت',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: _timeSlots.map((time) {
              final isSelected = _selectedTime == time;
              return InkWell(
                onTap: () {
                  setState(() {
                    _selectedTime = time;
                  });
                  _updateSelection();
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    color: isSelected ? const Color(0xFF00A63E) : Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: isSelected ? const Color(0xFF00A63E) : Colors.grey[300]!,
                    ),
                  ),
                  child: Text(
                    time,
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black,
                      fontSize: 12,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  void _updateSelection() {
    if (_selectedTime != null) {
      widget.onDateTimeSelected(_selectedDate, _selectedTime!);
    }
  }
}
