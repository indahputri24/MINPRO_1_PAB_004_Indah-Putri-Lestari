import 'package:flutter/material.dart';
import '../../../models/transaksi.dart';

class ListTransaksi extends StatelessWidget {
  final List<ModelTransaksi> transaksi;
  final Function(ModelTransaksi) editTransaksi;
  final Function(ModelTransaksi) hapusTransaksi;

  const ListTransaksi({
    super.key,
    required this.transaksi,
    required this.editTransaksi,
    required this.hapusTransaksi,
  });

  @override
  Widget build(BuildContext context) {
    if (transaksi.isEmpty) {
      return Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Center(
          child: Text(
            "Tidak ada transaksi di tanggal ini",
            style: TextStyle(
              color: Colors.black54,
            ),
          ),
        ),
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: transaksi.length,
      itemBuilder: (context, index) {
        final trx = transaksi[index];
        final isIncome = trx.tipe == "Pemasukan";

        return Container(
          margin:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(18, 0, 0, 0),
                blurRadius: 10,
              ),
            ],
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: 26,
                backgroundColor: isIncome
                    ? Colors.green.shade100
                    : Colors.pink.shade100,
                child: Icon(
                  isIncome
                      ? Icons.arrow_downward
                      : Icons.fastfood,
                  color: isIncome
                      ? Colors.green
                      : const Color(0xFFE91E63),
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Text(trx.keterangan,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text(trx.kategori,
                        style: const TextStyle(
                            color: Colors.black54)),
                    if (trx.catatan != null && trx.catatan!.isNotEmpty) ...[
                      const SizedBox(height: 4),
                      Text(
                        trx.catatan!,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black45,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              Text(
                isIncome
                    ? "+Rp${trx.jumlah}"
                    : "-Rp${trx.jumlah}",
                style: TextStyle(
                  color:
                      isIncome ? Colors.green : Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () => editTransaksi(trx),
              ),
              IconButton(
                icon: const Icon(Icons.delete,
                    color: Colors.red),
                onPressed: () => hapusTransaksi(trx),
              ),
            ],
          ),
        );
      },
    );
  }
}