import 'package:get/get.dart';
import '/models/transaksi.dart';

class HomeController extends GetxController {

  var pilihHari = DateTime.now().obs;
  var fokusHari = DateTime.now().obs;
  var tanggalAwal = DateTime.now().obs;
  var tanggalAkhir = DateTime.now().obs;

  var transaksi = <ModelTransaksi>[].obs;

  List<ModelTransaksi> get filterTransaksi =>
      transaksi.where((trx) =>
          trx.tanggal.year == pilihHari.value.year &&
          trx.tanggal.month == pilihHari.value.month &&
          trx.tanggal.day == pilihHari.value.day
      ).toList();

  List<ModelTransaksi> get rangeTransaksi =>
      transaksi.where((trx) =>
          trx.tanggal.isAfter(tanggalAwal.value.subtract(const Duration(days: 1))) &&
          trx.tanggal.isBefore(tanggalAkhir.value.add(const Duration(days: 1)))
      ).toList();

  int sumByType(List<ModelTransaksi> list, String type) {
    return list
        .where((e) => e.tipe == type)
        .fold(0, (sum, e) => sum + int.parse(e.jumlah));
  }

  int get totalPemasukan =>
      sumByType(transaksi, "Pemasukan");
  int get totalPengeluaran =>
      sumByType(transaksi, "Pengeluaran");
  int get totalPemasukanHariIni =>
      sumByType(filterTransaksi, "Pemasukan");
  int get totalPengeluaranHariIni =>
      sumByType(filterTransaksi, "Pengeluaran");
  int get selisihHariIni =>
      totalPemasukanHariIni - totalPengeluaranHariIni;

  void tambahAtauEdit(ModelTransaksi data, [ModelTransaksi? lama]) {
    if (lama == null) {
      transaksi.add(data);
    } else {
      final index = transaksi.indexOf(lama);
      transaksi[index] = data;
    }
  }

  void hapus(ModelTransaksi trx) {
    transaksi.remove(trx);
  }

  void ubahHari(DateTime dipilih, DateTime fokus) {
    pilihHari.value = dipilih;
    fokusHari.value = fokus;
  }

  void ubahTanggalAwal(DateTime d) =>
      tanggalAwal.value = d;

  void ubahTanggalAkhir(DateTime d) =>
      tanggalAkhir.value = d;
}