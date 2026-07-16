// custom exception buat data yang gak valid
// misal harga negatif atau judul film kosong

class DataTidakValidException implements Exception {
  final String pesan;

  DataTidakValidException(this.pesan);

  @override
  String toString() => 'DataTidakValidException: $pesan';
}
