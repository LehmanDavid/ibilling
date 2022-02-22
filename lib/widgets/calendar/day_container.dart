import 'package:flutter/material.dart';
import 'package:ibilling/themes/colors.dart';

class DayContainer extends StatelessWidget {
  final isActive;
  final day;
  final date;
  final width;

  const DayContainer({
    Key? key,
    this.isActive,
    this.day,
    this.date,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constrain) => Container(
              decoration: BoxDecoration(
                color: isActive
                    ? BillingColor.lightGreenColor
                    : Colors.transparent,
                borderRadius: const BorderRadius.all(Radius.circular(6)),
              ),
              margin: EdgeInsets.symmetric(horizontal: width),
              height: 72,
              width: 46,
              child: Column(
                children: [
                  SizedBox(height: constrain.maxHeight * 0.025),
                  Text(
                    day,
                    style: const TextStyle(color: const Color(0xFFD1D1D1)),
                  ),
                  SizedBox(height: constrain.maxHeight * 0.15),
                  Text(date, style: const TextStyle(color: Color(0xFFD1D1D1))),
                  SizedBox(height: constrain.maxHeight * 0.025),
                  const Text('_', style: TextStyle(color: Color(0xFFD1D1D1))),
                ],
              ),
            ));
  }
}
