import 'package:flutter/material.dart';
import 'package:rent_car_ui_design/home/home_layout.dart';
import 'package:rent_car_ui_design/models/car.dart';

void main() {
  runApp(const MyApp());
}

var currentCar = carList.cars[0];

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainApp(),
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Container(
          margin: const EdgeInsets.only(left: 25),
          child: const Icon(Icons.arrow_back, color: Colors.white,),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 25),
            child: const Icon(Icons.favorite_border, color: Colors.white,),
          )
        ],
      ),
      backgroundColor: Colors.black,
      body: const HomeLayout(),
    );
  }
}
