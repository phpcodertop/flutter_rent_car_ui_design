import 'package:flutter/material.dart';

class Car {
  final String companyName;
  final String carName;
  final double price;
  final List<String> imgList;
  final List<Map<Icon, String>> offerDetails;
  final List<Map<Icon, Map<String, String>>> specifications;
  final List<Map<Icon, String>> features;

  const Car({
    required this.companyName,
    required this.carName,
    required this.price,
    required this.imgList,
    required this.offerDetails,
    required this.specifications,
    required this.features,
  });
}

class CarList {
  final List<Car> cars;

  const CarList({required this.cars});
}

double iconSize = 30;

CarList carList = CarList(
  cars: [
    Car(
      companyName: "Chevrolet",
      carName: "Corvette",
      price: 2100,
      imgList: [
        "corvette_front.png",
        "corvette_back.png",
        "interior1.png",
        "interior2.png",
        "corvette_front2.png",
      ],
      offerDetails: [
        {Icon(Icons.bluetooth, size: iconSize): "Automatic"},
        {Icon(Icons.airline_seat_individual_suite, size: iconSize): "4 seats"},
        {Icon(Icons.pin_drop, size: iconSize): "6.4L"},
        {Icon(Icons.shutter_speed, size: iconSize): "5HP"},
        {Icon(Icons.invert_colors, size: iconSize): "Variant Colours"},
      ],
      specifications: [
        {
          Icon(Icons.av_timer, size: iconSize): {"Milegp(upto)": "14.2 kmpl"}
        },
        {
          Icon(Icons.power, size: iconSize): {"Engine(upto)": "3996 cc"}
        },
        {
          Icon(Icons.assignment_late, size: iconSize): {"BHP": "700"}
        },
        {
          Icon(Icons.account_balance_wallet, size: iconSize): {
            "More Specs": "14.2 kmpl"
          }
        },
        {
          Icon(Icons.cached, size: iconSize): {"More Specs": "14.2 kmpl"}
        },
      ],
      features: [
        {Icon(Icons.bluetooth, size: iconSize): "Bluetooth"},
        {Icon(Icons.usb, size: iconSize): "USB Port"},
        {Icon(Icons.power_settings_new, size: iconSize): "Keyless"},
        {Icon(Icons.android, size: iconSize): "Android Auto"},
        {Icon(Icons.ac_unit, size: iconSize): "AC"},
      ],
    ),
    Car(
      companyName: "Lamborghini",
      carName: "Aventador",
      price: 3000,
      imgList: [
        "lambo_front.png",
        "interior_lambo.png",
        "lambo_back.png",
      ],
      offerDetails: [
        {Icon(Icons.bluetooth, size: iconSize): "Automatic"},
        {Icon(Icons.bluetooth, size: iconSize): "4 seats"},
        {Icon(Icons.bluetooth, size: iconSize): "6.4L"},
        {Icon(Icons.bluetooth, size: iconSize): "5HP"},
        {Icon(Icons.bluetooth, size: iconSize): "Variant Colours"},
      ],
      specifications: [
        {
          Icon(Icons.bluetooth, size: iconSize): {"Milegp(upto)": "14.2 kmpl"}
        },
        {
          Icon(Icons.bluetooth, size: iconSize): {"Engine(upto)": "3996 cc"}
        },
        {
          Icon(Icons.bluetooth, size: iconSize): {"BHP": "700"}
        },
        {
          Icon(Icons.bluetooth, size: iconSize): {"Milegp(upto)": "14.2 kmpl"}
        },
        {
          Icon(Icons.bluetooth, size: iconSize): {"Milegp(upto)": "14.2 kmpl"}
        },
      ],
      features: [
        {Icon(Icons.bluetooth, size: iconSize): "Bluetooth"},
        {Icon(Icons.bluetooth, size: iconSize): "USB Port"},
        {Icon(Icons.bluetooth, size: iconSize): "Keyless"},
        {Icon(Icons.bluetooth, size: iconSize): "Android Auto"},
        {Icon(Icons.bluetooth, size: iconSize): "AC"},
      ],
    ),
  ],
);
