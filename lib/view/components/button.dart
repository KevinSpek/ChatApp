import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:groupidy/constants.dart';

import '../../../colors.dart';
import '../../../typography.dart';

class Button extends StatelessWidget {
  final onPressed;
  final text;
  final width;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? margin;

  const Button(
      {Key? key,
      @required this.onPressed,
      @required this.text,
      @required this.width,
      this.margin,
      this.textStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: width,
      height: kButtonHeight,
      child: TextButton(
        onPressed: onPressed,
        child: Text(text,
            style: textStyle == null
                ? kBodyLarge.copyWith(color: Colors.white)
                : textStyle),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(kAccentColor)),
      ),
    );
  }
}
