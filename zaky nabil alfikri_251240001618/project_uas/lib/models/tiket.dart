import '../exceptions/data_tidak_valid_exception.dart';

// class induk buat semua jenis tiket bioskop
// dibuat abstract soalnya tiket "polos" gak boleh dipake langsung,
// harus lewat turunannya (reguler / vip)
abstract class Tiket {
  String _judulFilm;
  double _harga;
  String _jamTayang;

  Tiket(this._judulFilm, this._harga, this._jamTayang) {
    // validasi pas awal object dibuat
    if (_judulFilm.trim().isEmpty) {
      throw DataTidakValidException('Judul film tidak boleh kosong');
    }
    if (_harga < 0) {
      throw DataTidakValidException('Harga tiket tidak boleh negatif');
    }
  }

  // getter
  String get judulFilm => _judulFilm;
  double get harga => _harga;
  String get jamTayang => _jamTayang;

  // setter dengan validasi
  set judulFilm(String value) {
    if (value.trim().isEmpty) {
      throw DataTidakValidException('Judul film tidak boleh kosong');
    }
    _judulFilm = value;
  }

  set harga(double value) {
    if (value < 0) {
      throw DataTidakValidException('Harga tiket tidak boleh negatif');
    }
    _harga = value;
  }

  set jamTayang(String value) {
    _jamTayang = value;
  }

  // ini yang bakal di-override sama class turunan (polymorphism)
  void tampilkanInfo();
}
