import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../home/home_controller.dart';
import '../../models/transaksi.dart';
import '../add_page/add_page.dart';
import 'widgets/header.dart';
import 'widgets/range_tanggal.dart';
import 'widgets/ringkasan_keseluruhan.dart';
import 'widgets/kalendar.dart';
import 'widgets/ringkasan_harian.dart';
import 'widgets/list_transaksi.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final controller = Get.put(HomeController());

  Future<void> bukaHalTambah([ModelTransaksi? data]) async {
    final result = await Get.to(
      () => AddPage(existingData: data),
    );

    if (result != null) {
      controller.tambahAtauEdit(result, data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff6f6f6),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFFF4D88),
        onPressed: () => bukaHalTambah(),
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: Obx(
          () => SingleChildScrollView(
            child: Column(
              children: [
                const Header(),
                
                RangeTanggal(
                  tanggalAwal: controller.tanggalAwal.value,
                  tanggalAkhir: controller.tanggalAkhir.value,
                  ubahTanggalAwal: controller.ubahTanggalAwal,
                  ubahTanggalAkhir: controller.ubahTanggalAkhir,
                ),

                RingkasanKeseluruhan(
                  total: controller.totalPemasukan -
                        controller.totalPengeluaran,
                  pemasukan: controller.totalPemasukan,
                  pengeluaran: controller.totalPengeluaran,
                ),
                const SizedBox(height: 15),

                Kalendar(
                  pilihHari: controller.pilihHari.value,
                  fokusHari: controller.fokusHari.value,
                  hariDipilih: controller.ubahHari,
                ),

                if (controller.filterTransaksi.isNotEmpty)
                  RingkasanHarian(
                    pemasukan: controller.totalPemasukanHariIni,
                    pengeluaran: controller.totalPengeluaranHariIni,
                    selisih: controller.selisihHariIni,
                  ),
                  
                ListTransaksi(
                    transaksi: controller.filterTransaksi,
                    editTransaksi: bukaHalTambah,
                    hapusTransaksi: controller.hapus,
                ),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
    );
  }
}