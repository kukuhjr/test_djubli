import 'package:test_djubli/screen/penjualan.dart';

import '/change_state.dart';
import '/constant.dart';
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
      title: 'Test Djubli',
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
                      labelStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      indicatorColor: Colors.teal[900],
                      indicatorWeight: 3,
                    ),
                    kHeightSpace10,
                    const Flexible(
                      child: TabBarView(
                        children: [
                          Penjualan(),
                          Center(
                            child: Text("Maaf Data SUV Belum Tersedia"),
                          ),
                          Center(
                            child: Text("Maaf Data MPV Belum Tersedia"),
                          ),
                        ],
                      ),
                    ),
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
