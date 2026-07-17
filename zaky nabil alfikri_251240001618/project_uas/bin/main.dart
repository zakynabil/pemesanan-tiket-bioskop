import 'dart:io';
import '../lib/models/tiket_reguler.dart';
import '../lib/models/tiket_vip.dart';
import '../lib/controllers/manajer_tiket.dart';
import '../lib/exceptions/data_tidak_valid_exception.dart';

// Program : Sistem Pemesanan Tiket Bioskop
// Nama    : Zaky Nabil Al Fikri
// NIM     : 251240001618

final manajer = ManajerTiket();

void main() async {
  bool jalan = true;

  // kasih 1 data contoh biar pas awal buka program gak kosong2 amat
  try {
    manajer.tambah(TiketReguler('Avengers: Doomsday', 35000, '19:00', 'C5'));
    manajer.tambah(TiketVIP('Avatar 3', 75000, '20:30', 'Snack + Kursi Recliner'));
  } catch (e) {
    print(e);
  }

  while (jalan) {
    tampilkanMenu();
    String? pilihan = stdin.readLineSync();

    switch (pilihan) {
      case '1':
        tambahData();
        break;
      case '2':
        print('\n=== Semua Data Tiket ===');
        manajer.tampilkanSemua();
        break;
      case '3':
        cariData();
        break;
      case '4':
        print('\nTotal pendapatan: Rp${manajer.hitungTotal().toStringAsFixed(0)}');
        manajer.tampilkanRingkasan();
        break;
      case '5':
        await manajer.simpanData();
        break;
      case '6':
        print('Terima kasih sudah pakai aplikasi ini. Sampai jumpa!');
        jalan = false;
        break;
      default:
        print('Pilihan tidak ada di menu, coba lagi ya.');
    }
    print('');
  }
}

void tampilkanMenu() {
  print('===== MENU PEMESANAN TIKET BIOSKOP =====');
  print('1. Tambah Data');
  print('2. Lihat Semua Data');
  print('3. Cari Data');
  print('4. Hitung Total');
  print('5. Simpan Data');
  print('6. Keluar');
  stdout.write('Pilih menu (1-6): ');
}

void tambahData() {
  try {
    stdout.write('Jenis tiket (1=Reguler, 2=VIP): ');
    String? jenis = stdin.readLineSync();

    stdout.write('Judul film: ');
    String judul = stdin.readLineSync() ?? '';

    stdout.write('Harga tiket: ');
    String? inputHarga = stdin.readLineSync();
    double harga = double.parse(inputHarga ?? '');

    stdout.write('Jam tayang (contoh 19:00): ');
    String jam = stdin.readLineSync() ?? '';

    if (jenis == '1') {
      stdout.write('Nomor kursi: ');
      String kursi = stdin.readLineSync() ?? '';
      manajer.tambah(TiketReguler(judul, harga, jam, kursi));
      print('Tiket reguler berhasil ditambahkan.');
    } else if (jenis == '2') {
      stdout.write('Fasilitas tambahan: ');
      String fasilitas = stdin.readLineSync() ?? '';
      manajer.tambah(TiketVIP(judul, harga, jam, fasilitas));
      print('Tiket VIP berhasil ditambahkan.');
    } else {
      print('Jenis tiket tidak dikenali, data tidak disimpan.');
    }
  } on DataTidakValidException catch (e) {
    // ini exception custom buatan sendiri
    print(e);
  } on FormatException {
    print('Error: harga harus berupa angka.');
  } catch (e) {
    print('Terjadi kesalahan yang tidak terduga: $e');
  }
}

void cariData() {
  stdout.write('Masukkan judul film yang dicari: ');
  String keyword = stdin.readLineSync() ?? '';
  print('\n=== Hasil Pencarian ===');
  manajer.cari(keyword);
}
