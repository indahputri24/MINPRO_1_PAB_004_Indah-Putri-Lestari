import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Kalendar extends StatelessWidget {
  final DateTime pilihHari;
  final DateTime fokusHari;
  final Function(DateTime, DateTime) hariDipilih;

  const Kalendar({
    super.key,
    required this.pilihHari,
    required this.fokusHari,
    required this.hariDipilih,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(18, 0, 0, 0),
            blurRadius: 10,
          )
        ],
      ),
      child: TableCalendar(
        focusedDay: fokusHari,
        firstDay: DateTime(2020),
        lastDay: DateTime(2030),
        selectedDayPredicate: (day) =>
            isSameDay(day, pilihHari),
        onDaySelected: hariDipilih,
        headerStyle: const HeaderStyle(
          formatButtonVisible: false,
          titleTextStyle: TextStyle(
            color: Color(0xFFE91E63),
            fontWeight: FontWeight.bold,
          ),
        ),
        calendarStyle: CalendarStyle(
          selectedDecoration: const BoxDecoration(
            color: Color(0xFFE91E63),
            shape: BoxShape.circle,
          ),
          selectedTextStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          todayDecoration: BoxDecoration(
            color: Colors.pink.shade100,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}