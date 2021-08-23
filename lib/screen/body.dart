import 'package:analog_clock/models/analogClock.dart';
import 'package:analog_clock/models/digitalClock.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Text(
            'Cairo , Egypt',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          DigitalClock(),
          AnalogClock(),
        ],
      ),
    );
  }
}
