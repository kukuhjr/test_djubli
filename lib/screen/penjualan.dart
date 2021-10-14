import 'package:flutter/material.dart';
import 'package:test_djubli/widget/chart_mobil.dart';
import 'package:test_djubli/widget/detail_mobil_carousel.dart';

import '../constant.dart';

class Penjualan extends StatelessWidget {
  const Penjualan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "Toyota Camry 2.5 V",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          '< 2010 >',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        kHeightSpace10,
        Flexible(child: ChartMobil()),
        kHeightSpace10,
        Flexible(child: DetailMobilCarousel()),
      ],
    );
  }
}
