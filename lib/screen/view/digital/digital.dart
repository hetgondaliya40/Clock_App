import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import '../../../routes/routes.dart';

class DigitalClock extends StatefulWidget {
  const DigitalClock({super.key});

  @override
  State<DigitalClock> createState() => _DigitalClockState();
}

class _DigitalClockState extends State<DigitalClock> {
  bool digitalSwitch = false;
  bool analogSwitch = false;
  bool strapSwitch = false;

  TimeOfDay time = TimeOfDay.now();
  DateTime dateTime = DateTime.now();
  String? dropdown;
  List day = [
    "Mon",
    "Tue",
    "Wed",
    "Thu",
    "Fri",
    "Sat",
    "Sun",
  ];
  List month = [
    "Jan",
    "Fab",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Des"
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(
      Duration(seconds: 1),
      (timer) {
        if (time.minute != TimeOfDay.now().minute) {
          setState(() {
            time = TimeOfDay.now();
          });
        }
      },
    );
  }

  Widget build(BuildContext context) {
    TextScaler textScaler = MediaQuery.of(context).textScaler;
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black38,
        foregroundColor: Colors.white,
        title: Text(
          "Clock App",
          style: TextStyle(color: Colors.white),
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(),
              accountName: Text("Het Gondaliya"),
              accountEmail: Text("hetgondaliya104@gmail.com"),
            ),
            ListTile(
              leading: Text(
                "01.",
                style: TextStyle(
                  fontSize: textScaler.scale(20),
                ),
              ),
              title: Text(
                "Digital Clock",
                style: TextStyle(
                  fontSize: textScaler.scale(22),
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: Theme(
                data: ThemeData(
                  useMaterial3: true,
                ),
                child: Switch(
                  value: digitalSwitch,
                  onChanged: (val) {
                    digitalSwitch = val;
                    setState(() {});
                  },
                ),
              ),
            ),
            ListTile(
              leading: Text(
                "02.",
                style: TextStyle(
                  fontSize: textScaler.scale(20),
                ),
              ),
              title: Text(
                "Analog Clock",
                style: TextStyle(
                  fontSize: textScaler.scale(22),
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: Theme(
                data: ThemeData(
                  useMaterial3: true,
                ),
                child: Switch(
                  value: analogSwitch,
                  onChanged: (val) {
                    analogSwitch = val;
                    setState(() {});
                  },
                ),
              ),
            ),
            ListTile(
              leading: Text(
                "03.",
                style: TextStyle(
                  fontSize: textScaler.scale(20),
                ),
              ),
              title: Text(
                "Strap Watch",
                style: TextStyle(
                  fontSize: textScaler.scale(22),
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: Theme(
                data: ThemeData(
                  useMaterial3: true,
                ),
                child: Switch(
                  value: strapSwitch,
                  onChanged: (val) {
                    strapSwitch = val;
                    setState(() {});
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Container(
            //   height: double.infinity,
            //   width: double.infinity,
            //   child: Column(
            //     children: [
            //       Image.network(
            //         "https://marketplace.canva.com/EAEtlMvlBDg/1/0/900w/canva-pastel-peach-watercolour-mobile-phone-wallpaper--8ZGLXxywc8.jpg",
            //         fit: BoxFit.cover,
            //       ),
            //     ],
            //   ),
            // ),
            Visibility(
              visible: digitalSwitch,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${(time.hour % 12).toString().padLeft(2, "0")}:${(time.minute).toString().padLeft(2, "0")}",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: textScaler.scale(65),
                        ),
                      ),
                      (time == DayPeriod)
                          ? const Text(
                              "  AM",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            )
                          : const Text(
                              "  PM",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                    ],
                  ),
                  Text(
                    "${day[dateTime.weekday - 1]} , ${dateTime.day} ${month[dateTime.month - 1]} ${dateTime.year}",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: textScaler.scale(20)),
                  ),
                  // SizedBox(height:  h * 0.01,),
                  // Divider(
                  //   endIndent: w * 0.1,
                  //   indent: w * 0.1,
                  // ),
                ],
              ),
            ),
            Visibility(
              visible: analogSwitch,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  const CircleAvatar(
                    radius: 190,
                    backgroundColor: Colors.white24,
                  ),
                  ...List.generate(
                    60,
                    (index) => Transform.rotate(
                      angle: (index * (pi * 2)) / 60,
                      child: Divider(
                        color: (index % 5 == 0)
                            ? Colors.blueGrey[100]
                            : Colors.cyan,
                        thickness: 2,
                        endIndent: (index % 5 == 0) ? w * 0.84 : w * 0.875,
                      ),
                    ),
                  ),

                  //min
                  Transform.rotate(
                    angle: pi / 2,
                    child: Transform.rotate(
                      angle: (time.minute * (pi * 2)) / 60,
                      child: Divider(
                        indent: w * 0.18,
                        endIndent: w * 0.43,
                        thickness: 3,
                        color: Colors.cyan,
                      ),
                    ),
                  ),

                  //hour
                  Transform.rotate(
                    angle: pi / 2,
                    child: Transform.rotate(
                      angle:
                          (time.hour % 12 + (time.minute / 60)) * (pi * 2) / 12,
                      child: Divider(
                        indent: w * 0.26,
                        endIndent: w * 0.43,
                        thickness: 2,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(Routes.StopWatchh);
                    },
                    child: const CircleAvatar(
                      child: Icon(
                        Icons.watch_later,
                        size: 31,
                        color: Colors.cyan,
                      ),
                      radius: 15,
                      backgroundColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            // SizedBox(height:  h * 0.1,),
            // Padding(
            //   padding: const EdgeInsets.only(top: 590.0),
            //   child: Column(
            //     children: [
            //       Text("${dropdown}"),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
