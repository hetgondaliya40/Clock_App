import 'package:flutter/material.dart';

class StopWatch extends StatefulWidget {
  const StopWatch({super.key});

  @override
  State<StopWatch> createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
  int hh = 0;

  int mm = 0;

  int ss = 0;

  bool isStop = true;

  void clockTimer() async {
    isStop = true;
    await Future.delayed(const Duration(milliseconds: 100), () {
      ss++;
      if (isStop) {
        ss++;
      }
      if (ss > 59) {
        ss = 0;
        mm++;
      }
      if (mm > 59) {
        mm = 0;
        hh++;
      }
      if (hh >= 12) {
        hh = 0;
      }
      setState(() {});
    });
    if (isStop) {
      clockTimer();
    }
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.sizeOf(context).height;
    double w = MediaQuery.sizeOf(context).width;
    TextScaler textScaler = MediaQuery.textScalerOf(context);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: const Text(
          "Stop Watch",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Transform.scale(
                scale: 5,
                child: CircularProgressIndicator(
                  strokeWidth: 1.5,
                  value: ss / 60,
                ),
              ),
              Text(
                "${(hh).toString().padLeft(2, "0")} : ${(mm).toString().padLeft(2, "0")} : ${(ss).toString().padLeft(2, "0")}",
                // style: GoogleFonts.merriweather().copyWith(
                //   fontSize: 30,
                //   color: Colors.white,
                // ),
              ),
            ],
          ),
          SizedBox(
            height: h * 0.12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xffEFF9FF),
                  shadowColor: Color(0xff3f6080),
                ),
                onPressed: () {
                  if (!isStop) {
                    clockTimer();
                  }
                  setState(() {});
                },
                icon: Icon(Icons.play_arrow),
                label: Text("Start"),
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xffEFF9FF),
                  shadowColor: Color(0xff3f6080),
                ),
                onPressed: () {
                  isStop = false;
                  setState(() {});
                },
                icon: Icon(Icons.play_arrow),
                label: Text("Stop"),
              ),
            ],
          ),
          SizedBox(
            height: h * 0.02,
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xffEFF9FF),
              shadowColor: Color(0xff3f6080),
            ),
            onPressed: () {
              isStop = false;
              hh = mm = 0;
              ss = 0;
              setState(() {});
            },
            icon: Icon(Icons.restart_alt),
            label: Text("Restart"),
          ),
        ],
      ),
    );
  }
}
