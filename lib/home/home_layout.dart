import 'package:flutter/material.dart';
import 'package:rent_car_ui_design/home/car_carousel.dart';
import 'package:rent_car_ui_design/main.dart';

import 'custom_bottom_sheet.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        CarDetailsAnimation(),
        CustomBottomSheet(),
      ],
    );
  }
}

class CarDetailsAnimation extends StatefulWidget {
  const CarDetailsAnimation({super.key});

  @override
  State<CarDetailsAnimation> createState() => _CarDetailsAnimationState();
}

class _CarDetailsAnimationState extends State<CarDetailsAnimation> {
  Widget _carTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
              style: const TextStyle(color: Colors.white, fontSize: 38),
              children: [
                TextSpan(text: currentCar.companyName),
                const TextSpan(text: '\n'),
                TextSpan(
                  text: currentCar.carName,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ]),
        ),
        const SizedBox(
          height: 10,
        ),
        RichText(
          text: TextSpan(
            style: const TextStyle(fontSize: 16),
            children: [
              TextSpan(
                text: currentCar.price.toString(),
                style: TextStyle(color: Colors.grey[20]),
              ),
              const TextSpan(
                text: ' / day',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 30),
          child: _carTitle(),
        ),

        const SizedBox(
          width: double.infinity,
          child: CarCarousel(),
        ),
      ],
    );
  }
}
