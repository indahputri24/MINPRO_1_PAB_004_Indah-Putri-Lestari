import 'package:flutter/material.dart';
import 'package:mypinkfinance/models/transaksi.dart';
import 'package:get/get.dart';

class AddPage extends StatefulWidget {
  final ModelTransaksi? existingData;

  const AddPage({super.key, this.existingData});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController jumlahController;
  late TextEditingController keteranganController;
  late TextEditingController tanggalController;
  late TextEditingController catatanController;

  DateTime pilihTanggal = DateTime.now();
  String pilihTipe = "Pengeluaran";
  String pilihKategori = "Makan";

  final Map<String, IconData> kategoriPengeluaran = {
    "Makan": Icons.fastfood,
    "Transport": Icons.directions_car,
    "Belanja": Icons.shopping_bag,
    "Hiburan": Icons.sports_esports,
  };

  final Map<String, IconData> kategoriPemasukan = {
    "Gaji": Icons.work,
    "Bonus": Icons.card_giftcard,
    "Freelance": Icons.laptop,
    "Hadiah": Icons.redeem,
  };

  Map<String, IconData> get kategoriSaatIni =>
      pilihTipe == "Pengeluaran"
          ? kategoriPengeluaran
          : kategoriPemasukan;

  @override
  void initState() {
    super.initState();

    jumlahController = TextEditingController();
    keteranganController = TextEditingController();
    tanggalController = TextEditingController();
    catatanController = TextEditingController();

    if (widget.existingData != null) {
      final data = widget.existingData!;
      jumlahController.text = data.jumlah;
      keteranganController.text = data.keterangan;
      pilihTanggal = data.tanggal;
      pilihTipe = data.tipe;
      pilihKategori = data.kategori;
    }

    _updateTanggalText();
  }

  void _updateTanggalText() {
    tanggalController.text =
        "${pilihTanggal.day}/${pilihTanggal.month}/${pilihTanggal.year}";
  }

  Future<void> pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: pilihTanggal,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );

    if (picked != null) {
      setState(() {
        pilihTanggal = picked;
        _updateTanggalText();
      });
    }
  }

  void simpanData() {
    if (!_formKey.currentState!.validate()) return;

    final transaksiBaru = ModelTransaksi(
      jumlah: jumlahController.text,
      keterangan: keteranganController.text,
      tanggal: pilihTanggal,
      kategori: pilihKategori,
      tipe: pilihTipe,
      catatan: catatanController.text.isEmpty
        ? null
        : catatanController.text,
    );

    Get.back(result: transaksiBaru);
  }

  @override
  Widget build(BuildContext context) {
    final isIncome = pilihTipe == "Pemasukan";

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF6B9C),
        title: Text(
          widget.existingData == null
              ? "Tambah Transaksi"
              : "Edit Transaksi",
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white, 
        ),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 420),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                children: [

                  // JUMLAH
                  TextFormField(
                    controller: jumlahController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Jumlah",
                      prefixText: "Rp ",
                      border: OutlineInputBorder(),
                    ),
                    validator: (nilai) {
                      if (nilai == null || nilai.isEmpty) {
                        return "Jumlah wajib diisi";
                      }
                      if (!RegExp(r'^[0-9]+$').hasMatch(nilai)) {
                        return "Jumlah hanya boleh angka";
                      }
                      final jumlah = int.parse(nilai);
                      if (jumlah <= 0) {
                        return "Jumlah harus lebih dari 0";
                      }
                      if (jumlah > 100000000) {
                        return "Jumlah terlalu besar, tidak wajar";
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 20),

                  // KETERANGAN
                  TextFormField(
                    controller: keteranganController,
                    decoration: const InputDecoration(
                      labelText: "Keterangan",
                      border: OutlineInputBorder(),
                    ),
                    validator: (nilai) =>
                        nilai!.isEmpty ? "Keterangan wajib diisi" : null,
                  ),

                  const SizedBox(height: 20),

                  // TANGGAL
                  TextFormField(
                    controller: tanggalController,
                    readOnly: true,
                    onTap: pickDate,
                    decoration: const InputDecoration(
                      labelText: "Tanggal",
                      suffixIcon: Icon(Icons.calendar_today),
                      border: OutlineInputBorder(),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // TIPE
                  DropdownButtonFormField<String>(
                    initialValue: pilihTipe,
                    decoration: const InputDecoration(
                      labelText: "Tipe",
                      border: OutlineInputBorder(),
                    ),
                    items: ["Pengeluaran", "Pemasukan"]
                        .map((type) => DropdownMenuItem(
                              value: type,
                              child: Text(type),
                            ))
                        .toList(),
                    onChanged: (nilai) {
                      setState(() {
                        pilihTipe = nilai!;
                        pilihKategori =
                            kategoriSaatIni.keys.first;
                      });
                    },
                  ),

                  const SizedBox(height: 20),

                  // KATEGORI
                  DropdownButtonFormField<String>(
                    initialValue: pilihKategori,
                    decoration: const InputDecoration(
                      labelText: "Kategori",
                      border: OutlineInputBorder(),
                    ),
                    items: kategoriSaatIni.keys.map((kategori) {
                      return DropdownMenuItem(
                        value: kategori,
                        child: Row(
                          children: [
                            Icon(
                              kategoriSaatIni[kategori],
                              color: isIncome
                                  ? Colors.green
                                  : Colors.pink,
                            ),
                            const SizedBox(width: 10),
                            Text(kategori),
                          ],
                        ),
                      );
                    }).toList(),
                    onChanged: (nilai) {
                      setState(() {
                        pilihKategori = nilai!;
                      });
                    },
                  ),

                  const SizedBox(height: 25),

                  // CATATAN TAMBAHAN (OPSIONAL)
                  TextFormField(
                    controller: catatanController,
                    maxLines: 2,
                    decoration: InputDecoration(
                      labelText: "Catatan Tambahan (Opsional)",
                      border: OutlineInputBorder(),
                      alignLabelWithHint: true,
                    ),
                  ),

                  const SizedBox(height: 25),

                  // BUTTON SIMPAN
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          const Color(0xFFF06292),
                      foregroundColor: Colors.white,
                      minimumSize:
                          const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: simpanData,
                    child: const Text("SIMPAN"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}