import 'package:flutter/material.dart';

import 'package:groupidy/responsive/device_screen_type.dart';

DeviceScreenType getDeviceType(MediaQueryData mediaQuery) {
  double deviceWidth = mediaQuery.size.shortestSide;

  if (deviceWidth > 950) {
    return DeviceScreenType.Tablet;
  } else if (deviceWidth > 600) {
    return DeviceScreenType.Tablet;
  } else {
    return DeviceScreenType.Mobile;
  }
}

String capitalize(String string) {
  if (string.isEmpty) {
    return string;
  }

  return string[0].toUpperCase() + string.substring(1);
}

String presentTime(DateTime date) {
  String completeZero(String str) {
    if (str.length == 1) {
      return '0${str}';
    }
    return str;
  }

  String hour = '${date.hour}';
  String minute = '${date.minute}';

  return '${completeZero(hour)}:${completeZero(minute)}';
}
