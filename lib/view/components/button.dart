import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:groupidy/constants.dart';

import '../../../colors.dart';
import '../../../typography.dart';

class Button extends StatelessWidget {
  final onPressed;
  final text;
  final double? width;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? margin;
  final bool standout;
  final bool showBackground;
  final Color backgroundColor;

  const Button({
    Key? key,
    @required this.onPressed,
    @required this.text,
    this.width,
    this.margin,
    this.textStyle,
    this.standout = true,
    this.showBackground = true,
    this.backgroundColor = kAccentColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: width,
      height: kButtonHeight,
      child: TextButton(
        onPressed: onPressed,
        child: Text(text, style: textStyle == null ? kBodyLarge.copyWith(color: Colors.white) : textStyle),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(showBackground
                ? standout
                    ? backgroundColor
                    : kSecondaryBubble
                : Colors.transparent)),
      ),
    );
  }
}
