import '../models/tiket.dart';
import '../models/tiket_vip.dart';

// class ini yang ngatur semua data tiket
// (tambah, lihat, cari, hitung, simpan)
class ManajerTiket {
  // pake List buat nyimpen semua object tiket (polymorphism di sini,
  // isinya bisa TiketReguler atau TiketVIP)
  final List<Tiket> _daftarTiket = [];

  // pake Set buat nyimpen judul film yang unik aja (gak boleh dobel)
  final Set<String> _daftarJudulFilm = {};

  // pake Map buat itung berapa kali film itu dipesan
  final Map<String, int> _jumlahPesanan = {};

  void tambah(Tiket tiket) {
    _daftarTiket.add(tiket);
    _daftarJudulFilm.add(tiket.judulFilm);

    // update jumlah pesanan per judul film
    if (_jumlahPesanan.containsKey(tiket.judulFilm)) {
      _jumlahPesanan[tiket.judulFilm] = _jumlahPesanan[tiket.judulFilm]! + 1;
    } else {
      _jumlahPesanan[tiket.judulFilm] = 1;
    }
  }

  void tampilkanSemua() {
    if (_daftarTiket.isEmpty) {
      print('Belum ada data tiket.');
      return;
    }
    for (var tiket in _daftarTiket) {
      tiket.tampilkanInfo();
    }
  }

  // cari tiket berdasarkan judul film pake .where() (higher order function)
  void cari(String keyword) {
    var hasil = _daftarTiket
        .where((t) => t.judulFilm.toLowerCase().contains(keyword.toLowerCase()))
        .toList();

    if (hasil.isEmpty) {
      print('Tiket dengan judul "$keyword" tidak ditemukan.');
      return;
    }
    for (var tiket in hasil) {
      tiket.tampilkanInfo();
    }
  }

  // total pendapatan pake .fold() (higher order function)
  double hitungTotal() {
    return _daftarTiket.fold(0, (total, tiket) => total + tiket.harga);
  }

  // sekalian cek beberapa hal pake HOF lain, buat ditampilin waktu hitung total
  void tampilkanRingkasan() {
    bool adaTiketVip = _daftarTiket.any((t) => t is TiketVIP);
    bool semuaHargaValid = _daftarTiket.every((t) => t.harga >= 0);
    var daftarJudulSaja = _daftarTiket.map((t) => t.judulFilm).toSet();

    print('--- Ringkasan ---');
    print('Jumlah tiket terjual : ${_daftarTiket.length}');
    print('Film berbeda         : ${daftarJudulSaja.length}');
    print('Ada tiket VIP?       : ${adaTiketVip ? "Ya" : "Tidak"}');
    print('Semua harga valid?   : ${semuaHargaValid ? "Ya" : "Tidak"}');
    print('Judul film terdaftar : $_daftarJudulFilm');
    print('Jumlah pesanan/film  : $_jumlahPesanan');
  }

  // simulasi simpan data ke "database" pake async/await
  Future<void> simpanData() async {
    print('Menyimpan data tiket...');
    await Future.delayed(Duration(seconds: 2));
    print('Data berhasil disimpan.');
  }
}
