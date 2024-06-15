import 'package:flutter/material.dart';

import '../screen/view/digital/digital.dart';
import '../screen/view/stop_watch/stopwatch.dart';

class Routes {
  static String digitalClock = '/';
  static String StopWatchh = 'StopWatchh';
  static String strapwatch = 'strapwatch';

  static Map<String, WidgetBuilder> myRoutes = {
    digitalClock: (context) => const DigitalClock(),
    StopWatchh: (context) => const StopWatch(),
  };
}
