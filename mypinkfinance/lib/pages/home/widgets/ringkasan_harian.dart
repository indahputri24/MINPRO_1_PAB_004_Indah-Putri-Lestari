import 'package:flutter/material.dart';

class RingkasanHarian extends StatelessWidget {
  final int pemasukan;
  final int pengeluaran;
  final int selisih;

  const RingkasanHarian({
    super.key,
    required this.pemasukan,
    required this.pengeluaran,
    required this.selisih,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
          horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.pink.shade50,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          item("Pemasukan hari ini", pemasukan, Colors.green),
          item("Pengeluaran hari ini", pengeluaran, Colors.red),
          item("Selisih", selisih,
              selisih < 0 ? Colors.red : Colors.green),
        ],
      ),
    );
  }

  Widget item(String title, int value, Color color) {
    return Column(
      children: [
        Text(title,
            style:
                const TextStyle(fontWeight: FontWeight.w500)),
        const SizedBox(height: 5),
        Text(
          "Rp$value",
          style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}