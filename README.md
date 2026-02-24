<img width="594" height="731" alt="image" src="https://github.com/user-attachments/assets/160aabf4-1ac2-47aa-bdd1-d35b17908848" /><img width="594" height="731" alt="image" src="https://github.com/user-attachments/assets/160aabf4-1ac2-47aa-bdd1-d35b17908848" /># Mini Project 1 Praktikum Pemrograman Aplikasi Bergerak

Nama: Indah Putri Lestari

NIM: 2409116004

## Deskripsi Aplikasi Catatan Keuangan (MY PINK FINCARE)

Aplikasi Catatan Keuangan merupakan aplikasi mobile berbasis Flutter yang dirancang untuk membantu pengguna dalam mencatat dan mengelola keuangan pribadi secara praktis dan terstruktur. Aplikasi ini memfasilitasi pencatatan pemasukan dan pengeluaran harian sehingga pengguna dapat memantau kondisi keuangan mereka dengan lebih terkontrol.

Pada Aplikasi ini pengguna dapat:
1. Menambahkan data pemasukan
2. Menambahkan data pengeluaran
3. Melihat ringkasan keuangan hari ini
4. Melihat total keseluruhan saldo

## Fitur Aplikasi

Aplikasi Catatan Keuangan ini memiliki beberapa fitur utama sebagai berikut:

### 1. Tambah Data Transaksi (Create)
Pengguna dapat menambahkan data transaksi berupa pemasukan atau pengeluaran. Fitur ini memudahkan pengguna untuk mencatat setiap aktivitas keuangan secara langsung.
Dalam satu form terdapat enam input, seperti:

- 4 TextField, yaitu: Jumlah nominal, Keterangan, Tanggal, dan Catatan Tambahan (Opsional).
  
- 2 DropdownButtonFormField, yaitu Tipe Pemasukan/Pengeluaran dan Kategori transaksi.

<img width="3200" height="2000" alt="image" src="https://github.com/user-attachments/assets/4224c335-0163-471f-ace5-a66ea2ffd0c1" />

#### Validasi Input Setiap Kolom

##### a. Jumlah Nominal

Kolom Jumlah memiliki sistem validasi untuk memastikan data yang dimasukkan pengguna sesuai dan logis. Validasi ini membantu mencegah kesalahan input, seperti salah ketik atau memasukkan data yang tidak realistis, sehingga data keuangan yang tersimpan tetap valid dan dapat dipercaya.

Beberapa kondisi validasi yang diterapkan adalah:

1. Tidak boleh kosong. Jika pengguna tidak mengisi kolom jumlah, maka akan muncul pesan: "Jumlah wajib diisi"

<img width="3200" height="2000" alt="image" src="https://github.com/user-attachments/assets/df5b762f-465e-4679-9529-28e0f007619f" />


2. Hanya menerima angka. Jika pengguna memasukkan huruf atau karakter selain angka, maka sistem akan menampilkan pesan: "Jumlah hanya boleh angka"

<img width="3200" height="2000" alt="image" src="https://github.com/user-attachments/assets/28385184-7aa1-4d7c-af89-8e90bdd5df53" />


3. Batas inputan nilai maksimal. Jika nominal yang dimasukkan terlalu besar dan tidak wajar (misalnya miliaran atau triliunan), maka sistem akan menampilkan pesan: "Jumlah terlalu besar, tidak wajar"

<img width="3200" height="2000" alt="image" src="https://github.com/user-attachments/assets/154cb1c9-0969-45e4-a1c5-5a873c1e21d4" />


##### b. Keterangan
 
Kolom Keterangan memiliki validasi untuk memastikan pengguna tidak mengosongkan deskripsi transaksi.
Jika kolom ini tidak diisi, sistem akan menampilkan pesan: “Keterangan wajib diisi”.

Validasi ini bertujuan agar setiap transaksi memiliki penjelasan yang jelas, sehingga pengguna dapat memahami tujuan atau detail pengeluaran maupun pemasukan saat melihat riwayat transaksi di kemudian hari.

<img width="3200" height="2000" alt="image" src="https://github.com/user-attachments/assets/307406fa-a20f-4a4e-9482-d2aeeefba4e3" />

##### C. Tanggal

Pada kolom Tanggal, aplikasi menggunakan fitur date picker untuk memilih tanggal transaksi melalui tampilan kalender. Fitur ini membantu memastikan format tanggal selalu benar dan menghindari kesalahan input manual.

<img width="3200" height="2000" alt="image" src="https://github.com/user-attachments/assets/f1fd99a4-cff3-434e-954c-7e17e00427f5" />

##### d. Tipe

Pada kolom Tipe, pengguna dapat memilih jenis transaksi melalui menu dropdown yang tersedia, yaitu: Pengeluaran atau Pemasukan.
Fitur ini berfungsi untuk mengelompokkan transaksi berdasarkan arus kas masuk atau keluar. Dengan pemisahan ini, sistem dapat menghitung total pemasukan dan total pengeluaran secara terpisah sehingga saldo akhir dapat ditampilkan dengan lebih akurat.
Penggunaan dropdown juga mencegah kesalahan input karena pengguna hanya dapat memilih opsi yang telah disediakan.

<img width="3200" height="2000" alt="image" src="https://github.com/user-attachments/assets/8c01dbfc-1b64-47b6-b04c-46e53e7dcbe4" />

##### e. Kategori

Kolom Kategori digunakan untuk mengelompokkan transaksi sesuai jenisnya.
Kategori akan menyesuaikan dengan tipe transaksi yang dipilih:
- Jika memilih Pemasukan, kategori yang tersedia seperti: Gaji, Bonus, Freelance, Hadiah
- Jika memilih Pengeluaran, kategori yang tersedia seperti: Makan, Transport, Belanja, Hiburan

Fitur ini membantu pengguna mengelompokkan transaksi agar lebih terstruktur dan memudahkan dalam melihat pola pemasukan maupun pengeluaran.

<img width="3200" height="2000" alt="image" src="https://github.com/user-attachments/assets/4668c779-7bac-4918-8f4b-e341a72eefa2" />

<img width="3200" height="2000" alt="image" src="https://github.com/user-attachments/assets/ff45463d-e44a-4275-a716-c64290f1c7f0" />


##### f. Catatan Tambahan (Opsional)

Kolom Catatan Tambahan digunakan untuk menuliskan informasi tambahan terkait transaksi. Field ini bersifat opsional, sehingga pengguna boleh mengisinya atau mengosongkannya tanpa mempengaruhi proses penyimpanan data.

<img width="3200" height="2000" alt="image" src="https://github.com/user-attachments/assets/8960dc1b-511a-41d0-9cbf-d52355d9e585" />


### 2. Tampilkan Data Transaksi (Read)

Halaman utama menampilkan data transaksi dalam bentuk daftar (list)
Di bagian atas terdapat tampilan kalender yang menunjukkan bulan dan tanggal aktif.
Tanggal yang dipilih akan menyesuaikan data transaksi yang ditampilkan.

Setiap transaksi ditampilkan dalam bentuk kartu (card) yang berisi:
- Nama/keterangan transaksi
- Kategori transaksi
- Nominal (ditampilkan dengan tanda + untuk pemasukan dan – untuk pengeluaran)
- Ikon sesuai jenis transaksi

Di sisi kanan terdapat tombol:
- Edit untuk mengubah data transaksi
- Hapus untuk menghapus transaksi

<img width="3200" height="2000" alt="image" src="https://github.com/user-attachments/assets/e613525a-96a7-4e95-887f-6b6513b265c1" />


### 3. Hapus Data Transaksi (Delete)

#### Sebelum Hapus Data Transaksi

Disini saya ingin menghapus data pemasukan Freelance dengan nominal Rp700000.

<img width="3200" height="2000" alt="image" src="https://github.com/user-attachments/assets/38dac631-e270-40e1-8af5-f73f6e53ba0c" />

#### Sesudah Hapus Data Transaksi

<img width="3200" height="2000" alt="image" src="https://github.com/user-attachments/assets/a4c576e1-cd82-46de-96f0-c2a9e768bfe9" />

### 4. Edit Data Transaksi (Update)

#### Sebelum Edit data

Disini saya ingin mengubah data pengeluaran transaki Gacoan.

<img width="3200" height="2000" alt="image" src="https://github.com/user-attachments/assets/78955550-3326-4e54-9427-9e5a9d1bb677" />

#### Proses Edit data

Lalu saya mengedit data pada kolom jumlah nominal, keterangan transaksi, dan ada catatan tambahan.

<img width="3200" height="2000" alt="image" src="https://github.com/user-attachments/assets/694df667-2f85-4701-82c6-efb5f7e90b55" />

#### Sesudah Edit data

- Jumlah nominal dari Rp20000 menjadi Rp50000
- Keterangan dari Gacoan menjadi Mie Gacoan
- Catatan Tambahan yang awalnya kosong menjadi lokasi M.Yamin

<img width="3200" height="2000" alt="image" src="https://github.com/user-attachments/assets/f0a6a409-3f1a-43e3-a0f8-9ade94842f0f" />

### 4. Ringkasan Keuangan Hari Ini

Bagian Ringkasan Hari Ini menampilkan total transaksi pada tanggal yang dipilih, yang terdiri dari:
- Pemasukan hari ini: total seluruh uang masuk hari ini
- Pengeluaran hari ini: total seluruh uang keluar hari ini
- Selisih: hasil perhitungan pemasukan dikurangi pengeluaran

Fitur ini membantu pengguna melihat kondisi keuangan harian secara cepat tanpa perlu menghitung secara manual.

<img width="3200" height="2000" alt="image" src="https://github.com/user-attachments/assets/c3d790c6-9600-415d-862c-7f441eb82e00" />


### 5. Total Keseluruhan Keuangan

Bagian Total Keseluruhan Keuangan menampilkan rekap seluruh transaksi dalam rentang tanggal yang dipilih, yang terdiri dari:
- Total: saldo akhir (hasil pemasukan dikurangi pengeluaran)
- Pemasukan: jumlah seluruh uang masuk
- Pengeluaran: jumlah seluruh uang keluar

Fitur ini membantu pengguna melihat kondisi keuangan secara menyeluruh tanpa harus menghitung satu per satu transaksi yang ada.

<img width="3200" height="2000" alt="image" src="https://github.com/user-attachments/assets/261dee81-2246-4152-9b9e-8f8783b4aca8" />

## Widget yang Digunakan

### A. Core Flutter Widgets

1. Scaffold: sebagai kerangka utama setiap halaman yang menyediakan AppBar, body, dan FloatingActionButton.
2. AppBar: digunakan untuk menampilkan judul halaman seperti “My Pink Finance” dan “Tambah Transaksi”.
3. SafeArea: menjaga tampilan agar tidak tertutup notch atau status bar.
4. SingleChildScrollView: membuat seluruh halaman Home bisa discroll.
5. TextFormField: digunakan untuk input data seperti jumlah nominal, keterangan, dan catatan tambahan dengan validasi input.
6. DropdownButtonFormField: digunakan untuk memilih tipe transaksi (Pemasukan/Pengeluaran) dan kategori transaksi.
7. ElevatedButton: sebagai tombol untuk menyimpan data transaksi.
8. Container: digunakan untuk styling seperti warna, padding, border radius, dan shadow pada kartu transaksi dan ringkasan.
9. Icon dan IconButton: digunakan untuk menampilkan ikon kategori serta tombol edit dan hapus transaksi.
10. FloatingActionButton: sebagai tombol tambah transaksi di halaman utama yang mengarahkan ke halaman input.
11. showDatePicker: digunakan untuk memilih tanggal transaksi melalui tampilan kalender.
12. ListView.builder: menampilkan daftar transaksi berdasarkan tanggal yang dipilih.
13. CircleAvatar: menampilkan ikon kategori transaksi dalam bentuk lingkaran.
14. Column: menyusun komponen seperti header, ringkasan, kalender, dan list secara vertikal.

### B. GetX Widgets

Digunakan untuk mengatur state dan navigasi aplikasi.

1. GetMaterialApp: mengaktifkan fitur GetX dalam aplikasi.
2. Obx: membuat tampilan otomatis berubah saat data di controller berubah.
3. GetxController: menyimpan data transaksi dan menghitung total pemasukan, pengeluaran, serta selisih.
4: Get.to(): digunakan untuk berpindah halaman tanpa perlu context.

### C. Widget dari Package Eksternal

Dalam aplikasi ini terdapat TableCalendar, yang digunakan untuk menampilkan kalender interaktif. Kalender ini pengguna dapat memilih tanggal tertentu untuk memfilter transaksi harian.

### D. Custom Widget

<img width="594" height="731" alt="image" src="https://github.com/user-attachments/assets/e63ebbcd-f938-4f73-95c1-8ad411570b01" />

Struktur tersebut dibuat untuk memisahkan antara tampilan (UI), logic, dan model data agar kode lebih mudah dibaca, dikembangkan, dan dikelola. Isi di dalam folder widget sebagai berikut:

1. Header: menampilkan judul halaman utama.
2. RangeTanggal: memilih rentang tanggal filter.
3. RingkasanKeseluruhan: menampilkan total saldo, pemasukan, dan pengeluaran seluruh transaksi.
4. Kalendar: pembungkus TableCalendar agar lebih modular.
5. RingkasanHarian: menampilkan pemasukan, pengeluaran, dan selisih berdasarkan tanggal dipilih.
6. ListTransaksi: menampilkan daftar transaksi lengkap dengan tombol edit dan hapus.
