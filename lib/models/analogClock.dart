import 'dart:async';
import 'dart:math';

import 'package:analog_clock/constants.dart';
import 'package:analog_clock/models/clock.dart';
import 'package:analog_clock/models/themeModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class AnalogClock extends StatefulWidget {
  AnalogClock({Key? key}) : super(key: key);

  @override
  _AnalogClockState createState() => _AnalogClockState();
}

class _AnalogClockState extends State<AnalogClock> {
  DateTime _dateTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1),
        (timer) => setState(() => _dateTime = DateTime.now()));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: AspectRatio(
            aspectRatio: 1.3,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 0),
                    blurRadius: 64,
                    color: kShadowColor.withOpacity(0.14),
                  ),
                ],
              ),
              child: Transform.rotate(
                angle: -pi / 2,
                child: CustomPaint(
                  painter: ClockPainter(context, _dateTime),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 50,
          left: 0,
          right: 0,
          child: Consumer<ThemeModel>(
            builder: (context, theme, child) => GestureDetector(
              onTap: () => theme.cahngeTheme(),
              child: SvgPicture.asset(
                theme.isLight
                    ? "assets/icons/Sun.svg"
                    : "assets/icons/Moon.svg",
                color: Colors.pink,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
