import 'package:flutter/material.dart';

class RangeTanggal extends StatelessWidget {
  final DateTime tanggalAwal;
  final DateTime tanggalAkhir;
  final Function(DateTime) ubahTanggalAwal;
  final Function(DateTime) ubahTanggalAkhir;

  const RangeTanggal({
    super.key,
    required this.tanggalAwal,
    required this.tanggalAkhir,
    required this.ubahTanggalAwal,
    required this.ubahTanggalAkhir,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () async {
            final picked = await showDatePicker(
              context: context,
              initialDate: tanggalAwal,
              firstDate: DateTime(2020),
              lastDate: DateTime(2030),
            );
            if (picked != null) ubahTanggalAwal(picked);
          },
          child: Text(
            "${tanggalAwal.day}/${tanggalAwal.month}/${tanggalAwal.year}",
            style: const TextStyle(color: Color(0xFFE91E63)),
          ),
        ),
        const Text("  -  "),
        TextButton(
          onPressed: () async {
            final picked = await showDatePicker(
              context: context,
              initialDate: tanggalAkhir,
              firstDate: DateTime(2020),
              lastDate: DateTime(2030),
            );
            if (picked != null) ubahTanggalAkhir(picked);
          },
          child: Text(
            "${tanggalAkhir.day}/${tanggalAkhir.month}/${tanggalAkhir.year}",
            style: const TextStyle(color: Color(0xFFE91E63)),
          ),
        ),
      ],
    );
  }
}