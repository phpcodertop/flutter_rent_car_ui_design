import 'package:flutter/material.dart';
import 'package:rent_car_ui_design/main.dart';

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({super.key});

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet>
    with SingleTickerProviderStateMixin {
  late Animation animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 250,
      ),
    );

    animation = Tween<double>(begin: sheetTop, end:  minSheetTop)
        .animate(
      CurvedAnimation(parent: controller, curve: Curves.easeInOut),
    )..addListener(() { setState(() {}); });
    setState(() {

    });
    // controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  double sheetTop = 400;
  double minSheetTop = 30;
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: animation.value,
      left: 0,
      child: GestureDetector(
        onVerticalDragEnd: (DragEndDetails dragEndDetails) {
          if(dragEndDetails.primaryVelocity! < 0.0) {
            controller.forward();
          } else if (dragEndDetails.primaryVelocity! > 0.0) {
            controller.reverse();
          } else {
            return;
          }
        },
        onTap: () {
          controller.isCompleted ? controller.reverse() : controller.forward();
        },
        child: const SheetContainer(),
      ),
    );
  }
}

class SheetContainer extends StatelessWidget {
  final double sheetItemHeight = 110;

  const SheetContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 25),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Color(0xfff1f1f1),
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(40),
        ),
      ),
      child: Column(
        children: [
          _drawHandle(),
          Expanded(
            flex: 1,
            child: ListView(
              children: [
                _setupListViewItem(
                  title: 'Offer Details',
                  items: currentCar.offerDetails,
                ),
                _setupListViewItem(
                    title: 'Specifications',
                    items: currentCar.specifications,
                    twoLines: true),
                _setupListViewItem(
                  title: 'Features',
                  items: currentCar.features,
                ),
                const SizedBox(
                  height: 200,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _drawHandle() {
    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      height: 3,
      width: 65,
      decoration: BoxDecoration(
        color: const Color(0xffd9dbdb),
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}

_setupListViewItem(
    {required String title,
    required List<Map<Icon, dynamic>> items,
    twoLines = false}) {
  const double sheetItemHeight = 120;
  return Container(
    padding: const EdgeInsets.only(top: 15, left: 40),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
        Container(
          height: sheetItemHeight,
          margin: const EdgeInsets.only(top: 15),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            itemBuilder: (context, index) {
              return AppListItem(
                  item: items[index],
                  height: sheetItemHeight,
                  isTwoLines: twoLines);
            },
          ),
        ),
      ],
    ),
  );
}

class AppListItem extends StatelessWidget {
  final Map<Icon, dynamic> item;
  final double height;
  final bool isTwoLines;

  const AppListItem({
    super.key,
    required this.item,
    required this.height,
    this.isTwoLines = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      padding: const EdgeInsets.all(10),
      height: height,
      width: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          item.keys.elementAt(0),
          ..._renderStrings(item, isTwoLines),
        ],
      ),
    );
  }

  _renderStrings(dynamic item, bool twolines) {
    if (twolines) {
      return [
        Text(
          item.values.elementAt(0).keys.toString(),
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 13,
          ),
        ),
        Text(
          item.values.elementAt(0).values.toString(),
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 13,
          ),
        ),
      ];
    } else {
      return [
        Text(
          item.values.elementAt(0),
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
        ),
      ];
    }
  }
}
