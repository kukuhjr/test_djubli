import '/change_state.dart';
import '/constant.dart';
import '/widget/chart_mobil.dart';
import '/widget/detail_mobil_carousel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: ChangeNotifierProvider<ChangeState>(
        create: (context) => ChangeState(),
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.teal[900],
            title: Row(children: const [
              Icon(Icons.directions_car_outlined),
              SizedBox(
                width: 5,
              ),
              Text(
                'DjuBli',
                style: TextStyle(fontSize: 22),
              )
            ]),
            actions: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(
                        Icons.search,
                        color: Colors.teal[900],
                      ),
                      const SizedBox(width: 5),
                      Text(
                        'Cari Mobil',
                        style: TextStyle(color: Colors.teal[900]),
                      ),
                    ],
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.teal[200]),
                  ),
                ),
              )
            ],
          ),
          body: SafeArea(
            child: DefaultTabController(
              length: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 15.0, vertical: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TabBar(
                      tabs: const [
                        Tab(text: 'Sedan'),
                        Tab(text: 'SUV'),
                        Tab(text: 'MPV'),
                      ],
                      labelColor: Colors.teal[900],
                      labelStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      indicatorColor: Colors.teal[900],
                      indicatorWeight: 3,
                    ),
                    kHeightSpace10,
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
                    kHeightSpace10,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
