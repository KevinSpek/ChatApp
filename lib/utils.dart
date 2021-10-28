import 'package:flutter/material.dart';
import 'dart:math';
import 'package:groupidy/responsive/device_screen_type.dart';
import 'package:groupidy/view/components/general_dialog.dart';

DeviceScreenType getDeviceType(MediaQueryData mediaQuery) {
  double deviceWidth = mediaQuery.size.width;

  if (deviceWidth > 950) {
    return DeviceScreenType.Desktop;
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
  String completeZero(String str) => str.length == 1 ? '0' + str : str;

  String hour = '${date.hour}';
  String minute = '${date.minute}';

  return '${completeZero(hour)}:${completeZero(minute)}';
}

void dialog({required BuildContext context, required Widget child}) {
  showDialog(
    barrierColor: Colors.black.withOpacity(0.3),
    context: context,
    builder: (_) => GeneralDialog(
      child: child,
    ),
  );
}

void showToast(BuildContext context, String message) {
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(
    SnackBar(
      content: Text(message),
    ),
  );
}

bool isPhoneValid(String value) {
  String patttern = r'(^(?:[+0]9)?[0-9]{9,12}$)';
  RegExp regExp = new RegExp(patttern);
  if (!regExp.hasMatch(value)) {
    return false;
  }
  return true;
}

bool isNicknameValid(String value) {
  var validCharacters = RegExp(r'[a-zA-Z][a-zA-Z0-9]+$');
  if (value.length < 4 || !validCharacters.hasMatch(value)) {
    return false;
  }
  return true;
}

String tagGenerator() {
  int tagLength = 4;
  String chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
  Random rnd = Random();
  return List.generate(tagLength, (index) => chars[rnd.nextInt(chars.length)]).join();
}
