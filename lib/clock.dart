import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart'; // Add this import statement

class Clock extends StatefulWidget {
  const Clock({Key? key}) : super(key: key);

  @override
  State<Clock> createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  Timer? timer;
  late DateTime currentTime;

  @override
  void initState() {
    super.initState();
    currentTime = DateTime.now();
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        currentTime = DateTime.now();
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double secondsAngle = (2 * pi / 60) * currentTime.second;
    final double minutesAngle = (2 * pi / 60) * currentTime.minute;
    final double hoursAngle = (2 * pi / 12) * (currentTime.hour % 12) +
        (2 * pi / (12 * 60)) * currentTime.minute;
    final currentDate = DateFormat('EEE, MMM d, yyyy')
        .format(currentTime); // Format the current date
    final currentTimeString = DateFormat('HH:mm:ss').format(DateTime.now());
    // Set the status bar color and brightness
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.blue, // Set the status bar color
      statusBarBrightness: Brightness.dark, // Set the status bar icon color
    ));
    return Scaffold(
      appBar: AppBar(
        title: Text(
          currentDate,
          style: const TextStyle(
            fontSize: 24, // Set the font size
            color: Colors.blue,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 173, 238, 32),
      ),
      body: Column(
          //
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                alignment: Alignment.center,
                child: Container(
                  width: 360,
                  height: 360,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 126, 177, 60),
                    border: Border.all(color: Colors.black45, width: 9),
                    borderRadius: BorderRadius.circular(180),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Image.network(
                        'https://png.pngtree.com/png-clipart/20220705/ourmid/pngtree-clock-face-no-hand-roboto-font-png-image_5683165.png',
                      ),
                      // Hour
                      Transform.rotate(
                        angle: hoursAngle,
                        alignment: Alignment.center,
                        child: Container(
                          alignment: Alignment(0, -0.35),
                          child: Container(
                            height: 80,
                            width: 8,
                            decoration: BoxDecoration(
                              color: Colors.pink,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      // Minutes
                      Transform.rotate(
                        angle: minutesAngle,
                        alignment: Alignment.center,
                        child: Container(
                          alignment: Alignment(0, -0.45),
                          child: Container(
                            height: 110,
                            width: 5,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      // Seconds
                      Transform.rotate(
                        angle: secondsAngle,
                        alignment: Alignment.center,
                        child: Container(
                          alignment: Alignment(0, -0.40),
                          child: Container(
                            height: 140,
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
                        alignment: Alignment.center,
                        child: Container(
                          height: 15,
                          width: 15,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 120,
                        bottom: 100,
                        //right: 50,
                        child: Text(
                          "${currentTimeString}",
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      )
                    ],
                  ),
                )),
          ]),
    );
  }
}
