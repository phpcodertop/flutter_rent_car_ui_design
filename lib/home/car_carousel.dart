import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:rent_car_ui_design/main.dart';

class CarCarousel extends StatefulWidget {
  const CarCarousel({super.key});

  @override
  State<CarCarousel> createState() => _CarCarouselState();
}

class _CarCarouselState extends State<CarCarousel> {
  static final List<String> imgList = currentCar.imgList;
  int _current = 0;

  static List _map(List list, Function handler) {
    List result = [];

    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  final List<Widget>? child = _map(imgList, (index, String assetName) {
    return Container(
      child: Image.asset(
        'assets/$assetName',
        fit: BoxFit.fitWidth,
      ),
    );
  }).cast<Widget>().toList();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: child,
          options: CarouselOptions(
            height: 250,
            viewportFraction: 1.0,
            onPageChanged: (index, onChangeReason) {
              setState(() {
                _current = index;
              });
            }
          ),
        ),

        Container(
          margin: const EdgeInsets.only(left: 30),
          child: Row(
            children: _map(imgList, (index, assetName) {
              return Container(
                width: 50,
                height: 2,
                decoration: BoxDecoration(
                  color: _current == index ? Colors.grey[100] : Colors.grey[600]
                ),
              );
            }).cast<Widget>().toList(),
          ),
        ),
      ],
    );
  }
}
