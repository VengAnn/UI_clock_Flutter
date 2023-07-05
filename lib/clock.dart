import 'package:flutter/material.dart';

class Clock extends StatefulWidget {
  const Clock({Key? key}) : super(key: key);

  @override
  State<Clock> createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  double minutesAngle = 0;
  double secondsAngle = 0;
  double hoursAngle = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(8, 25, 35, 1),
      alignment: const Alignment(0, 0),
      child: Container(
        width: 370,
        height: 370,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black45, width: 9),
            borderRadius: BorderRadius.circular(200)),
        child: Stack(
          children: <Widget>[
            Image.network(
              'https://png.pngtree.com/png-clipart/20220705/ourmid/pngtree-clock-face-no-hand-roboto-font-png-image_5683165.png',
            ),
            //Hour
            Transform.rotate(
              angle: hoursAngle,
              child: Container(
                alignment: Alignment(0, -0.40),
                child: Container(
                  height: 80,
                  width: 10,
                  decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),

            //Minutes
            Transform.rotate(
              angle: minutesAngle,
              child: Container(
                alignment: Alignment(0, -0.40),
                child: Container(
                  height: 100,
                  width: 5,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            // Seconds
            Transform.rotate(
              angle: secondsAngle,
              child: Container(
                alignment: Alignment(0, -0.40),
                child: Container(
                  height: 150,
                  width: 2,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            // Dot
            Container(
              alignment: Alignment(0, 0),
              child: Container(
                height: 15,
                width: 15,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
