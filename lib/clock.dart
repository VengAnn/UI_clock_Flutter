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
  Color color = Colors.green;

  List<Color> lsColors = [
    Colors.black,
    Colors.white,
    Colors.pink,
    Colors.green,
    Colors.blueGrey,
    Colors.redAccent,
    Colors.cyan,
  ];
  @override
  void initState() {
    super.initState();
    currentTime = DateTime.now();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        currentTime = DateTime.now();

        //genarate colors radom
        color = lsColors[Random().nextInt(lsColors.length)];
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
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.orangeAccent, // Set the status bar color
      statusBarBrightness: Brightness.dark, // Set the status bar icon color
    ));
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          alignment: Alignment.topRight,
          child: Image.network(
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ65i9VfqLfb9OWP2gtcvZ8vj1I0gTlaB0wXA&usqp=CAU",
            fit: BoxFit.contain,
          ),
        ),
        title: Text(
          "${currentDate}",
          style: const TextStyle(
            fontSize: 24, // Set the font size
            color: Colors.blue,
          ),
        ),
        backgroundColor: color,
        leading: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.home),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.home),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.shop),
              iconSize: 50,
              color: Colors.blue,
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.white,
        //color:  color, //color is the obj random color by ann created;on top or above
        child: Column(
            //
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  alignment: Alignment.center,
                  child: Container(
                    width: 360,
                    height: 360,
                    decoration: BoxDecoration(
                      color: color,
                      border: Border.all(
                          color: const Color.fromARGB(115, 202, 20, 20),
                          width: 9),
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
                            alignment: const Alignment(0, -0.35),
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
                            alignment: const Alignment(0, -0.45),
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
                            alignment: const Alignment(0, -0.40),
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
      ),
    );
  }
}
