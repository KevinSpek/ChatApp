import 'package:flutter/material.dart';
import 'package:chatapp/colors.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    Key? key,
    this.onPressed,
    required this.icon,
    this.color,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final IconData icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed ?? null,
      disabledColor: kWhiteDisabled,
      color: kWhite,
      mouseCursor: onPressed == null ? SystemMouseCursors.basic : SystemMouseCursors.click,
      icon: Icon(
        icon,
      ),
    );
  }
}
