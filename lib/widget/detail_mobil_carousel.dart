import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constant.dart';
import '../change_state.dart';

class DetailMobilCarousel extends StatefulWidget {
  const DetailMobilCarousel({Key? key}) : super(key: key);

  @override
  _DetailMobilCarouselState createState() => _DetailMobilCarouselState();
}

class _DetailMobilCarouselState extends State<DetailMobilCarousel> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ChangeState>(
      builder: (context, data, _) {
        var dataTransaksi = data.dataTransaksi;
        return CarouselSlider.builder(
          carouselController: data.caroController,
          itemCount: data.dataLength,
          itemBuilder: (context, itemIndex, pageViewIndex) {
            return Container(
              padding: const EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                color: Color(0xffc7c91c),
                borderRadius: BorderRadius.circular(7),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'Detail Toyota Camry 2.5 V',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  kHeightSpace10,
                  BarisIsiCarousel(
                    propData: 'Harga :',
                    isiData: 'Rp. ${dataTransaksi[itemIndex].harga},000,000',
                  ),
                  BarisIsiCarousel(
                    propData: 'Jarak Pakai :',
                    isiData: '${dataTransaksi[itemIndex].jarakMeter} KM',
                  ),
                  BarisIsiCarousel(
                    propData: 'Warna :',
                    isiData: dataTransaksi[itemIndex].warna,
                  ),
                  BarisIsiCarousel(
                    propData: 'Tgl Transaksi :',
                    isiData: dataTransaksi[itemIndex].convertTime,
                  ),
                  BarisIsiCarousel(
                    propData: 'Lokasi :',
                    isiData: dataTransaksi[itemIndex].lokasi,
                  ),
                ],
              ),
            );
          },
          options: CarouselOptions(
            height: 200,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              // TODO: Buat fungsi yang memilih data di chart
              print(index);
            },
          ),
        );
      },
    );
  }
}

class BarisIsiCarousel extends StatelessWidget {
  const BarisIsiCarousel({
    Key? key,
    required this.propData,
    required this.isiData,
  }) : super(key: key);

  final String propData;
  final String isiData;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          propData,
          style: kCarouselTextStyle,
        ),
        Text(
          isiData,
          style: kCarouselTextStyle,
        ),
      ],
    );
  }
}
