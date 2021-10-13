import 'package:intl/intl.dart';

class DataModel {
  DataModel(
      {required this.harga,
      required this.tglTransaksi,
      required this.warna,
      required this.jarakMeter,
      required this.lokasi});

  final int harga;
  final String tglTransaksi;
  final String warna;
  final int jarakMeter;
  final String lokasi;

  String get convertTime {
    var newDateFormat = DateFormat('dd-MM-yyyy');
    DateTime parseDt = DateTime.parse(tglTransaksi);
    var newDate = newDateFormat.format(parseDt);
    return newDate;
  }

  String get convertMonthYear {
    var newDateFormat = DateFormat('MM-yyyy');
    DateTime parseDt = DateTime.parse(tglTransaksi);
    var newDate = newDateFormat.format(parseDt);
    return newDate;
  }
}
