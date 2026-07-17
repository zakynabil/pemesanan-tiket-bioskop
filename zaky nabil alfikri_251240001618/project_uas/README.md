# UAS Pemrograman Berorientasi Objek (Dart)

**Nama**:Zaky Nabil Al Fikri
**NIM**: 251240001618
**Tema**: Sistem Pemesanan Tiket Bioskop

## Tentang Aplikasi
Aplikasi ini adalah program CLI (terminal) sederhana untuk memesan tiket
bioskop. User bisa menambahkan data tiket (Reguler atau VIP), melihat
semua data, mencari data berdasarkan judul film, menghitung total
pendapatan, dan menyimpan data (simulasi).

## Fitur Program
1. Tambah Data - menambahkan tiket baru (reguler/VIP)
2. Lihat Semua Data - menampilkan semua tiket yang sudah dipesan
3. Cari Data - mencari tiket berdasarkan judul film
4. Hitung Total - menghitung total pendapatan + ringkasan data
5. Simpan Data - simulasi penyimpanan data (async/await)
6. Keluar - keluar dari program

## Konsep OOP yang Dipakai
- **Class & Object** : Tiket, TiketReguler, TiketVIP, ManajerTiket
- **Encapsulation** : field private (_judulFilm, _harga, dll) dengan getter/setter + validasi
- **Inheritance** : TiketReguler dan TiketVIP adalah turunan dari class abstract Tiket
- **Polymorphism** : method tampilkanInfo() di-override beda-beda di tiap turunan, disimpan dalam List<Tiket>
- **Collection** : List<Tiket>, Set<String> (judul film unik), Map<String, int> (jumlah pesanan per film)
- **Higher Order Function** : .where(), .fold(), .any(), .every(), .map()
- **Exception Handling** : custom exception DataTidakValidException + try-catch
- **Async/Await** : method simpanData() pakai Future.delayed()

## Struktur Folder
```
project_uas/
├── bin/
│   └── main.dart
├── lib/
│   ├── models/
│   │   ├── tiket.dart
│   │   ├── tiket_reguler.dart
│   │   └── tiket_vip.dart
│   ├── controllers/
│   │   └── manajer_tiket.dart
│   └── exceptions/
│       └── data_tidak_valid_exception.dart
├── pubspec.yaml
└── README.md
```

## Cara Menjalankan Program
1. Pastikan Dart SDK sudah terinstall di komputer.
2. Buka terminal, masuk ke folder `project_uas`.
3. Jalankan perintah:
   ```
   dart run bin/main.dart
   ```
4. Ikuti menu yang muncul di terminal.
