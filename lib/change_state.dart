import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'model/data_model.dart';

class ChangeState extends ChangeNotifier {
  final List<DataModel> _mobil = [
    DataModel(
      harga: 500,
      tglTransaksi: '2015-01-31',
      warna: 'Hitam',
      jarakMeter: 12000,
      lokasi: 'Surabaya',
    ),
    DataModel(
      harga: 400,
      tglTransaksi: '2016-11-30',
      warna: 'Putih',
      jarakMeter: 10000,
      lokasi: 'DKI Jakarta',
    ),
    DataModel(
      harga: 335,
      tglTransaksi: '2017-02-02',
      warna: 'Silver',
      jarakMeter: 25000,
      lokasi: 'DKI Jakarta',
    ),
    DataModel(
      harga: 300,
      tglTransaksi: '2017-04-20',
      warna: 'Putih',
      jarakMeter: 26000,
      lokasi: 'Bandung',
    ),
    DataModel(
      harga: 200,
      tglTransaksi: '2018-03-03',
      warna: 'Abu-Abu',
      jarakMeter: 40000,
      lokasi: 'DKI Jakarta',
    ),
  ];
  CarouselController caroController = CarouselController();
  String _selectIndex = '0';

  int get dataLength {
    return _mobil.length;
  }

  List<DataModel> get dataTransaksi {
    return _mobil;
  }

  void changeSlider(int pageIndex) {
    caroController.animateToPage(pageIndex);
  }

  void updateSelectIndex(String newValue) {
    _selectIndex = newValue;
    notifyListeners();
  }

  String get dataIndex {
    return _selectIndex;
  }
}
