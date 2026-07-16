import 'tiket.dart';

// tiket VIP, ada tambahan fasilitas kayak snack gratis dll
class TiketVIP extends Tiket {
  String fasilitasTambahan;

  TiketVIP(String judulFilm, double harga, String jamTayang, this.fasilitasTambahan)
      : super(judulFilm, harga, jamTayang);

  @override
  void tampilkanInfo() {
    print(
        '[VIP] $judulFilm | Jam: $jamTayang | Fasilitas: $fasilitasTambahan | Harga: Rp${harga.toStringAsFixed(0)}');
  }
}
