import 'package:flutter/material.dart';

class RingkasanKeseluruhan extends StatelessWidget {
  final int total;
  final int pemasukan;
  final int pengeluaran;

  const RingkasanKeseluruhan({
    super.key,
    required this.total,
    required this.pemasukan,
    required this.pengeluaran,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(vertical: 25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(18, 0, 0, 0),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          item(Icons.account_balance_wallet, "Total",
              total, total < 0 ? Colors.red : Colors.green),
          item(Icons.arrow_downward, "Pemasukan",
              pemasukan, Colors.green),
          item(Icons.arrow_upward, "Pengeluaran",
              pengeluaran, Colors.red),
        ],
      ),
    );
  }

  Widget item(
      IconData icon, String title, int value, Color color) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.15),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: color),
        ),
        const SizedBox(height: 10),
        Text(
          "Rp$value",
          style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold),
        ),
        Text(title,
            style:
                const TextStyle(color: Colors.black54)),
      ],
    );
  }
}