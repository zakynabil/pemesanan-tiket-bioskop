import 'tiket.dart';

// tiket kelas reguler, cuma punya nomor kursi biasa
class TiketReguler extends Tiket {
  String nomorKursi;

  TiketReguler(String judulFilm, double harga, String jamTayang, this.nomorKursi)
      : super(judulFilm, harga, jamTayang);

  @override
  void tampilkanInfo() {
    print(
        '[REGULER] $judulFilm | Jam: $jamTayang | Kursi: $nomorKursi | Harga: Rp${harga.toStringAsFixed(0)}');
  }
}
