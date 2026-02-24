class ModelTransaksi {
  final String jumlah;
  final String keterangan;
  final DateTime tanggal;
  final String kategori;
  final String tipe;
  final String? catatan;

  ModelTransaksi({
    required this.jumlah,
    required this.keterangan,
    required this.tanggal,
    required this.kategori,
    required this.tipe,
    this.catatan,
  });
}