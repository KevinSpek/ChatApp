import 'package:flutter/material.dart';
import 'package:chatapp/constants.dart';

class GeneralDialog extends StatelessWidget {
  const GeneralDialog({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(kRadius)),
      elevation: 16,
      backgroundColor: Colors.transparent,
      child: child,
    );
  }
}
