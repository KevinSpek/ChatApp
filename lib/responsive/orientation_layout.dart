import 'package:flutter/material.dart';

class OrientationLayout extends StatelessWidget {
  const OrientationLayout({
    Key? key,
    this.landsacep,
    required this.portrait,
  }) : super(key: key);

  final Widget? landsacep;
  final Widget portrait;

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    if (orientation == Orientation.landscape) {
      return landsacep ?? portrait;

    }
    return portrait;
  }
}
