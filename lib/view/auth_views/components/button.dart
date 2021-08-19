import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:groupidy/constants.dart';

import '../../../colors.dart';
import '../../../typography.dart';



class Button extends StatelessWidget {
  final onPressed;
  final text;
  final width;

  const Button({Key? key, @required this.onPressed, @required this.text, @required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: buttonHeight,
      child: TextButton(
        onPressed: onPressed,
        child: Text(text, style: kBodyLarge.copyWith(color: Colors.white)),
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(kAccentColor)),
      ),
    );
  }
}
